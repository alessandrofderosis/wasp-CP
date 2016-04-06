import re
from debian.debtags import output

from constraint import *
import sys
import re
from twisted.trial._synctest import Todo
from numpy.core.defchararray import replace
from _dbus_bindings import String
from _ast import IsNot
from cv2 import line

class ConstraintSolver:
     lines = [];
     domain = None
     variablesSet = set()
    
     
     def __init__(self):
      self.problem = Problem()
      self.constraints = []
      
     def setEnviroment(self):
         #print self.variablesSet, "   " , self.domain
         self.problem.addVariables(ConstraintSolver.variablesSet, ConstraintSolver.domain)
        
     def addConstraints(self):
         for constraint in self.constraints:
             m = regexVariable.findall(constraint)
             variablesList = []
             index = 0    
             for variable in m:
                 variablesList.append(variable)
                 newLine = constraint.replace(variable, "args[" + String(index) + ']')
                 if newLine != constraint:
                    constraint = newLine
                    index += 1
             def make_closure(constraint): 
                 return lambda *args: eval(constraint) 
            # print constraint, "  ", variablesList
             self.problem.addConstraint(make_closure(constraint), variablesList)
    
     def printSolution(self):
        solutions = self.problem.getSolutions()
        for solution in solutions:
                print solution 
                           
                
     def computeIISForwardFiltering(self):
         c1 = ConstraintSolver()
         c1.constraints = self.constraints
         c1.setEnviroment()
         while c1.problem.getSolution() is not None or len(c1.constraints) <= 0:
             t = ConstraintSolver()
             t.setEnviroment()
             t.constraints = (list(c1.constraints))
             for line in self.constraints:
                 if line[0] != '%' and line[0] != '$':
                     t.constraints.append(line)
                     t.addConstraints()
                     if t.problem.getSolution() is None:
                         c1.constraints.append(line)
                         c1.addConstraints()
                         break
         c1.constraints.pop(0)
         return c1.constraints
     
     def computeIISBackwardFiltering(self):
         c1 = ConstraintSolver()
         c1.constraints = self.constraints
         c1.setEnviroment()
         while c1.problem.getSolution() is not None or len(c1.constraints) <= 0:
             t = ConstraintSolver()
             t.setEnviroment()
             t.constraints = (list(c1.constraints))
             for line in reversed(self.constraints):
                 if line[0] != '%' and line[0] != '$':
                     t.constraints.append(line)
                     t.addConstraints()
                     if t.problem.getSolution() is None:
                         c1.constraints.append(line)
                         c1.addConstraints()
                         break
         c1.constraints.pop(0)
         return c1.constraints
     
# Start module casp                
ID_lits = []
ID_lev0 = []
dict = {}
regexVariableAndConstant = re.compile('([A-Za-z]+[\w,()]*|\d+,?|\-\d+,?)')
regexVariable = re.compile('[A-Za-z]+[\w,()]*')
regexOperator = re.compile('\$(\>=|\<=|\<|\>|\+|\*|\-|\/|\%|\==)')
constraintSolver = ConstraintSolver()
CONSTRAINT_ATOM_NAME = "__constraint("

# var e' l'id dell'atomo e name e' il suo nome
def addedVarName(var, name):
    if(name.startswith(CONSTRAINT_ATOM_NAME + '"$domain(')):
         setDomainFromString(name)
    elif name.startswith(CONSTRAINT_ATOM_NAME):
         ID_lits.append(var) 
         dict[var] = constraintAtomToString(name)
         print name
         if  var in ID_lev0:
             constraintSolver.constraints.append(dict[var])
    return

# invia come informazione se un atomo e' stato eliminato
def onAtomElimination(var):
    return

# restituisce i letterali per cui ti interessa la notifica del cambio di valore di verita'
def getLiterals(nVars):
    print "getLits" , ID_lits
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
    print "on Lit True"
    output = []
    reasons = []
    constraintSolver.constraints.append(dict[lit])
    constraintSolver.addConstraints()
    s = constraintSolver.problem.getSolution() 
    if s is None:
        print "s is not sat"
        iis = constraintSolver.computeIISBackwardFiltering()
        output.append(-lit)
        for constraint in iis:
            for id, constr in dict.iteritems():
                if constr == constraint and id!=lit:
                    reasons.append(id)
                    print id, constr
    else :
        print s
    return output

# per ogni letterale inferito la ragione e' una clausola C. Il metodo restituisce C.
def getReason():
    print "get Reason"
    return reasons

def onLiteralsUndefined(*lits):
    for lit in lits:
        if dict[lit] in constraintSolver.constraints:
            constraintSolver.constraints.remove(dict[lit])
            print "removed constraint ", dict[lit]
    constraintSolver.problem.reset()
    constraintSolver.setEnviroment()
    return

# notifica quando un letterale e' inferito true al livello 0
def onLitAtLevelZero(lit):
    ID_lev0.append(lit)
    if dict.get(lit) is not None:
        constraintSolver.constraints.append(dict[lit])
    return

#prima di partire controlla se il programma e' incoerente per via del plugin
#0 se il programma non e' incoerente
#!= 0 se il programma e' coerente
def isProgramIncoherent():
    constraintSolver.addConstraints()
    sol=constraintSolver.problem.getSolution();
    if sol is None:
        print "incoherent at lev 0" 
        return 1
    else:
        print sol
        return 0

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
     ConstraintSolver.domain = range(min, max + 1)

def constraintAtomToString(lit):
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
    return toReturn




