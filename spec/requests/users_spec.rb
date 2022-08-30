require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before :each do
      get users_path
    end
    it 'returns http success' do
      
      expect(response).to have_http_status(:success)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include('Users')
    end
  end
end
