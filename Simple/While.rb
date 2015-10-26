
class While < Struct.new(:condition, :body)
  def to_s
    "while (#{condition}) {#{body}}"
  end
  
  def inspect
    "<<#{self}>>"
  end
  
  def reducible?
    true
  end
  
  def reduce(enviroment)
    [If.new(condition, Sequence.new(body, self), DoNothing.new), enviroment]
  end
  
  def evaluate(enviroment)
    case condition.evaluate(enviroment)
    when Boolean.new(true)
      evaluate(body.evaluate(enviroment))
    when Boolean.new(false)
      enviroment
    end
  end
  
  def to_ruby
    "-> e {" +
    "while (#{condition.to_ruby}).call(e); e = (#{body.to_ruby}).call(e); end;" +
    " e" +
    "}"
  end
end
