class PersonSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :type, :given_name, :family_name, :first_names, :honorific_prefix, :honorific_suffix 
  attributes :gender, :birthday, :deathday, :about, :place_of_birth, :place_of_death, :display_name
  attributes :links, :full_entry
  has_many :professions
  attributes :professions
  
  def type
    object.class.name
  end
  
  def full_entry
    "#{object.full_name(false)} (#{object.professions.map{|p| p.name}.join(', ')}); #{(object.deathday.present? ? "day of birth #{object.birthday}, day of death #{object.deathday}" : object.affiliations.order(till: :desc).first.try(:institution).try(:name))}"
  end
  
  def links
    {
      self: api_person_url(object, host: Rails.application.secrets.host),
      human: person_url(object, host: Rails.application.secrets.host)
    }
  end
  
  def professions
    object.professions.map(&:name).join(', ')
  end
end
