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
    it "has each user's name " do
      @users_data.each do |user|
        expect(@page).to include(user.name)
      end
    end
    it "has each user's image" do
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
end
