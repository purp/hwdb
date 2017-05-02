class Environment < ApplicationRecord
  self.primary_key = :id

  has_and_belongs_to_many :users
  has_and_belongs_to_many :machines
end
