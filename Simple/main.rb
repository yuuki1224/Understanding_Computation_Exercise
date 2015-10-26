require_relative 'Add.rb'
require_relative 'Boolean.rb'
require_relative 'LessThan.rb'
require_relative 'Machine.rb'
require_relative 'Multiply.rb'
require_relative 'Number.rb'
require_relative 'Variable.rb'
require_relative 'Statement.rb'
require_relative 'Assign.rb'
require_relative 'If.rb'
require_relative 'Sequence.rb'
require_relative 'While.rb'

require 'pry'

statement =
  While.new(
    LessThan.new(Variable.new(:x), Number.new(5)),
    Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
  )
proc = eval(statement.to_ruby)
puts proc.call({ x: 1})

binding.pry
