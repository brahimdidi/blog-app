require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do 
      get '/users/1/posts'
    end
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('index')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include('Posts')
    end
  end
end
