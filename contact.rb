require_relative 'setup'


class Contact < ActiveRecord::Base
  has_many :phones

  validates :email, uniqueness: { case_sensitive: false }
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :email, presence: true


  def display
    puts "#{self.firstname} #{self.lastname}  -  Email:#{self.email}"
  end
end


