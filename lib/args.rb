class Args
  def initialize(schema, parser)
    @schema = schema
    @parser = parser
  end

  def parse(command)
    @command =command
    @values = @parser.parse(command) if @parser
  end  

  def value(name)
    attribute = @schema.argument_for(name)      
    raise ArgumentError.new if attribute.nil?
    if attribute.type == "boolean" 
      @values[name.to_sym] || attribute.default
    else
      return attribute.default if @values[name.to_sym] == true
      @values[name.to_sym] 
    end
  end
end
