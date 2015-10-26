
class Assign < Struct.new(:name, :expression)
  def to_s
    "#{name} = #{expression}"
  end
  
  def inspect
    "<<#{self}>>"
  end
  
  def reducible?
    true
  end
  
  def reduce(enviroment)
    if expression.reducible?
      [Assign.new(name, expression.reduce(enviroment)), enviroment]
    else
      [DoNothing.new, enviroment.merge({name => expression})]
    end
  end
  
  def evaluate(enviroment)
    enviroment.merge({ name => expression.evaluate(enviroment)})
  end
  
  def to_ruby
    "-> e { e.merge({ #{name.inspect} => (#{expression.to_ruby}).call(e) }) }"
  end
end
