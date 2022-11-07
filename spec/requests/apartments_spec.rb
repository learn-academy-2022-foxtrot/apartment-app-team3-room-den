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
  describe "POST /create" do
    it "creates a new apartment listing" do
      # params to send
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

      # Sends the initial HTTP request to the server
      post "/apartments", params: apartment_params

      # Sends back a successful server connect code
      expect(response).to have_http_status(200)
      # Ensures that the created apartment contains the correct information

      # Looks at the expected created apartment within the db
      apartment_response = JSON.parse(response.body)
      expect(apartment_response["street"]).to eq "124 Conch Street"
      expect(apartment_response["city"]).to eq "Bikini Bottom"
      expect(apartment_response["state"]).to eq "Pacific Ocean"
      expect(apartment_response["manager"]).to eq "Mustachio Jones"
      expect(apartment_response["email"]).to eq "mjones@example.com"
      expect(apartment_response["price"]).to eq "1000 sand dollars"
      expect(apartment_response["bedrooms"]).to eq 2
      expect(apartment_response["bathrooms"]).to eq 2
      expect(apartment_response["pets"]).to eq "yes"
      expect(apartment_response["image"]).to eq "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
      expect(apartment_response["user_id"]).to eq user.id
    end

    it "cannot create a new apartment without a street" do
      apartment_params = {
        apartment: {
          city: "Bikini Bottom",
          state: "Pacific Ocean",
          manager: "Mustachio Jones",
          email: "mjones@example.com",
          price: "1000 sand dollars",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["street"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without a city" do
      apartment_params = {
        apartment: {
          street: "124 Conch Street",
          state: "Pacific Ocean",
          manager: "Mustachio Jones",
          email: "mjones@example.com",
          price: "1000 sand dollars",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["city"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without a state" do
      apartment_params = {
        apartment: {
          street: "124 Conch Street",
          city: "Pacific Ocean",
          manager: "Mustachio Jones",
          email: "mjones@example.com",
          price: "1000 sand dollars",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["state"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without a manager" do
      apartment_params = {
        apartment: {
          street: "124 Conch Street",
          city: "Bikini Bottom",
          state: "Pacific Ocean",
          email: "mjones@example.com",
          price: "1000 sand dollars",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["manager"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without an email" do
      apartment_params = {
        apartment: {
          street: "124 Conch Street",
          city: "Bikini Bottom",
          state: "Pacific Ocean",
          manager: "Mustachio Jones",
          price: "1000 sand dollars",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["email"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without a price" do
      apartment_params = {
        apartment: {
          street: "124 Conch Street",
          city: "Bikini Bottom",
          state: "Pacific Ocean",
          manager: "Mustachio Jones",
          email: "mjones@example.com",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["price"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without bedrooms" do
      apartment_params = {
        apartment: {
          street: "124 Conch Street",
          city: "Bikini Bottom",
          state: "Pacfic Ocean",
          manager: "Mustacio Jones",
          email: "mjones@example.com",
          price: "1000 sand dollars",
          bathrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["bedrooms"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without bathrooms" do
      apartment_params = {
        apartment: {
          street: "124 Conch Street",
          city: "Bikini Bottom",
          state: "Pacific Ocean",
          manager: "Mustachio Jones",
          email: "mjones@example.com",
          price: "1000 sand dollars",
          bedrooms: 2,
          pets: "yes",
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["bathrooms"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it "cannot create a new apartment without pets" do
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
          user_id: user.id
        }
      }
      post "/apartments", params: apartment_params
      error_response = JSON.parse(response.body)
      expect(error_response["pets"]).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
  end

  # -----update-----
  describe "PATCH /update" do
    it("updates an apartment listing") do
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

      post "/apartments", params: apartment_params
      apartment = Apartment.first
      JSON.parse(response.body)

      update_params = {
        apartment: {
          street: "1 Treedome Way",
          city: "Bikini Bottom",
          state: "Pacific Ocean",
          manager: "Sandy Cheeks",
          email: "scheeks@example.com",
          price: "2000 sand dollars",
          bedrooms: 2,
          bathrooms: 2,
          pets: "yes",
          image: "https://cdnb.artstation.com/p/assets/images/images/029/104/549/large/nati-dias-sandy-house-3-nati.jpg?1596473772",
          user_id: user.id
        }
      }

      patch "/apartments/#{apartment.id}", params: update_params
      apartment = Apartment.first
      expect(response).to have_http_status(200)
      expect(apartment.street).to eq "1 Treedome Way"
      expect(apartment.city).to eq "Bikini Bottom"
      expect(apartment.state).to eq "Pacific Ocean"
      expect(apartment.manager).to eq "Sandy Cheeks"
      expect(apartment.email).to eq "scheeks@example.com"
      expect(apartment.price).to eq "2000 sand dollars"
      expect(apartment.bedrooms).to eq 2
      expect(apartment.bathrooms).to eq 2
      expect(apartment.pets).to eq "yes"
      expect(apartment.image).to eq "https://cdnb.artstation.com/p/assets/images/images/029/104/549/large/nati-dias-sandy-house-3-nati.jpg?1596473772"
    end
  end
end
