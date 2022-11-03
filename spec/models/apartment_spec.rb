require "rails_helper"

RSpec.describe Apartment, type: :model do
  let(:user) { User.create email: "test@example.com", password: "password", password_confirmation: "password" }

  it "should have a valid street" do
    apartment = user.apartments.create(
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
    expect(apartment.errors[:street]).to include "can't be blank"
  end
end
