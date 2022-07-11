require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path(6) }

    it 'should return 200 success' do
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('This is the Posts index page.')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_post_path(6, 1) }

    it 'should return 200 success' do
      expect(response).to have_http_status(200)
    end

    it 'should render the show template' do
      expect(response).to render_template(:show)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include('This is the Posts show page.')
    end
  end
end
