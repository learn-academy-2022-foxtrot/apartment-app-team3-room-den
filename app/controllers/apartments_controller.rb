class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
    render json: @apartments
  end
end
