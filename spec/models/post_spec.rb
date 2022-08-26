require 'rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Post test', text: 'this is a test for Post') }

  before { subject.save }
  it 'should have many comments and likes' do
    comments = Post.reflect_on_association(:comments)
    likes = Post.reflect_on_association(:likes)
    expect(comments.macro).to eq(:has_many)
    expect(likes.macro).to eq(:has_many)
  end
  it 'title must be present and must be less than 250 letters' do
    subject.title = ''
    expect(subject).to_not be_valid
    subject.title = (0...251).map { ('a'..'z').to_a[rand(26)] }.join
    expect(subject).to_not be_valid
  end

  it 'commentsCounter and likesCounter must be a positive integer' do
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
    subject.commentsCounter = 'test'
    expect(subject).to_not be_valid
  end
end
