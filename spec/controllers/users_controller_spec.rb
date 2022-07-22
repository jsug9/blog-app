require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @augusto = User.new(
      email: 'augusto@icloud.com',
      password: 'password',
      password_confirmation: 'password',
      name: 'Augusto',
      role: 'admin',
      bio: 'Hello World, I am Augusto'
    )
    @augusto.skip_confirmation!
    @augusto.save!
  end

  describe 'GET /index' do
    before { get '/users' }
    it 'should return 200 success' do
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('Augusto')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_path(@user) }

    it 'should return 200 success' do
      expect(response).to have_http_status(200)
    end

    it 'should render the show template' do
      expect(response).to render_template(:show)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('Hello World')
    end
  end
end
