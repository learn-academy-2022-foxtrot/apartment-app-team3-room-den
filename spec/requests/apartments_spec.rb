require "rails_helper"

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create email: "test@example.com", password: "password", password_confirmation: "password" }

  # -----index-----
  describe "GET /index" do
    it "gets all the apartments" do
      apartment = user.apartments.new(
        street: "124 Conch Street",
        city: "Bikini Bottom",
        state: "Pacific Ocean",
        manager: "Mustachio Jones",
        email: "mjones@example.com",
        price: "1000 sand dollars",
        bedrooms: 2,
        bathrooms: 2,
        pets: "yes",
        image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
      )
      apartment.save
      get "/apartments"

      apartments = JSON.parse(response.body)
      expect(apartments.length).to eq 1
      expect(response).to have_http_status(200)
      apartment = apartments.first
      expect(apartment["street"]).to eq "124 Conch Street"
      expect(apartment["city"]).to eq "Bikini Bottom"
      expect(apartment["state"]).to eq "Pacific Ocean"
      expect(apartment["manager"]).to eq "Mustachio Jones"
      expect(apartment["email"]).to eq "mjones@example.com"
    end
  end

  # -----create-----
  describe "POST/create" do
    it "creates a new apartment listing" do
      #params to send
      apartment_params = {
        apartment: {
        street: "124 Conch Street",
        city: "Bikini Bottom",
        state: "Pacific Ocean",
        manager: "Mustachio Jones",
        email: "mjones@example.com",
        price: "1000 sand dollars",
        bedrooms: 2,
        bathrooms: 2,
        pets: "yes",
        image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG",
        user_id: user.id
        }
      }
      # p apartment_params
      #Sends the initial HTTP request to the server
      post '/apartments', params: apartment_params

      #JSON.parse(response.body)
      #Sends back a successful server connect code
      expect(response).to have_http_status(200)
      # Ensures that the created apartment contains the correct information
      
      # Looks at the expected created apartment within the db
      apartment = Apartment.first
      expect(apartment["street"]).to eq "124 Conch Street"
      expect(apartment["city"]).to eq "Bikini Bottom"
      expect(apartment["state"]).to eq "Pacific Ocean"
      expect(apartment["manager"]).to eq "Mustachio Jones"
      expect(apartment["email"]).to eq "mjones@example.com"
  
    end
  end
end
