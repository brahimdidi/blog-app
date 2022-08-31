require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    before :each do 
      get '/posts/index'
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      expect(response).to render_template('index')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include('Posts#index')
    end
  end

  describe "GET /show" do
    before :each do 
      get '/posts/show'
    end
    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the correct template' do
      expect(response).to render_template('show')
    end
    it 'has the correct text placeholderss' do
      body = response.body
      expect(body).to include('Posts#show')
    end
  end

end
