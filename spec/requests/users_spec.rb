require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      expect(response).to render_template('index')
    end
    it 'has the correct text placeholders' do
      body = response.body
      expect(body).to include('Users')
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create(name: 'username test', photo: 'photo/test', bio: 'this is index test', postsCounter: 4)
      get user_path(@user)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      expect(response).to render_template('show')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include(@user.name)
    end
  end
end
