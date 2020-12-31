class Lineuser < ApplicationRecord
  belongs_to :student,optional: true
end
