require_relative 'setup'

class Contact < ActiveRecord::Base

  # has_many :phone_numbers, dependent: :destroy

  validates :email, uniqueness: { case_sensitive: false }
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :email, presence: true
end
