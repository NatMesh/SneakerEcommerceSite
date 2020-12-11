class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :province
  has_many :orders
  validates :full_name, :email, :password, :address, :postal_code, :city, :country, :phone_number,
            presence: true
end
