class Schema
  def argument_for(v)
    Struct.new(:name, :type, :default).new("p", "integer", 3000)
  end
end