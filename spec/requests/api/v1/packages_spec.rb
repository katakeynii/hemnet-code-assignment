require 'rails_helper'

RSpec.describe "Api::V1::Packages", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe "POST /api/v1/packages" do
    
    let(:base_error_message)	{ "param is missing or the value is empty:" }
    it "require presence of param name" do
      post "/api/v1/packages"
      expect(response.body).to include("#{base_error_message} name") 
    end
  end
end
