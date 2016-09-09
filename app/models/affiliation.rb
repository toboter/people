class Affiliation < ApplicationRecord
  belongs_to :person
  belongs_to :institution
  
  def till
    super || Date.today
  end
  
end
