# encoding: utf-8
require 'spec_helper'

RSpec.describe User, :type => :model do

  let(:user) { Fabricate :user }
  subject { user }

  describe 'fields' do
    it { should have_fields(:email, :pseudo).of_type(String) }
  end
end
