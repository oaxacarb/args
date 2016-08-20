require "schema"

describe 'Schema' do
  describe '#argument_for' do
    it 'returns values for attribute' do
      attribute = double name: 'p', type: 'integer', default: 3000
      schema = Schema.new
      expect(schema.argument_for('p')).to have_attributes(name: 'p', type: 'integer', default: 3000)
    end
  end
end