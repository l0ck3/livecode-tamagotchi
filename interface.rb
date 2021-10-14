require_relative "tamago"
require_relative "status"

puts "Hello! Welcome to TamaLand"
puts "Meet your new Tama! What name would you like to give him ?"

print "> \n"
# name = gets.chomp.capitalize
name = "Mou"

tama = Tamago.new(name)

puts "Ok! Your Tama will be named #{name}. He's happy you found him such a beautiful name"

display_status(tama)