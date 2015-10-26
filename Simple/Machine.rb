
class Machine < Struct.new(:statement, :enviroment)
  def step
    self.statement, self.enviroment = statement.reduce(enviroment)
  end
  
  def run
    while statement.reducible?
      puts "#{statement}. #{enviroment}"
      step
    end
    
    puts "#{statement}. #{enviroment}"
  end
end