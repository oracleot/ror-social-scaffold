require "rails_helper"

RSpec.describe Post, :type => :model do
  context "validity criteria" do
    it "are met" do
      post = Post.new(user_id: 1, content: 'This has some content')
      expect(post.valid?).to be true
    end
    it "are not met" do
      post = Post.new(user_id: 2, content: '')
      expect(post.valid?).to be false
    end
  end
end
