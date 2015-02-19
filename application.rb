require_relative 'contact'

class Application

  def self.add_contact(firstname, lastname, email)
    Contact.create(firstname: firstname, lastname: lastname, email: email)
  end

  def self.destroy_contact(id)
   contact =  Contact.find(id).destroy
   puts "#{contact.firstname} #{contact.lastname} has been deleted."
  end

  def self.find_by_lastname(lastname)
   contact =  Contact.find_by(lastname: lastname)
   puts "#{contact.firstname} #{contact.lastname}  -  Email:#{contact.email}"
  end


end



Application.find_by_lastname('Good')
#Application.add_contact('andrew','good','drew@dsa.com')

# Application.destroy_contact(4)

