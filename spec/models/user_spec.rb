require 'rails_helper'
  devise :database_authenticable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :campaigns, dependent: :destroy
end