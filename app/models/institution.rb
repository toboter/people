class Institution < ApplicationRecord
  extend FriendlyId
  include SearchCop
  
  friendly_id :name, use: :slugged
  
  validates :name, presence: true

  has_many :affiliations, dependent: :destroy
  has_many :people, through: :affiliations
  
  has_closure_tree
  
  
  def self.possible_parents(institution)
    possible_parents = all-institution.self_and_descendants
  end
end
