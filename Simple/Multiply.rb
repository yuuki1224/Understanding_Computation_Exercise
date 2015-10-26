class Multiply < Struct.new(:left, :right)
  def to_s
    "#{left} * #{right}"
  end
  
  def inspect
    "<<#{self}>>"
  end
  
  def reducible?
    true
  end
  
  def reduce(enviroment)
    if left.reducible?
      Multiply.new(left.reduce(enviroment), right)
    elsif right.reducible?
      Multiply.new(left, right.reduce(enviroment))
    else
      Number.new(left.value * right.value)
    end
  end
  
  def evaluate(enviroment)
    Number.new(left.evaluate(enviroment).value * right.evaluate(enviroment).value)
  end
  
  def to_ruby
    "-> e { (#{left.to_ruby}).call(e) * (#{right.to_ruby}).call(e) }"
  end
  
end