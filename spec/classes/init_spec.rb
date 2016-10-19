require 'spec_helper'
describe 'devenv' do
  context 'with default values for all parameters' do
    it { should contain_class('devenv') }
  end
end
