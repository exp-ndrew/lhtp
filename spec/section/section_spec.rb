require 'spec_helper'

describe Section do
  it { should validate_presence_of :name }
  it { should validate_presence_of :number }
  it { should have_many :lessons }

end
