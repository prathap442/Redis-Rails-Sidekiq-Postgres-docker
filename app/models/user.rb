class User < ApplicationRecord
  has_many :tickets
  validates_uniqueness_of :email
end
