class InstitutionSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :fax, :url, :street, :zip, :city, :country, :slug
end
