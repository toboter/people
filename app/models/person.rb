class Person < ApplicationRecord
  extend FriendlyId
  include SearchCop
  
  friendly_id :display_name, use: :slugged

  validates :family_name, :given_name, presence: true

  has_many :proficiencies, dependent: :destroy
  has_many :professions, through: :proficiencies
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true
  has_many :participations, dependent: :destroy
  accepts_nested_attributes_for :participations, reject_if: :all_blank, allow_destroy: true
  has_many :affiliations, dependent: :destroy
  has_many :institutions, through: :affiliations
  accepts_nested_attributes_for :affiliations, allow_destroy: true
  
  search_scope :search do
    attributes :first_names, :family_name, :given_name
    attributes :profession => "professions.name"
    #attributes :creator => ["creators.lname", "creators.fname"]
    #attributes :tag => "tags.name"
  end

  def display_name
  	"#{given_name} #{family_name}"
  end

  def full_name
  	"#{honorific_prefix} #{first_names ? first_names : given_name} #{family_name} #{honorific_suffix}"
  end
  
  def profession_list
    professions.map(&:name).join(", ")
  end
  
  def profession_list=(names)
    self.professions = names.reject { |c| c.empty? }.split(",").flatten.map do |n|
      Profession.where(name: n).first_or_create!
    end
  end
  
end
