require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validity criteria' do
    it 'are met' do
      user = User.new(email: 'abc@d.com', name: 'dami', password: '123456')
      expect(user.valid?).to be true
    end
    it 'are not met' do
      user = User.new(email: 'd@d.com', name: 'dami', password: '12345')
      expect(user.valid?).to be false
    end
  end
end
