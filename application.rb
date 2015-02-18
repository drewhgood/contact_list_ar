require_relative 'contact'

class Application

  def self.add_contact(firstname, lastname, email)
    Contact.create(firstname: firstname, lastname: lastname, email: email)
  end

end




Application.add_contact('Andrew', 'Good', 'drewhgood@gmail.com')