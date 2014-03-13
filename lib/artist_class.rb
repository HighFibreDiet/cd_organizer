class Artist
  attr_reader :artist_name, :artist_cds
  @@all_artists = []

  def initialize(artist_name)
    @artist_cds = []
    @artist_name = artist_name
  end

  def Artist.all
    @@all_artists
  end

  def Artist.create(artist_name)
    new_artist = Artist.new(artist_name)
    @@all_artists << new_artist
    new_artist
  end

  def Artist.exists?(user_input)
    search_result = false
    @@all_artists.each do |artist|
      if artist.artist_name == user_input
        search_result = true
      end
    end
    return search_result
  end

  def Artist.get_artist(user_input)
    result = nil
    if Artist.exists?(user_input)
      result = @@all_artists.detect {|artist| artist.artist_name == user_input}
    else
      result = Artist.create(user_input)
    end
    result
  end

  def Artist.clear
    @@all_artists = []
  end


end
