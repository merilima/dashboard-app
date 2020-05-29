require 'rails_helper'
require_relative '../support/devise'
require_relative '../factories/dashboard'
require_relative '../factories/user'

RSpec.describe DashboardsController, type: :controller do
  describe "GET index" do
    login_user
    context "from login user" do
      it "has a current user" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "has a 200 status code" do
        get :index
        expect(response.status).to eq(200)
      end
    end
    context "user logged out" do
      it "redirects to new user path" do
      sign_out(:user)
      get :index, {}
      expect(response).to redirect_to(new_user_session_path) 
      end
    end
  end
  describe "GET new" do
    login_user
    context "from login user" do
      it "should get new" do
        get :new
        expect(response.status).to eq(200)
      end
    end
  end
end

