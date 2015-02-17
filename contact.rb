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

  def save
    self.id ? update : create
  end

  def create
    self.class.connection.exec_params("INSERT INTO contacts (firstname, lastname, email)
    VALUES ($1,$2,$3)",[@firstname, @lastname, @email])
  end

  def update
    puts 'update'
  end

  def self.test
    connection.exec("SELECT * FROM contacts;") do |contacts|
      contacts.each do |contact|
        p contact
      end
    end
  end

end

p c = Contact.new('Bob','Marley','Marley@gmail.com')
c.save
print Contact.test

