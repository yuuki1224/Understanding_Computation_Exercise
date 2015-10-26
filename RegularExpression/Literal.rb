require_relative './Pattern.rb'
require_relative '../Automata/NFARulebook.rb'
require_relative '../Automata/rule.rb'

class Literal < Struct.new(:character)
  include Pattern
  
  def to_s
    character
  end
  
  def precedence
    3
  end
  
  def to_nfa_design
    start_state = Object.new
    accept_states = Object.new
    rule = FARule.new(start_state, character, accept_states)
    rulebook = NFARulebook.new([rule])
    
    NFADesign.new(start_state, [accept_states], rulebook)
  end
  
end
