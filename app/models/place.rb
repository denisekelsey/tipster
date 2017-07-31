class Place < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true, length: { minimum: 3, too_short: "Minimum %{count} characters required." }, uniqueness: { case_sensitive: false }
  validates :address, presence: true, length: { minimum: 3, too_short: "Minimum %{count} characters required." } 
  validates :description, presence: true, length: { minimum: 3, too_short: "Minimum %{count} characters required." } 
end
