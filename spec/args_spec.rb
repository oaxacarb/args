require 'args'

describe Args do
  describe  '#value' do
    it 'get the presence value for flags with no arguments' do
      attribute = double name: 'l', type: 'boolean', default: false
      schema = double
      allow(schema).to receive(:argument_for).with('l').and_return attribute
      parser = double
      allow(parser).to receive(:parse).with('-l').and_return({ l: true })

      args = Args.new(schema, parser)
      str = "-l"
      args.parse(str)
      expect(args.value("l")).to eq true
    end

    it 'get the default value for flags with no arguments' do
      attribute = double name: 'l', type: 'boolean', default: false
      schema = double()
      allow(schema).to receive(:argument_for).with('l').and_return attribute
      
      parser = double
      allow(parser).to receive(:parse).with('').and_return({ })
      
      args = Args.new(schema, parser)
      str = ""
      args.parse(str)
      expect(args.value("l")).to eq false
    end

    it 'get error message, for invalid flag' do
      attribute = double name: 'l', type: 'boolean', default: false
      schema = double()
      allow(schema).to receive(:argument_for).with('a').and_return nil
      
      parser = double
      allow(parser).to receive(:parse).with('-a').and_return({a: true})
      
      args = Args.new(schema, parser)
      str = "-a"
      args.parse(str)
      expect { args.value("a") }.to raise_error ArgumentError
    end
    
    it 'get the default value for flag with integer value' do
      attribute = double name: 'p', type: 'integer', default: 0
      # attribute.name => p
      # attribute.type => 'integer'
      schema = double()
      allow(schema).to receive(:argument_for).with('p').and_return attribute
     
      parser = double
      allow(parser).to receive(:parse).with('-p').and_return({p: true})
     
      args = Args.new(schema, parser)
      str = "-p"
      args.parse(str)
      expect(args.value("p")).to eq 0
    end
    
    it 'get the value for flag with integer value' do
      attribute = double name: 'p', type: 'integer', default: 0
      schema = double()
      allow(schema).to receive(:argument_for).with('p').and_return attribute
      
       parser = double
      allow(parser).to receive(:parse).with('-p 3000').and_return({p: 3000})
     
      args = Args.new(schema, parser)
      str = "-p 3000"
      args.parse(str)
      expect(args.value("p")).to eq 3000
    end
    
    
  end
end
