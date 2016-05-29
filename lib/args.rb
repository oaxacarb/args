class Args
  def initialize(schema)
    @schema = schema
  end

  def value(name)
    #@schema.argument_for(name)
    @return
  end

  def parse(command)
    @return = !command.empty?
  end
end
