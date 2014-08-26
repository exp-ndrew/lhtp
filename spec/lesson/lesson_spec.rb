require 'spec_helper'

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :text }
  it { should validate_presence_of :number }
  it { should validate_presence_of :section_id }
  it { should belong_to :section }

end
