from Numberjack import *
import sys
import re

class ConstraintSolver:
     min = None
     max = None
     
     variablesSet = set()
     
     numberZeroVariable=0
     
     
     def __init__(self):
      self.solver = None
      self.var ={}
      self.zero = {}
      self.model = Model()
      self.constraints = []
      
     def setEnviroment(self):
         for v in ConstraintSolver.variablesSet:
             self.var[v] = Variable(ConstraintSolver.min,ConstraintSolver.max,v)
         for i in range(ConstraintSolver.numberZeroVariable):
             self.zero[i]= Variable(0,0)
             
             
     def addConstraint(self,constraint):
          var = self.var
          zero = self.zero
          self.constraints.append(constraint)
          self.model.add(eval(constraint))        
        
        
     def addConstraints(self):
         var = self.var
         zero = self.zero
         for constraint in self.constraints:
             self.model.add(eval(constraint))
                           
                

     def solve(self):
         self.solver = self.model.load("Mistral")
         return self.solver.solve()
     
     def getSolution(self):
         for key in self.var:
             print key,":", self.var[key].get_value()
     
     def atLeastOneSolution(self,constraintList):
        t = ConstraintSolver()
        t.constraints=list(constraintList)
        t.setEnviroment()
        t.addConstraints()      
        #if debugPrint: print "try to get solution IIS 1", constraintList
        if t.solve() is False:
            return False
        return True
     
#      def computeIISBackwardForwardFiltering(self,backward):
# 
#         listConstraint=list(self.constraints)
#         if backward:
#             listConstraint.reverse()
#         lastIndex=len(listConstraint)
#         
#         c1ListConstraint =[]
#         while True:
#             #print "c1",c1ListConstraint
#             Tconstraints = list(c1ListConstraint)
#             for i in range(lastIndex):
#                 Tconstraints.append(listConstraint[i])
#                 if self.atLeastOneSolution(Tconstraints) is False:
#                     c1ListConstraint.append(listConstraint[i])
#                     lastIndex = i
#                     if self.atLeastOneSolution(c1ListConstraint) is False:
#                         self.resetCPSolver()
#                         return c1ListConstraint
#                     break
        
     
     def computeIISBackwardForwardFiltering(self,backward,lastConstraint):
        if debugPrint:print "computeIISBackwardForwardFiltering enter"
        listConstraint=list(self.constraints)
        if backward:
            listConstraint.reverse()
        lastIndex=len(listConstraint)
        c1 = ConstraintSolver()
        c1.setEnviroment()
        c1.addConstraint(lastConstraint)
        t = ConstraintSolver()
        #c1ListConstraint =[]
        while True:
            #print "c1",c1ListConstraint
            t.resetCPSolver()
            t.constraints = list (c1.constraints)
            t.setEnviroment()
            t.addConstraints()
#             #Tconstraints = list(c1ListConstraint)
            for i in range(lastIndex):
#                 t.resetCPSolver()
#                 t.constraints.append(listConstraint[i])
                t.addConstraint(listConstraint[i])
                if t.solve() is False:
#                     c1.constraints.append(listConstraint[i])
                    #c1ListConstraint.append(listConstraint[i])
                    c1.addConstraint(listConstraint[i])
                    lastIndex = i
                    if c1.solve() is False:
                        self.resetCPSolver()
                        self.addConstraints()
                        return c1.constraints
                    break
        return          
                
     
        
    
     def resetCPSolver(self):
          self.setEnviroment()
          self.model = Model()
          self.solver = None
        
     
     
# Start module casp                
ID_lits = []
ID_lev0 = []
dict = {}
regexVariableAndConstant = re.compile('([A-Za-z]+[\w,()]*|\d+,?|\-\d+,?)')
regexVariable = re.compile('[A-Za-z]+[\w,()]*')
regexOperator = re.compile('\$(\>=|\<=|\<|\>|\+|\*|\-|\/|\%|\==|\!=)')
constraintSolver = ConstraintSolver()
CONSTRAINT_ATOM_NAME = "__constraint("
debugEvaluationConstraint = False
debugPrint = True
doSimpAtLev0= False

# var e' l'id dell'atomo e name e' il suo nome
def addedVarName(var, name):
    if(name.startswith(CONSTRAINT_ATOM_NAME + '"$domain(')):
         setDomainFromString(name)
    elif name.startswith(CONSTRAINT_ATOM_NAME):
         ID_lits.append(var) 
         dict[var] = constraintAtomToString(name,False)
         #if debugPrint: print "variable", var, dict[var]
         ID_lits.append(-var)
         dict[-var]= constraintAtomToString(name, True)
         #if debugPrint: print "variable",-var, dict[-var]
         if  var in ID_lev0:
             if debugPrint: print "added lev 0", var, dict[var]
             constraintSolver.constraints.append(dict[var])
         elif -var in ID_lev0:
            if debugPrint: print "added lev 0",-var, dict[-var]
            constraintSolver.constraints.append(dict[-var])
    return

# invia come informazione se un atomo e' stato eliminato
def onAtomElimination(var):
    return

# restituisce i letterali per cui ti interessa la notifica del cambio di valore di verita'
def getLiterals(nVars):
    constraintSolver.setEnviroment()
    constraintSolver.addConstraints()
    return ID_lits

# definisce gli atomi da non eliminare
def getAtomsToFreeze():
    atoms = []
    return atoms

# nofica quando un letterale tra quelli indicati in getLiterals() diventa vero
# restituisce un insieme di letterali da inferire come true
reasons = []
def onLiteralTrue(lit, pos):
    output = []
    global reasons
    reasons = []
    if debugPrint: print "on lit true lit: ",lit, dict[lit]
    if dict[lit] not in constraintSolver.constraints:
        constraintSolver.addConstraint(dict[lit])
    
    ############# non dovrebbe accadere
    if dict[-lit] in constraintSolver.constraints:
        constraintSolver.constraints.remove(dict[-lit])
        constraintSolver.resetCPSolver()
        constraintSolver.addConstraints()
        if debugPrint: print "on lit true -lit ", -lit, " ",dict[-lit], "already presents"
    ###############################
    
#     constraintSolver.addConstraints()
    if debugPrint: print constraintSolver.constraints
    if debugPrint: print "try to get solution"
    #if debugPrint: print s
    if constraintSolver.solve() is False:
        if debugPrint:print "s is not sat" 
        if constraintSolver.atLeastOneSolution([dict[lit]]) is False:
            reasons.append(lit)
            output.append(-lit)
        else:
            iis = constraintSolver.computeIISBackwardForwardFiltering(False,dict[lit])
            if debugPrint:print "iis", iis
            if len(iis)==1:
                reasons.append(lit)
                output.append(-lit)
            else:
                for constraint in iis:
                    for id, constr in dict.iteritems():
                        if constr == constraint and id!=lit:
                            reasons.append(id)
                            if debugPrint:print "reason ",id, constr
                output.append(-lit)
        if debugPrint:print "output  ",output 
    else :
        if debugPrint:constraintSolver.getSolution()
    return output

# per ogni letterale inferito la ragione e' una clausola C. Il metodo restituisce C.
def getReason():
    if debugPrint:print "get Reason"
    if debugPrint:print reasons
    return reasons

def onLiteralsUndefined(*lits):
    if debugPrint: print "to remove constraints ",lits
    for lit in lits:
        if dict[lit] in constraintSolver.constraints:
            constraintSolver.constraints.remove(dict[lit])
            if debugPrint: print "removed constraint ",lit, dict[lit] 
    constraintSolver.resetCPSolver()
    constraintSolver.addConstraints()
    return

# notifica quando un letterale e' inferito true al livello 0
def onLitAtLevelZero(lit):
    ID_lev0.append(lit)
    if dict.get(lit) is not None and dict[lit] not in constraintSolver.constraints:
        if debugPrint: print lit, " at lev 0 ",dict[lit] 
        
        ################### non dovrebbe accadere
        if dict[-lit] in constraintSolver.constraints:
            if debugPrint: print "onLivAtLev0 removed ",-lit,dict[-lit]
            constraintSolver.constraints.remove(dict[-lit])
            constraintSolver.resetCPSolver()
            constraintSolver.addConstraints()
        ###########################
        
        
        constraintSolver.addConstraint(dict[lit])
    return

#prima di partire controlla se il programma e' incoerente per via del plugin
#0 se il programma non e' incoerente
#!= 0 se il programma e' coerente
def isProgramIncoherent():
    if debugPrint: print constraintSolver.constraints
    constraintSolver.addConstraints()
    
    if constraintSolver.solve() is False and len(constraintSolver.constraints)>0:
        if debugPrint: print "incoherent at lev 0"  
        return 1
    else:
        if debugPrint: print "coherent at lev 0"  
        return 0
    
def onAnswerSet(*answer_set):
     constraintSolver.getSolution()
    
def simplifyAtLevelZero():
    out = []
    if not doSimpAtLev0:
        return out
        
    if debugPrint: print "simplifyAtLevelZero enter",constraintSolver.constraints
    for id in dict.iterkeys():
        if id >= 0 and dict[id] not in constraintSolver.constraints:
            csp = ConstraintSolver()
            csp.resetCPSolver()
            csp.constraints = list(constraintSolver.constraints)
            csp.constraints.append(dict[id])
            csp.addConstraints()
            if debugPrint: print "simplifyAtLevelZero try to get solution",csp.constraints
            if csp.solve() is False:
                if debugPrint: print "simplifyAtLevelZero  append",-id, dict[id] 
                out.append(-id)
            else:
                if debugPrint: print "simplifyAtLevelZero  append none"
    
    if debugPrint: print "simplifyAtLevelZero",out
    return out
    
    

def find_arguments(s):
    try:
        start = s.index(CONSTRAINT_ATOM_NAME) + len(CONSTRAINT_ATOM_NAME)
        return s[start:len(s) - 1]
    except ValueError:
        return "" 

def setDomainFromString(domainString):
     assert(constraintSolver.min is None and constraintSolver.max is None )
     regexDomain = re.compile('\d+')
     domain = regexDomain.findall(domainString)
     list(domain)
     min = int(domain[0])
     max = int(domain[1])
     assert(min <= max)
     ConstraintSolver.min = min
     ConstraintSolver.max = max

def constraintAtomToString(lit,neg):
    arguments = find_arguments(lit) 
    arguments = arguments.replace('"', "")
    toReturn = ""
    operators = regexOperator.findall(arguments)
    variablesAndConstants = regexVariableAndConstant.findall(arguments)
    i=0 
    while i < len(variablesAndConstants):
        skipVariables =False;
        if i < len(operators):
            # fix for the problem: x - x operator expression
            if "-" in operators[i]:
                if regexVariable.match(variablesAndConstants[i]) is not None and regexVariable.match(variablesAndConstants[i+1]) is not None and variablesAndConstants[i] in variablesAndConstants[i+1]:
                    i+=1
                    toReturn+="zero["+ str(ConstraintSolver.numberZeroVariable)+"]"
                    if neg:
                        ConstraintSolver.numberZeroVariable+=1
                    skipVariables= True
                
        if  not skipVariables:
            if regexVariable.match(variablesAndConstants[i]) is not None:
                if variablesAndConstants[i][len(variablesAndConstants[i]) - 1] == ',':
                    ConstraintSolver.variablesSet.add(variablesAndConstants[i][0:len(variablesAndConstants[i]) - 1])
                    toReturn += "var[\'"+variablesAndConstants[i][0:len(variablesAndConstants[i]) - 1]+"\']"
                else :
                    ConstraintSolver.variablesSet.add(variablesAndConstants[i])
                    toReturn += "var[\'"+variablesAndConstants[i]+"\']"
            elif variablesAndConstants[i][len(variablesAndConstants[i]) - 1] == ',':
                toReturn += variablesAndConstants[i][0:len(variablesAndConstants[i]) - 1]
            else:
                toReturn += variablesAndConstants[i]
        
        if i < len(operators):
            if neg:
                toReturn = toReturn[0:len(toReturn)] + getOppositeOperator(operators[i].replace("$", ""))
            else:
                toReturn = toReturn[0:len(toReturn)] + operators[i].replace("$", "")
        i+=1
    return toReturn

def getOppositeOperator(operator):
    if operator==">=":
        return "<"
    elif operator== ">":
        return "<="
    elif operator=="<=":
        return ">"
    elif operator=="<":
        return ">="
    elif operator == "==":
        return "!="
    elif operator == "!=":
        return "=="
    else:
        return operator

       

