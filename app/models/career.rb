class Career < ApplicationRecord
  has_many :requirements
  has_and_belongs_to_many :users
  validates :name, presence: true
end
