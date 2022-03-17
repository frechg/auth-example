require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "renders the home page" do
      get "/"

      expect(response).to have_http_status(200)
    end
  end

  describe "GET /join" do
    it "renders the sign up form" do
      get "/join"

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users" do
    it "creates a new authenticated user and redirects to the home page" do
      post "/users", params: {
        user: {
          email: "person@example.com",
          password: "testpass",
          password_confrimation: "testpass"
        }
      }

      expect(response).to redirect_to("/")
      expect(response).to have_http_status(302)
      follow_redirect!

      expect(User.count).to eq(1)
      expect(response.body).to include("You are Authenticated")
    end
  end
end
