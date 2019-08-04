class Drink < ApplicationRecord
  belongs_to :shop

  has_many :takes, foreign_key: 'drink_id', dependent: :destroy
  has_many :users, through: :takes, source: :user
end
