require 'pry' # incase you want to use binding.pry
require 'active_record'
require_relative 'contact'
require_relative 'phone'

# Output messages from AR to STDOUT
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'dug9nq59bmjh0',
  username: 'thnwitebsqrgsl',
  password: 'ARITSGAGYX08xeuAk9mZR6pXMy',
  host: 'ec2-107-21-93-97.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)
puts "CONNECTED"


# puts "Setting up Database (recreating tables) ..."

# ActiveRecord::Schema.define do
#   drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
#   drop_table :phones if ActiveRecord::Base.connection.table_exists?(:phones)
#   create_table :contacts do |t|
#     t.column :firstname, :string
#     t.column :lastname, :string
#     t.column :email, :string
#     t.timestamps
#   end
#   create_table :phones do |t|
#     t.references :contact
#     t.column :type, :string
#     t.column :number, :integer
#     t.timestamps
#   end

# end

puts "Setup DONE"