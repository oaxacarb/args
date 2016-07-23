class Args
  def initialize(schema, parser)
    @schema = schema
    @parser = parser
  end

  def parse(command)
    @command =command
    @values = @parser.parse(command)
  end  

  def value(name)
    attribute = @schema.argument_for(name)
    raise ArgumentError.new if attribute.nil?
    @values[name.to_sym] || attribute.default
  end
end