require "spec_helper"
describe RandomOrgHttpApi::Generator do

  before(:all) do
    @generator = RandomOrgHttpApi::Generator.new
  end

  describe '#insert_params' do
    it 'should do insert params in string' do
      params = {name: 'World'}
      string = 'Hello %{name}'
      expect(@generator.send(:insert_params, params, string)).to eq('Hello World')
    end
  end

  describe '#permit_params' do
    it 'should do permit only required params' do
      params = {a: 'A', b: 'B', c: 'C'}
      required_keys = [:a, :b]
      expect(@generator.send(:permit_params, params, required_keys)).to eq({a: 'A', b: 'B'})
    end
  end

  describe '#query' do
    it 'should do generate right query for integer' do
      object_type = 'integer'
      params = {num: 4, max: 100}
      right_query = 'integers/?num=4&min=1&max=100&col=1&base=10&format=plain&rnd=new'
      expect(@generator.send(:query, object_type, params)).to eq(right_query)
    end

    it 'should do generate right query for string' do
      object_type = 'string'
      params = {min: 1, max: 10, num: 3, len: 5}
      right_query = 'strings/?num=3&len=5&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new'
      expect(@generator.send(:query, object_type, params)).to eq(right_query)
    end

    it 'should do generate right query for sequence' do
      object_type = 'sequence'
      params = {num: 5, len: 10, max: 10}
      right_query = 'sequences/?min=1&max=10&col=1&format=plain&rnd=new'
      expect(@generator.send(:query, object_type, params)).to eq(right_query)
    end
  end

  describe '#request' do
    domain = 'https://www.random.org'

    it 'should do return string with error message if request have bad response' do
      bad_query = 'strings/?num=HelloWorld&len=5&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new'
      expect(@generator.send(:request, domain, bad_query).class).to eq(String)
    end

    it 'should do return array if request have good response' do
      if @generator.quota > 0
        good_query = 'strings/?num=3&len=5&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new'
        expect(@generator.send(:request, domain, good_query).class).to eq(Array)
      end
    end
  end

end
