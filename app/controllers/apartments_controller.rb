class ApartmentsController < ApplicationController
  def index
    render json: apartments = Apartment.all
  end
  
end
