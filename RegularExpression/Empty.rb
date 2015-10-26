require_relative './Pattern.rb'
require_relative '../Automata/NFARulebook.rb'
require_relative '../Automata/NFADesign.rb'

class Empty
  include Pattern
  
  def to_s
    ''
  end
  
  def precedence
    3
  end
  
  def to_nfa_design
    start_state = Object.new
    accept_states = [start_state]
    rulebook = NFARulebook.new([])
    
    NFADesign.new(start_state, accept_states, rulebook)
  end
  
end
