require_relative './rule.rb'
require_relative './rule_book.rb'
require_relative './DFA.rb'
require_relative './DFADesign.rb'
require_relative './NFARulebook.rb'
require_relative './NFA.rb'
require_relative './NFADesign.rb'
require_relative './NFASimulation.rb'
require_relative './Stack.rb'
require_relative './PDAConfiguration.rb'
require_relative './PDARule.rb'

rule = PDARule.new(1, '(', 2, '$', ['b', '$'])
puts rule
configuration = PDAConfiguration.new(1, Stack.new(['$']))
puts rule.applies_to?(configuration, '(')