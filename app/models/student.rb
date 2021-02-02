class Student < ApplicationRecord
  has_many :ios
  has_one :lineuser
  has_many :messages
end
