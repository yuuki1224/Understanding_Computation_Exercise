require_relative 'Choose.rb'
require_relative 'Concatenate.rb'
require_relative 'Empty.rb'
require_relative 'Literal.rb'
require_relative 'Repeat.rb'

pattern = 
  Repeat.new(
    Concatenate.new(
      Literal.new('a'),
      Choose.new(Empty.new, Literal.new('b'))
    )
  )

puts pattern.matches?('')
puts pattern.matches?('a')
puts pattern.matches?('ab')
puts pattern.matches?('aba')
puts pattern.matches?('abab')
puts pattern.matches?('abaab')
puts pattern.matches?('abba')
