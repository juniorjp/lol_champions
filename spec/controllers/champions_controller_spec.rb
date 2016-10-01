require 'rails_helper'

RSpec.describe ChampionsController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "list all League of Legends Champions" do
      #nowadays there are 132 registered champions
      get :index
      expect(response).to be_success
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['data'].size).to be >= 132
    end

  end

end
