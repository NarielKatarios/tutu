class User < ApplicationRecord
  validates :title, presence: true

  has_many :tickets
end

