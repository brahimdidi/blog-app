require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :system do

  describe 'users index page' do  
    before :each do
        @users_data = []
        @users = User.all
        @users.each do |user|
          @users_data << user
        end
       get users_path
        @page = response.body
    end 
     it "has each user's name "do
       @users_data.each do |user|
        expect(@page).to include(user.name)
       end
     end
     it "has each user's image"do
       @users_data.each do |user|
        expect(@page).to include(user.photo)
       end
     end
     it 'shows the number of posts each user has' do
      @users_data.each do |user|
        expect(page).to include(user.postsCounter)
       end
     end
    

  end

  describe 'show page' do
    before :each do
      @user = User.create(name: 'test', photo: 'photo/test',bio: 'this is show test',postsCounter:4);
      @post1 = Post.create(title: 'post title1',text: 'post text',user:@user);
      @post2 = Post.create(title: 'post title2',text: 'post text2',user:@user)
      @post3 = Post.create(title: 'post title3',text: 'post text3',user:@user)
      get user_path(@user)
      @page = response.body
    end 
    it "shows user's name, picture, bio and number of posts" do
      expect(@page).to have_content('test')
      expect(@page).to include('photo/test')
      expect(@page).to include('this is show test')
      expect(@page).to include('4')
    end

    it 'display the user last 3 posts' do 
      expect(@user.posts).to include @post1, @post2, @post3
      expect(@page).to include 'post title1'
      expect(@page).to include 'post title2'
      expect(@page).to include 'post title3'
    end

    it 'dispaly see all posts button ' do
      expect(@page).to include 'see all posts'
    end


  end
end
