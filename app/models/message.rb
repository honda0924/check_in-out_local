class Message < ApplicationRecord
  belongs_to :messages,optional: true
end
