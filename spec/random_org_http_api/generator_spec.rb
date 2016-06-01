require "spec_helper"
describe RandomOrgHttpApi::Generator do

  before(:all) do
    @generator = RandomOrgHttpApi::Generator.new
  end

  describe '#permit_params' do
    it 'should do permit only required params' do
      params = {a: 'A', b: 'B', c: 'C'}
      required_keys = [:a, :b]
      expect(@generator.send(:permit_params, params, required_keys)).to eq({a: 'A', b: 'B'})
    end
  end

  describe '#query' do
  end

  describe '#request' do
  end
end
