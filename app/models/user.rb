class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :favorites,dependent:   :destroy
  has_many :favorite_estimates, through: :favorites, source: :estimate
  
  has_many :dwellings, dependent: :destroy
  has_many :dwelling_estimates, through: :dwellings, source: :estimate
  
  
  
end
