import re

from constraint import *
import sys
import re

class ConstraintSolver:
     min = None
     max = None
     solvableMaxIndex = None
     oneSol = True
     
     domain = None
     variablesSet = set()
     
     domainProgression = True
     
    
     
     def __init__(self):
      self.problem = Problem()
      self.constraints = []
      
     def setEnviroment(self):
         #print self.variablesSet, "   " , self.domain
         if ConstraintSolver.domainProgression:
            if ConstraintSolver.solvableMaxIndex is None:
                if ConstraintSolver.min == 0:
                    ConstraintSolver.solvableMaxIndex = ConstraintSolver.min + 2
                else:
                    ConstraintSolver.solvableMaxIndex = ConstraintSolver.min * 2
         else:
            ConstraintSolver.solvableMaxIndex = ConstraintSolver.max
            
         ConstraintSolver.domain = range(ConstraintSolver.min,ConstraintSolver.solvableMaxIndex+1)
         self.problem.addVariables(ConstraintSolver.variablesSet,ConstraintSolver.domain)
        
     def addConstraints(self):
         for constraint in self.constraints:
             negativeConstraint = constraint.startswith('not ')
             if negativeConstraint:
                 constraint = constraint[4:len(constraint)]
             m = regexVariable.findall(constraint)
             variablesList = []
             index = 0    
             for variable in m:
                 variablesList.append(variable)
                 newLine = constraint.replace(variable, "args[" + str(index) + ']')
                 if newLine != constraint:
                    constraint = newLine
                    index += 1
             def make_closure(constraint,negativeConstraint):
                 if negativeConstraint: 
                     return lambda *args: not eval(constraint)
                 else:
                     return lambda *args: eval(constraint)
#              print constraint, "  ", variablesList
             self.problem.addConstraint(make_closure(constraint,negativeConstraint), variablesList)
                           
                

     def atLeastOneSolution(self,constraintList):
        t = ConstraintSolver()
        t.setEnviroment()
        t.constraints=constraintList
        t.addConstraints()      
        if t.solveIntelligent() is None:
            return False
        return True
     
     def computeIISBackwardForwardFiltering(self,backward):

        listConstraint=list(self.constraints)
        if backward:
            listConstraint.reverse()
        lastIndex=len(listConstraint)
        
        c1ListConstraint =[]
        while True:
            #print "c1",c1ListConstraint
            Tconstraints = list(c1ListConstraint)
            for i in range(lastIndex):
                Tconstraints.append(listConstraint[i])
                if self.atLeastOneSolution(Tconstraints) is False:
                    c1ListConstraint.append(listConstraint[i])
                    lastIndex = i
                    if self.atLeastOneSolution(c1ListConstraint) is False:
                        ConstraintSolver.solvableMaxIndex = None
                        self.resetCPSolver()
                        return c1ListConstraint
                    break
        
                
     
     def printSolution(self,sol,debugEvaluationConstraint):
        if debugEvaluationConstraint:
                for c in self.constraints:
                   self.checkConsistency(sol, c)
        
#         else:
#             print sol

     def solveIntelligent(self):
        sol = self.problem.getSolution()
        while sol is None and ConstraintSolver.solvableMaxIndex<ConstraintSolver.max:
            if (ConstraintSolver.solvableMaxIndex * 2 )> ConstraintSolver.max:
                ConstraintSolver.solvableMaxIndex = ConstraintSolver.max
            else:
                ConstraintSolver.solvableMaxIndex *= 2
            if debugPrint:print "solvableMaxIndex",ConstraintSolver.solvableMaxIndex
            self.resetCPSolver()
            self.addConstraints()
            sol = self.problem.getSolution()

        if sol is None:
            ConstraintSolver.solvableMaxIndex = None
            self.resetCPSolver()
        
        return sol
        
    
     def resetCPSolver(self):
        self.problem.reset()
        self.setEnviroment()
        
     
     def checkConsistency(self,sol, constraint):
        negativeConstraint = constraint.startswith('not ')
        if negativeConstraint:
             constraint = constraint[4:len(constraint)]
        m = regexVariable.findall(constraint)
        variablesList = []
        index = 0    
        for variable in m:
            variablesList.append(variable)
            newLine = constraint.replace(variable, "args[" + String(index) + ']')
            if newLine != constraint:
               constraint = newLine
               index += 1
        def make_closure(constraint,negativeConstraint):
                 if negativeConstraint: 
                     return lambda *args: not eval(constraint)
                 else:
                     return lambda *args: eval(constraint)
        f=make_closure(constraint,negativeConstraint)
        arguments=[]
        for v in variablesList:
            arguments.append(sol[v])
            print v,":",sol[v],
        if negativeConstraint:
           print "not ",constraint, f(*arguments)
        else:     
            print constraint, f(*arguments)
     
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
debugPrint = False

# var e' l'id dell'atomo e name e' il suo nome
def addedVarName(var, name):
    if(name.startswith(CONSTRAINT_ATOM_NAME + '"$domain(')):
         setDomainFromString(name)
    elif name.startswith(CONSTRAINT_ATOM_NAME):
         ID_lits.append(var) 
         dict[var] = constraintAtomToString(name,False)
         ID_lits.append(-var)
         dict[-var]= constraintAtomToString(name, True)
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
        constraintSolver.constraints.append(dict[lit])
    
    ############# non dovrebbe accadere
    if dict[-lit] in constraintSolver.constraints:
        constraintSolver.constraints.remove(dict[-lit])
        constraintSolver.resetCPSolver()
        if debugPrint: print "on lit true -lit ", -lit, " ",dict[-lit], "already presents"
    ###############################
    
    constraintSolver.addConstraints()
    if debugPrint: print constraintSolver.constraints
    if debugPrint: print "try to get solution"
    s = constraintSolver.solveIntelligent() 
    #if debugPrint: print s
    if s is None:
        if debugPrint:print "s is not sat" 
        iis = constraintSolver.computeIISBackwardForwardFiltering(False)
        if debugPrint:print "iis", iis
        output.append(-lit)
        if len(iis)==1:
            reasons.append(lit)
        else:
            for constraint in iis:
                for id, constr in dict.iteritems():
                    if constr == constraint and id!=lit:
                        reasons.append(id)
                        if debugPrint:print "reason ",id, constr
        if debugPrint:print "output  ",output 
    else :
        constraintSolver.printSolution(s, debugEvaluationConstraint)
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
        ###########################
        
        
        constraintSolver.constraints.append(dict[lit])
    return

#prima di partire controlla se il programma e' incoerente per via del plugin
#0 se il programma non e' incoerente
#!= 0 se il programma e' coerente
def isProgramIncoherent():
    if debugPrint: print constraintSolver.constraints
    constraintSolver.addConstraints()
    sol=constraintSolver.solveIntelligent()
    if debugPrint: print sol
    if sol is None and len(constraintSolver.constraints)>0:
        if debugPrint: print "incoherent at lev 0"  
        return 1
    else:
        constraintSolver.printSolution(sol, debugEvaluationConstraint)
        if debugPrint: print "coherent at lev 0"  
        return 0
    
def onAnswerSet(*answer_set):
    print constraintSolver.problem.getSolution()
    

def find_arguments(s):
    try:
        start = s.index(CONSTRAINT_ATOM_NAME) + len(CONSTRAINT_ATOM_NAME)
        return s[start:len(s) - 1]
    except ValueError:
        return "" 

def setDomainFromString(domainString):
     assert(constraintSolver.domain is None)
     regexDomain = re.compile('\d+')
     domain = regexDomain.findall(domainString)
     list(domain)
     min = int(domain[0])
     max = int(domain[1])
     assert(min <= max)
     ConstraintSolver.min = min
     ConstraintSolver.max = max
     #ConstraintSolver.domain = range(min, max + 1)

def constraintAtomToString(lit,neg):
    arguments = find_arguments(lit) 
    arguments = arguments.replace('"', "")
    toReturn = ""
    operators = regexOperator.findall(arguments)
    variablesAndConstants = regexVariableAndConstant.findall(arguments) 
    for i in range(len(variablesAndConstants)):
        toReturn += variablesAndConstants[i]
        
        if regexVariable.match(variablesAndConstants[i]) is not None:
            if variablesAndConstants[i][len(variablesAndConstants[i]) - 1] == ',':
                ConstraintSolver.variablesSet.add(variablesAndConstants[i][0:len(variablesAndConstants[i]) - 1])
            else :
                ConstraintSolver.variablesSet.add(variablesAndConstants[i])
        if i < len(operators):
            toReturn = toReturn[0:len(toReturn) - 1] + operators[i].replace("$", "")
    if neg:
        toReturn = "not " + toReturn
    return toReturn



       

