require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      @user = User.create(name: 'username test', photo: 'photo/test', bio: 'bio test')
      @post = Post.create(title: 'post index title', text: 'post index text', user: @user)
      get user_posts_path(@user)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      expect(response).to render_template('index')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include(@post.title)
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create(name: 'username test', photo: 'photo/test', bio: 'bio test')
      @post = Post.create(title: 'post show title', text: 'post show text', user: @user)
      get user_post_path(@user, @post)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('show')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include(@post.title)
      expect(body).to include(@post.text)
    end
  end
end
