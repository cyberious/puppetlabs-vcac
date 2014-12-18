require 'spec_helper'
describe 'vcac' do

  context 'with defaults for all parameters' do
    it { should contain_class('vcac') }
  end
end
