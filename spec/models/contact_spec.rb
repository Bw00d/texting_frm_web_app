require 'spec_helper'

describe Contact do
  it { should validate_presence_of :name }
  it { should validate_presence_of :number }
  it { should validate_uniqueness_of :number }
end
