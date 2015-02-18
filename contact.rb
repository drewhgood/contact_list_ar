require 'pg'
require 'pry'

class Contact

  attr_accessor :firstname, :lastname, :email, :id

  def initialize(firstname, lastname, email)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = nil
  end


  def self.connection
    return @conn if @conn
    @conn = PG.connect( 
      dbname: 'dug9nq59bmjh0',
      host: 'ec2-107-21-93-97.compute-1.amazonaws.com',
      port: 5432,
      user: 'thnwitebsqrgsl',
      password:'ARITSGAGYX08xeuAk9mZR6pXMy'
    )
  end


  # def display(contact)
  #   name = contact['firstname']
  #   p name
  # end



  # def self.find(id)
  #   connection.exec_params("SELECT * FROM contacts Where id = $1;", [id] ) do |contacts|
      
  #     contacts.each do |contact|
  #       # p contact['firstname']
  #       display(contact)
  #     end

  #   end
  # end


  def self.find_all_by_lastname(lastname)
    connection.exec_params("SELECT * FROM contacts Where lastname = $1;", [lastname] ) do |contacts|
      
      contacts.each do |contact|
        p contact
     
      end

    end
  end

  def self.find_all_by_firstname(firstname)
    connection.exec_params("SELECT * FROM contacts Where firstname = $1;", [firstname] ) do |contacts|
      
      contacts.each do |contact|
        p contact
     
      end

    end
  end



  def save
    self.id ? update : create_contact  
  end


  def delete
    self.class.connection.exec_params("DELETE FROM contacts WHERE id = $1", [self.id] ) 
  end


  def create_contact
      
      matching_records = self.class.connection.exec_params("SELECT * FROM contacts WHERE email = $1;", [@email] )
      
      if matching_records.ntuples!= 0
      puts "Email address already exists."

      else 
      self.class.connection.exec_params("INSERT INTO contacts (firstname, lastname, email)
      VALUES ($1,$2,$3)",[@firstname, @lastname, @email]) 

      id = self.class.connection.exec_params("SELECT id FROM contacts 
        WHERE firstname = $1 AND lastname = $2 AND email = $3",[@firstname, @lastname, @email])
      
      id.each do |item|
        item
        @id = item["id"] 

      end

    end

  end

  def update
    puts "Updated"
    # self.class.connection.exec_params("UPDATE pets SET name = $1 WHERE id = $2", [@name, @id])
    #once we have the update method we can complete this
    # self.class.connection.exec_params("UPDATE contacts SET name = $1 WHERE id = $2", [@name, @id])
  end

  def self.test
    connection.exec("SELECT * FROM contacts;") do |contacts|
      contacts.each do |contact|
        p contact
      end
    end
  end

end

# p c = Contact.new('Jssssss','Pannn','joese@hossssssail.com')
# c.save
# print Contact.test

Contact.find_all_by_firstname('Andrew')

