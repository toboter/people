class Profession < ApplicationRecord
  has_many :proficiencies, dependent: :destroy
end
