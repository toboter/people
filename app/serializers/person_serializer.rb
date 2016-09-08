class PersonSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :given_name, :family_name, :first_names, :honorific_prefix, :honorific_suffix 
  attributes :gender, :birthday, :deathday, :about, :place_of_birth, :place_of_death
  attributes :links
  has_many :professions
  attributes :professions
  
  
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
