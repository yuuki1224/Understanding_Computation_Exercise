require_relative './DFADesign.rb'
require_relative './rule_book.rb'

class NFASimulation < Struct.new(:nfa_design)
  
  def next_state(state, character)
    nfa_design.to_nfa(state).tap { |nfa|
      nfa.read_character(character)
    }.current_states
  end
  
  def rules_for(state)
    nfa_design.rulebook.alphabet.map { |character|
      FARule.new(state, character, next_state(state, character))
    }
  end
  
  def discover_states_and_rles(states)
    rules = states.flat_map {|state| rules_for(state) }
    more_states = rules.map(&:follow).to_set
    
    if more_states.subset?(states)
      [states, rules]
    else
      discover_states_and_rles(states + more_states)
    end
  end
  
  def to_dfa_design
    start_state = nfa_design.to_nfa.current_states
    states, rules = discover_states_and_rles(Set[start_state])
    accept_states = states.select {|state| nfa_design.to_nfa(state).accepting? }
    
    DFADesign.new(start_state, accept_states, DFARulebook.new(rules))
  end
end
