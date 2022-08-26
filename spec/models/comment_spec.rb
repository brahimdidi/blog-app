require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should belong to user and post' do
    user = Comment.reflect_on_association(:user)
    post = Comment.reflect_on_association(:post)
    expect(user.macro).to eq(:belongs_to)
    expect(post.macro).to eq(:belongs_to)
  end
end
