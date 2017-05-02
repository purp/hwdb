class Machine < ApplicationRecord
  self.primary_key = :id

  has_and_belongs_to_many :environments
  has_many :users, through: :environments
end
