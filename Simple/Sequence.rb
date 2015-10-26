
class Sequence < Struct.new(:first, :second)
  def to_s
    "#{first}; #{second}"
  end
  
  def inspect
    "<<#{self}>>"
  end
  
  def reducible?
    true
  end
  
  def reduce(enviroment)
    case first
    when DoNothing.new
      [second, enviroment]
    else
      reduced_first, reduced_enviroment = first.reduce(enviroment)
      [Sequence.new(reduced_first, second), reduced_enviroment]
    end
  end
  
  def evaluate(enviroment)
    second.evaluate(first.evaluate(enviroment))
  end
  
  def to_ruby
    "-> e { (#{second.to_ruby}).call((#{first.to_ruby}).call(e)) }"
  end
end
