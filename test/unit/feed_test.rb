require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save feed without url" do 
    feed = Feed.new
    assert !feed.save
   
  end
  
  test "should not save feed without title" do 
    feed = Feed.new
    assert !feed.save
   
  end
end
