require_relative 'phone'
require_relative 'contact'
require_relative 'no_match_error'


class Application

  def self.add_contact(firstname, lastname, email)
    contact = Contact.create(firstname: firstname, lastname: lastname, email: email)
    puts "#{contact.firstname} #{contact.lastname} has been added."
  end

  def self.destroy_contact(id)
   contact = Contact.find(id).destroy
   puts "#{contact.firstname} #{contact.lastname} has been deleted." if contact
  end

  def self.find_by_lastname(lastname)
   contact = Contact.find_by(lastname: lastname)
   contact ? contact.display : (raise NoMatchError)
  end

  def self.find_by_firstname(firstname)
   contact = Contact.find_by(firstname: firstname)
   contact ? contact.display : (raise NoMatchError)
  end

  def self.find_by_email(email)
   contact = Contact.find_by(email: email)
   contact ? contact.display : (raise NoMatchError)
  end

  def self.all
    contacts = Contact.all
    contacts.each do|contact|
      contact ? contact.display : (raise NoMatchError)
    end
  end

  def self.update(id, field, value) #takes three parameters, the contact you want to update, the column you want to update an the value you want to update with.
    contact = Contact.find(id)
    
    case field
      when 'firstname'
        contact.firstname = value
        p "First name is now #{value}."
      when 'lastname'
        contact.lastname = value
        p "Last name is now #{value}."
      when 'email'
        contact.email = value
        p "Email is now #{value}."
      else
        return
    end

    contact.save
  end


end

Application.find_by_firstname('Meganf')


