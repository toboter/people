class Profession < ApplicationRecord
  has_many :proficiencies, dependent: :destroy
  validates :name, presence: true
end
