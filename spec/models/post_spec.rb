require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validity criteria' do
    user = User.first || User.create(email: 'd@d.com', name: 'dami', password: '123456')
    it 'are met' do
      post = Post.new(user_id: user.id, content: 'This has some content')
      expect(post.valid?).to be true
    end
    it 'are not met' do
      post = Post.new(user_id: user.id, content: '')
      expect(post.valid?).to be false
    end
  end
end
