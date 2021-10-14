require_relative "tamago"

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

print "> "
name = gets.chomp.capitalize

tama = Tamago.new(name)

puts "Ok! Your Tama will be named #{name}. He's happy you found him such a beautiful name"

day = 1

loop do 
  print `clear`
  puts "This is day #{day} with your Tama #{tama.name}. Here is how he feels"
  display_status(tama)
  puts "What would you like to do ?"
  puts "1 - Feed him"
  puts "2 - Give him water"
  puts "Press any other key to do nothing"
  
  choice = gets.chomp.to_i

  case choice
  when 1 then tama.feed!
  when 2 then tama.give_water!
  end

  tama.one_day_passes!
  day += 1
  break if tama.dead?
end

puts "Oh no !!!! #{tama.name} died. You monster!"

