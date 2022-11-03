class Apartment < ApplicationRecord
  belongs_to :user
  validates :street, :city, presence: true
end
