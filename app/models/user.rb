class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :tickets

  def full_name
    "#{first_name} #{last_name}"
  end
end

