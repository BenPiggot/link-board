require 'rails_helper'
require 'factory_girl_rails'

describe "Link Board App" do
  FactoryGirl.create :user, name: "Marlon James", email: "mdaon@gmail.com", password: "12s456"
  describe "GET /signup" do

    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it "returns a successful 200 response" do
      get "/signup"
      expect(response.status).to eq 200
    end

  #   it "returns data of a dog" do
  #     m = FactoryGirl.create :dog, name: "Buford"
  #     get "/dogs/#{m.id}", {}, {'Accept' => "application/json"}
  #     body = JSON.parse(response.body)
  #     expect(body['name']).to match "Buford"
  #   end

  end

  # describe "GET /dogs/:id" do
  #     it "returns valid email" do
  #     m = FactoryGirl.create :dog, name: "Buford"
  #     get "/dogs/#{m.id}", {}, {'Accept' => "application/json"}
  #     body = JSON.parse(response.body)
  #     expect(body['email']).to match "mel@gmail.com"
  #   end
  #     it "returns invalid email" do
  #     m = FactoryGirl.create :dog, name: "Buford", email: "4"
  #     expect { get "/dogs/#{m.id}", {}, {'Accept' => "application/json"} }.to raise_error(ActiveRecord::RecordInvalid)
  #   end
  # end

  # describe "POST /dogs" do
  # end

  # describe "DELETE /dogs/:id" do
  # end
end