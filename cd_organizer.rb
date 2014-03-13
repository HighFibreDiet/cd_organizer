require './lib/cd_class'
require './lib/artist_class'

def main_menu
  puts "\nWelcome to the CD Organizer 5000.\n\n"
  puts 'Please enter a selection:'
  puts "'n' to add a CD"
  puts "'l' to list your whole cd collection"
  puts "'s' to show your collection by artist"
  puts "'t' to search by title, or 'a' to search by artist"
  puts "'x' to exit"

  main_menu_choice = gets.downcase.chomp
  if main_menu_choice == "n"
    add_cd
  elsif main_menu_choice == "x"
    puts "Thanks for stopping by. Stay Classy."
  elsif main_menu_choice == "l"
    list_cds
  elsif main_menu_choice == 's'
    list_cds_by_artist
  elsif main_menu_choice == 't'
    search_by_title
  elsif main_menu_choice == 'a'
    search_by_artist
  else
    "Invalid input. Please try again."
    main_menu
  end
end

def add_cd
  puts "Add CD\n\n"
  puts 'Please enter the album title:'
  title_input = gets.chomp
  puts 'Enter the artist name:'
  artist_input = gets.chomp
  CompactDisc.create({:title => title_input, :artist => Artist.get_artist(artist_input)})
  main_menu
end

def list_cds
  CompactDisc.all.each_with_index do |cd, index|
    puts "#{index + 1}. #{cd.title} - #{cd.artist.artist_name}"
  end
  main_menu
end

def list_cds_by_artist
  Artist.all.each_with_index do |artist, index|
    puts "#{index + 1}. #{artist.artist_name}"
    artist.artist_cds.each_with_index do |cd, index|
      puts "\t#{index + 1}. #{cd.title}"
    end
  end
  main_menu
end

def search_by_title
  puts "Enter the title of the album you want to find"
  user_title = gets.chomp
  search_result = CompactDisc.search_by_title(user_title)

  puts "#{search_result.title} - #{search_result.artist.artist_name}"
  main_menu
end

def search_by_artist
  puts "Enter the artist name you want to find CDs for"
  user_artist = gets.chomp
  search_result = CompactDisc.search_by_artist(user_artist)
  puts "\nAll albums by #{user_artist}"
  search_result.each_with_index do |cd, index|
    puts "\t#{index + 1}. #{cd.title}"
  end
  main_menu
end

main_menu
