require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should belong to user and post' do
    user = Like.reflect_on_association(:user)
    post = Like.reflect_on_association(:post)
    expect(user.macro).to eq(:belongs_to)
    expect(post.macro).to eq(:belongs_to)
  end
  return
end
