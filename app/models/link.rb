class Link < ApplicationRecord
  belongs_to :person
  validates :name, :url, presence: true
end
