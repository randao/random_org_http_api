require 'spec_helper'
describe RandomOrgHttpApi::Generator do

  before(:all) do
    @generator = RandomOrgHttpApi::Generator.new
  end

  describe '#permit_params' do
    it 'should do permit only required params' do
      input_params = { a: 'A', b: 'B', c: 'C' }
      required_keys = [:a, :b]
      output_params = { a: 'A', b: 'B' }
      expect(@generator.send(:permit_params, input_params, required_keys)).to eq(output_params)
    end
  end

  describe '#query' do
    it 'should do generate right params for integer' do
      generator_type = :integer
      input_params = { num: 4, max: 100 }
      output_params =
        {
          path: '/integers',
          params: {
            format: 'plain',
            base: '10',
            rnd: 'new',
            col: '1',
            min: '1',
            num: 4,
            max: 100
          }
        }

      expect(@generator.send(:query, generator_type, input_params)).to eq(output_params)
    end

    it 'should do generate right params for string' do
      generator_type = :string
      input_params = { min: 1, max: 10, num: 3, len: 5 }

      output_params = {
        path: '/strings',
        params: {
          format: 'plain',
          rnd: 'new',
          digits: 'on',
          loweralpha: 'on',
          upperalpha: 'on',
          unique: 'on',
          num: 3,
          len: 5
        }
      }

      expect(@generator.send(:query, generator_type, input_params)).to eq(output_params)
    end

    it 'should do generate right params for sequence' do
      generator_type = :sequence
      input_params = { num: 5, len: 10, max: 10 }

      output_params = {
        path: '/sequences',
        params: {
          format: 'plain',
          rnd: 'new',
          col: '1',
          min: '1',
          max: 10
        }
      }

      expect(@generator.send(:query, generator_type, input_params)).to eq(output_params)
    end
  end
end
