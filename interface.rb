require_relative "tamago"
require_relative "status"

def display_status(tama)  
  print "\n\n\n"
  puts "Current status for #{tama.name}"
  print "\n"
  print_bar "Health", tama.health
  print_bar "Hunger", tama.hunger
  print_bar "Thirst", tama.thirst
  print "\n"
end

def print_bar(title, value)
  print "#{title}: "
  value.times { print "=" }
  print "\n"
end

puts "Hello! Welcome to TamaLand"
puts "Meet your new Tama! What name would you like to give him ?"

print "> \n"
name = gets.chomp.capitalize

tama = Tamago.new(name)

puts "Ok! Your Tama will be named #{name}. He's happy you found him such a beautiful name"

day = 1

loop do 
  print `clear`
  puts "This is day #{day} with your Tama #{tama.name}. Here is how he feels"
  display_status(tama)
  puts "What would you like to do ? (feed, water, nothing)"
  
  choice = gets.chomp

  case choice
  when 'feed' then tama.feed!
  when 'water' then tama.give_water!
  end

  tama.one_day_passes!
  break if tama.dead?
end

puts "Oh no !!!! #{tama.name} died. You monster!"

