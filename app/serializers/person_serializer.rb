class PersonSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :family_name, :middle_name, :honorific_prefix, :honorific_suffix, :gender, :birthday, :deathday, :about, :place_of_birth
end
