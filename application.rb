require_relative 'contact'

class Application

  def self.add_contact(firstname, lastname, email)
    Contact.create(firstname: firstname, lastname: lastname, email: email)
    puts "#{contact.firstname} #{contact.lastname} has been added."
  end

  def self.destroy_contact(id)
   contact =  Contact.find(id).destroy
   puts "#{contact.firstname} #{contact.lastname} has been deleted."
  end

  def self.find_by_lastname(lastname)
   contact =  Contact.find_by(lastname: lastname)
   puts "#{contact.firstname} #{contact.lastname}  -  Email:#{contact.email}"
  end

  def self.find_by_firstname(firstname)
   contact =  Contact.find_by(firstname: firstname)
   puts "#{contact.firstname} #{contact.lastname}  -  Email:#{contact.email}"
  end

  def self.find_by_email(email)
   contact =  Contact.find_by(email: email)
   puts "#{contact.firstname} #{contact.lastname}  -  Email:#{contact.email}"
  end


end



 Application.find_by_email('drewhgood@gmail.com')
# Application.add_contact('andrew','good','drewhgood@gmail.com')

# Application.destroy_contact(4)

