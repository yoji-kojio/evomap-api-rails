class Requirement < ApplicationRecord
  belongs_to :career
  has_and_belongs_to_many :contents
end
