require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :system do
  describe 'show page' do
    before :each do
      @user = User.create(id: 1,name: 'username test', photo: 'photo/test',bio: 'this is index test',postsCounter:4);
      @post1 = Post.create(id:1,title: 'post title1',text: 'post text',user:@user,likesCounter:5);
      @comment = Comment.create(text:'this is comment test', post:@post1, user:@user);
      get user_post_path(@user,@post1)
      @page = response.body
    end 
    it "display post's title and author" do
      expect(@page).to have_content('post title1')
      expect(@page).to include(@user.name)
    end

    it 'display the number of comments and likes' do 
      expect(@page).to include('comments: 1')
      expect(@page).to include('likes: 5')
    end

    it 'dispalays the post body (text)' do
      expect(@page).to include(@post1.text)
    end

    it 'displays comment owner and comment body (text)' do
      expect(@page).to include(@comment.user.name)
      expect(@page).to include(@comment.text)
      expect(@page).to include('this is comment test')
      expect(@page).to include('username test')
    end
  end
end
