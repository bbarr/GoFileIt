require "spec_helper.rb"

describe Template do
  
  before do
    @template = Template.new
  end
  
  after do
    Template.collection.drop
  end
  
end