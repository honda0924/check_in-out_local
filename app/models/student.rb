class Student < ApplicationRecord
  acts_as_paranoid
  has_many :ios
  has_one :lineuser
  has_many :messages
end
