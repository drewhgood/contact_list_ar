require_relative 'contact'

class Application

  def self.add_contact(firstname, lastname, email)
    Contact.create(firstname: firstname, lastname: lastname, email: email)
  end

  def self.destroy_contact(id)
   contact =  Contact.find(id).destroy
   puts "#{contact.firstname} #{contact.lastname} has been deleted."
  end

end




#Application.add_contact('andrew','good','drew@dsa.com')

# Application.destroy_contact(4)

