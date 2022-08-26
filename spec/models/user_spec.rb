require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'user test', bio: 'this is a test for user') }

  before { subject.save }
  it 'should have many posts, comments and likes' do
    posts = User.reflect_on_association(:posts)
    comments = User.reflect_on_association(:comments)
    likes = User.reflect_on_association(:likes)
    expect(posts.macro).to eq(:has_many)
    expect(likes.macro).to eq(:has_many)
    expect(comments.macro).to eq(:has_many)
  end
  it 'name must be present' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'postsCounter must be a positive integer' do
    subject.postsCounter = -2
    expect(subject).to_not be_valid
    subject.postsCounter = 'test'
    expect(subject).to_not be_valid
  end
end
