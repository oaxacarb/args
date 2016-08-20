class Parser
  def parse cadena
    cadena.split("-").each_with_object({}) do |c, result| 
      next if c.empty?
      result.merge! miniparse(c.strip)
    end
  end
  
  def miniparse cadena
    return {} if cadena.empty?
    
    array = cadena.split
    key = array.first.to_sym
    value = array.last
    
    case array.size
      when 2 then { key => value }
      when 1 then { key => nil }
      else raise 'Invalid input'
    end    
  end
end
#-l 890 -j 789