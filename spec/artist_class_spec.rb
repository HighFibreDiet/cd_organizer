require 'rspec'
require 'artist_class'

describe Artist do
  before do
    Artist.clear
  end

  describe 'initialize' do
    it 'initializes a new instance of an artist' do
      test_artist = Artist.new('Pink Floyd')
      test_artist.should be_an_instance_of Artist
    end
    it 'sets the name property of the artist instance' do
      test_artist = Artist.new('Pink Floyd')
      test_artist.artist_name.should eq 'Pink Floyd'
    end
  end

  describe '.create' do
    it 'pushes the new artist instance to the all artists array' do
      test_artist = Artist.create('Pink Floyd')
      Artist.all.include?(test_artist).should eq true
    end
  end

  describe '.exists?' do
    it 'returns a true value if the artist has already been created' do
      test_artist = Artist.create("Pink Floyd")
      Artist.exists?("Pink Floyd").should eq true
    end
    it 'returns a false value if the artist doesnt already exist' do
      test_artist = Artist.create("Pink Floyd")
      Artist.exists?("The Beatles").should eq false
    end
  end

  describe '.get_artist' do
    it 'returns the artist object for an existing artist (if it exists)' do
      test_artist = Artist.create("Pink Floyd")
      Artist.get_artist("Pink Floyd").should eq test_artist
    end
  end

end

