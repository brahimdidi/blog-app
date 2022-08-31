require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users'
    end
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      expect(response).to render_template('index')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include('Users#index')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1'
    end
    it 'returns http success' do
      get '/users/1'
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      expect(response).to render_template('show')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include('Users#show')
    end
  end
end
