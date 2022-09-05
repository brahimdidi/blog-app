require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :system do
  describe 'index page' do
    before :each do
      @user = User.create(name: 'test', photo: 'photo/test',bio: 'this is index test',postsCounter:4);
      @post1 = Post.create(title: 'post title1',text: 'post text',user:@user,likesCounter:5);
      @post2 = Post.create(title: 'post title2',text: 'post text2',user:@user);
      @comment = Comment.create(text:'this is comment test', post:@post1, user:@user);
      get user_posts_path(@user)
      @page = response.body
    end 
    it "shows user's name, picture and number of posts" do
      expect(@page).to have_content('test')
      expect(@page).to include('photo/test')
      expect(@page).to include('4')
    end

    it 'display the posts title and text' do 
      expect(@page).to include 'post title1'
      expect(@page).to include 'post text'
      expect(@page).to include 'post title2'
    end

    it 'displays first comment on a post and comments number' do
      expect(@page).to include 'comments: 1'
    end

    it 'displays number of likes and shows a post when clicked' do
      expect(@page).to include 'likes: 5'
      expect(@post1.likesCounter).to eql 5
      expect(current_path).to eql ('/users/1/posts')
    end
  end
end
