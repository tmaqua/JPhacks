require 'rails_helper'

RSpec.describe "Plains", type: :request do
  describe "GET /plains" do
    it "works! (now write some real specs)" do
      get plains_path
      expect(response).to have_http_status(200)
    end
  end
end
