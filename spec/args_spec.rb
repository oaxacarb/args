require 'args'

describe Args do
  describe  '#value' do
    it 'get the correct value for flags with no arguments' do
      attribute = double name: 'l', type: 'boolean', default: false
      schema = double()
      allow(schema).to receive(:argument_for).with('l').and_return attribute
      args = Args.new(schema)
      str = "-l"
      args.parse(str)
      expect(args.value("l")).to eq true
    end

    it 'get the correct value for flags with no arguments' do
      attribute = double name: 'l', type: 'boolean', default: false
      schema = double()
      allow(schema).to receive(:argument_for).with('l').and_return attribute
      args = Args.new(schema)
      str = ""
      args.parse(str)
      expect(args.value("l")).to eq false
    end

    it '' do
      attribute = double name: 'l', type: 'boolean', default: false
      schema = double()
      allow(schema).to receive(:argument_for).with('l').and_return attribute
      args = Args.new(schema)
      str = ""
      args.parse(str)
      expect(args.value("l")).to eq false
    end
  end
end
