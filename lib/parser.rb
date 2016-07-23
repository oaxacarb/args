class Parser
  def parse cadena 
    return {} if cadena.empty? 
    {cadena.split.first[-1].to_sym => cadena.split.last.to_i}
  end
end