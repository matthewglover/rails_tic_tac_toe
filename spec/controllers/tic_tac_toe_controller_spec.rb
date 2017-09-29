require 'rails_helper'

RSpec.describe TicTacToeController, type: :controller do

  describe "GET #options" do
    it "returns http success" do
      get :options
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #game" do
    it "returns http success" do
      get :game
      expect(response).to have_http_status(:success)
    end
  end

end
