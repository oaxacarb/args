require 'args'

describe Args do
  describe  '#value' do
    it 'When receive flag "-p 3000" returns 3000' do
      input = "-p 3000"
      attribute = double name: 'p', type: 'integer', default: 8080
      schema = double
      allow(schema).to receive(:argument_for).with('p').and_return attribute
      parser = double
      allow(parser).to receive(:parse).with(input).and_return({ p: 3000 })

      args = Args.new(schema, parser)
      args.parse(input)
      expect(args.value("p")).to eq 3000
    end
    
    it 'When not receive "-p" flag  returns 8080' do
      attribute = double name: 'p', type: 'integer', default: 8080
      schema = double
      allow(schema).to receive(:argument_for).with('p').and_return attribute
      parser = double
      allow(parser).to receive(:parse).with('').and_return({ })

      args = Args.new(schema, parser)
      str = ""
      args.parse(str)
      expect(args.value("p")).to eq 8080
    end
    
    it 'get the presence value for flags with no arguments' do
      attribute = double name: 'l', type: 'boolean', default: false
      schema = double
      allow(schema).to receive(:argument_for).with('l').and_return attribute
      parser = double
      #TODO devolver null en lugar de true
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
  end
end
