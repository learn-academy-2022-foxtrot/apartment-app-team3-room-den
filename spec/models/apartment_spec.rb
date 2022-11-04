require "rails_helper"

RSpec.describe Apartment, type: :model do
  let(:user) { User.create email: "test@example.com", password: "password", password_confirmation: "password" }

  it "should have a valid street" do
    apartment = user.apartments.new(
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
    apartment.validate
    expect(apartment.errors[:street]).to include "can't be blank"
  end

  it "should have a valid city" do
    apartment = user.apartments.
    new(
      street: "123 Main Street",
      state: "Pacific Ocean",
      manager: "Mustachio Jones",
      email: "mjones@example.com",
      price: "1000 sand dollars",
      bedrooms: 2,
      bathrooms: 2,
      pets: "yes",
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:city]).to include "can't be blank"
  end

  it "should have a valid state" do
    apartment = user.apartments.new(
      street: "123 Main Street",
      city: "Bikini Bottom",
      manager: "Mustachio Jones",
      email: "mjones@example.com",
      price: "1000 sand dollars",
      bedrooms: 2,
      bathrooms: 2,
      pets: "yes",
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:state]).to include "can't be blank"
  end

  it "should have a valid manager" do
    apartment = user.apartments.new(
      street: "123 Main Street",
      city: "Bikini Bottom",
      state: "Pacific Ocean",
      email: "mjones@example.com",
      price: "1000 sand dollars",
      bedrooms: 2,
      bathrooms: 2,
      pets: "yes",
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:manager]).to include "can't be blank"
  end

  it "should have a valid email" do
    apartment = user.apartments.new(
      street: "123 Main Street",
      city: "Bikini Bottom",
      state: "Pacific Ocean",
      manager: "Mustachio Jones",
      price: "1000 sand dollars",
      bedrooms: 2,
      bathrooms: 2,
      pets: "yes",
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:email]).to include "can't be blank"
  end
  
  it "should have a valid price" do
    apartment = user.apartments.new(
      street: "123 Main Street",
      city: "Bikini Bottom",
      state: "Pacific Ocean",
      manager: "Mustachio Jones",
      email: "mjones@example.com",
      bedrooms: 2,
      bathrooms: 2,
      pets: "yes",
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:price]).to include "can't be blank"
  end
   
  it "should have a valid bedrooms" do
    apartment = user.apartments.new(
      street: "123 Main Street",
      city: "Bikini Bottom",
      state: "Pacific Ocean",
      manager: "Mustachio Jones",
      email: "mjones@example.com",
      price: "1000 sand dollars",
      bathrooms: 2,
      pets: "yes",
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:bedrooms]).to include "can't be blank"
  end
    
  it "should have a valid bathrooms" do
    apartment = user.apartments.new(
      street: "123 Main Street",
      city: "Bikini Bottom",
      state: "Pacific Ocean",
      manager: "Mustachio Jones",
      email: "mjones@example.com",
      price: "1000 sand dollars",
      bedrooms: 2,
      pets: "yes",
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:bathrooms]).to include "can't be blank"
  end
    
  it "should have a valid pets" do
    apartment = user.apartments.new(
      street: "123 Main Street",
      city: "Bikini Bottom",
      state: "Pacific Ocean",
      manager: "Mustachio Jones",
      email: "mjones@example.com",
      price: "1000 sand dollars",
      bedrooms: 2,
      bathrooms: 2, 
      image: "https://images.thedailystar.net/sites/default/files/styles/very_big_201/public/feature/images/who_lives_in_a_pineapple_under_the_sea.jpg?itok=iYr37hhG"
    )
    apartment.validate
    expect(apartment.errors[:pets]).to include "can't be blank"
  end
    
  it "should have a valid image" do
    apartment = user.apartments.new(
      street: "123 Main Street",
      city: "Bikini Bottom",
      state: "Pacific Ocean",
      manager: "Mustachio Jones",
      email: "mjones@example.com",
      price: "1000 sand dollars",
      bedrooms: 2,
      bathrooms: 2, 
      pets: "yes",
    )
    apartment.validate
    expect(apartment.errors[:image]).to include "can't be blank"
  end
    
  it "should have a valid user_id" do
    apartment = Apartment.create(
      street: "Main Street",
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
    expect(apartment.errors[:user_id]).to include "can't be blank"
  end
end
