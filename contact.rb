require 'pg'

class Contact

  def initialize
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

  # def self.test
  #   connection.exec("SELECT * FROM contacts;") do |contacts|
  #     contacts.each do |contact|
  #       p contact
  #     end
  #   end
  # end

end





p Contact.test