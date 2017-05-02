class User < ApplicationRecord
  self.primary_key = :id

  has_and_belongs_to_many :environments
  has_many :machines, through: :environments
end
