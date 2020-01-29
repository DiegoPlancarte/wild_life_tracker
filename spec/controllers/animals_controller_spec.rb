require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do
  describe "POST create", type: :request do
    it "GET 422" do
      # get "/animals/new"
      post "/animals", :params => { :animal => { :common_name => "Tiger" } }
      # post "/animals", :animal => { :common_name => "Tiger" }
      expect(response).to have_http_status(422)
    end
  end
end
