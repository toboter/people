class Proficiency < ApplicationRecord
  belongs_to :person
  belongs_to :profession
end
