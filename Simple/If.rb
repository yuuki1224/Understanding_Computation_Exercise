
class If < Struct.new(:condition, :consequence, :alternative)
  def to_s
    "if (#{condition}) { #{consequence} } else { #{alternative} }"
  end
  
  def inspect
    "<<#{self}>>"
  end
  
  def reducible?
    true
  end
  
  def reduce(enviroment)
    if condition.reducible?
      [If.new(condition.reduce(enviroment), consequence, alternative), enviroment]
    else
      case condition
      when Boolean.new(true)
        [consequence, enviroment]
      when Boolean.new(false)
        [alternative, enviroment]
      end
    end
  end
  
  def evaluate(enviroment)
    case condition.evaluate(enviroment)
    when Boolean.new(true)
      consequence.evaluate(enviroment)
    when Boolean.new(false)
      alternative.evaluate(enviroment)
    end
  end
  
  def to_ruby
    "-> e { if (#{condition.to_ruby}).call(e)" +
    "then (#{consequence.to_ruby}).call(e)" +
    "else (#{alternative.to_ruby}).call(e)" +
    "end }"
  end
  
end
