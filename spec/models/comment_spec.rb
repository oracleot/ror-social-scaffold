require "rails_helper"

RSpec.describe Comment, :type => :model do
  context "validity criteria" do
    it "are met" do
      comment = Comment.new(user_id: 1, post_id: 2, content: "hello")
      expect(comment.valid?).to be true
    end
    it "are not met" do
      comment = Comment.new(user_id: 1, content: "hello")
      expect(comment.valid?).to be false
    end
  end
end
