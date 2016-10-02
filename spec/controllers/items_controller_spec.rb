require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "list all League of Legends Items" do
      #nowadays there are 229 registered items
      get :index
      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['data'].size).to be >= 229
    end

  end
end
