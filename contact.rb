require_relative 'setup'

class Contact < ActiveRecord::Base
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :email, presence: true

end
