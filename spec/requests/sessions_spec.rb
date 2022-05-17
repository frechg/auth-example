require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /authenticate" do
    it "returns the sign in form" do
      get "/authenticate"

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /authenticate" do
    it "authenticates an existing user" do
      user = User.create(email: "person@example.com", password: "testpass")

      post "/authenticate", params: {
        user: {
          email: "#{user.email}",
          password: "testpass"
        }
      }

      expect(response).to redirect_to("/")
      follow_redirect!

      expect(response).to have_http_status(200)
      expect(response.body).to include("You are Authenticated")
    end
  end

  describe "GET /logout" do
    it "logs out the current user" do
      # need an authenticated user
      # should maybe test the current_user attibute?
      #user = User.create(email: "person@example.com", password: "testpass")
      #expect(current_user).to eq(user)

      get "/logout"

      expect(response).to redirect_to("/")
      follow_redirect!

      expect(response).to have_http_status(200)
      expect(response.body).to include("reAuth")
    end
  end
end
