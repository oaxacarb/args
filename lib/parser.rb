class Parser
  def parse cadena
    result = {}
    cadena.split("-").each do |c| 
      next if c.empty?
      result.merge! miniparse(c.strip)
    end
    result
  end
  
  def miniparse cadena
    return {} if cadena.empty?
    key = cadena.split.first.to_sym
    value = cadena.split.last
    
    if cadena.split.size == 2
      { key => value }
    elsif cadena.split.size > 2
      raise 'Invalid input'
    else
      { key => nil }
    end    
  end
end
#-l 890 -j 789