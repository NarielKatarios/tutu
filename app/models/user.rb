class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :trackable , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  #validates :title, presence: true

  has_many :tickets
end

