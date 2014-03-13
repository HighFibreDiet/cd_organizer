require 'rspec'
require 'cd_class'

describe CompactDisc do
  describe 'initialize' do
    it 'initializes an instance of CompactDisc' do
      test_artist = Artist.create('Def Leppard')
      new_cd = CompactDisc.new({:title => 'Hysteria', :artist => test_artist})
      new_cd.should be_an_instance_of CompactDisc
    end
    it 'sets the album title and artist properties' do
      test_artist = Artist.create('Def Leppard')
      new_cd = CompactDisc.new({:title => 'Hysteria', :artist => test_artist})
      new_cd.title.should eq 'Hysteria'
    end
  end

  describe '.create' do
    it 'saves a new CD to an array' do
      test_artist = Artist.create('Def Leppard')
      new_cd = CompactDisc.create({:title => 'Hysteria', :artist => test_artist})
      CompactDisc.all.include?(new_cd).should eq true
    end
    it 'pushes the new CD to the artist instance array' do
      test_artist = Artist.create('Def Leppard')
      new_cd = CompactDisc.create({:title => 'Hysteria', :artist => test_artist})
      test_artist.artist_cds.include?(new_cd).should eq true
    end
  end

  describe '.search_by_title' do
    it 'returns the cd object with the given title' do
      test_artist = Artist.create('Def Leppard')
      new_cd = CompactDisc.create({:title => 'Hysteria', :artist => test_artist})
      CompactDisc.search_by_title('Hysteria').should eq new_cd
    end
  end

  describe '.search_by_artist' do
    it 'returns the cd object for the searched by artist name' do
      test_artist = Artist.create('Def Leppard')
      new_cd = CompactDisc.create({:title => 'Hysteria', :artist => test_artist})
      CompactDisc.search_by_artist('Def Leppard').should eq new_cd
    end
  end

end
