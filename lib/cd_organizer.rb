require './lib/cd_class'
require './lib/artist_class'

def main_menu
  puts "Welcome to the CD Organizer 5000.\n\n"
  puts 'Please enter a selection:'
  puts '"a" to add a CD, "x" to exit'

  main_menu_choice = gets.downcase.chomp

  if main_menu_choice == "a"
    add_cd
  elsif main_menu_choice == "x"
    puts "Thanks for stopping by. Stay Classy."
  end
end

def add_cd
  puts "Add CD\n\n"
  puts 'Please enter the album title:'
  title_input = gets.chomp
  puts 'Enter the artist name:'
  artist_input = gets.chomp
  CompactDisc.create({:title => title, :artist => Artist.get_artist(artist_input)})
  main_menu
end

main_menu
