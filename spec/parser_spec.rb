require "parser"

describe Parser do
  describe '#parse' do
    it 'returns hash { l: 3000 } with -l 3000' do
      parser = Parser.new
      result = parser.parse("-l 3000")
      expect(result).to eq({ l: "3000" })
    end

    it 'returns hash { l:5000 } with -l 5000' do
      parser = Parser.new
      result = parser.parse("-l 5000")
      expect(result).to eq({ l: "5000" })
    end    
    
    it 'returns empty hash with empty string' do
      parser = Parser.new
      result = parser.parse("")
      expect(result).to eq({})
    end
    
    it 'returns hash { j: 5000 } with -j 5000' do
      parser = Parser.new
      result = parser.parse("-j 5000")
      expect(result).to eq({j: "5000"})
    end

    it 'returns hash { j: nil } with -j' do
      parser = Parser.new
      result = parser.parse("-j")
      expect(result).to eq({j: nil})
    end
    
    it 'returns hash { l: 3000, j: 4000 } with -l 3000 -j 4000' do
      parser = Parser.new
      result = parser.parse("-l 3000 -j 4000")
      expect(result).to eq({ l: "3000", j: "4000" })
    end
    
    it 'returns hash { l: 3000, j: 5000 } with -l 3000 -j 5000' do
      parser = Parser.new
      result = parser.parse("-l 3000 -j 5000")
      expect(result).to eq({ l: "3000", j: "5000" })
    end

    it 'throws an exception with -l 3000 5000' do
      parser = Parser.new
      expect {
          parser.parse("-l 3000 5000")
      }.to raise_error "Invalid input"
    end
  end
end