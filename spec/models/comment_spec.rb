require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validity criteria' do
    user = User.first || User.create(email: 'd@d.com', name: 'dami', password: '123456')
    post = Post.create(user_id: user.id, content: 'This has some content')
    it 'are met' do
      comment = Comment.new(user_id: user.id, post_id: post.id, content: 'hello')

      expect(comment.valid?).to be true
    end
    it 'are not met' do
      comment = Comment.new(user_id: user.id, post_id: post.id, content: 'a' * 203)
      expect(comment.valid?).to be false
    end
  end
end
