class CompactDisc
  attr_reader :title, :artist
  @@all_cds = []

  def initialize(attributes)
    @title = attributes[:title]
    @artist = attributes[:artist]
  end

  def CompactDisc.create(attributes)
    new_cd = CompactDisc.new(attributes)
    @@all_cds << new_cd
    attributes[:artist].artist_cds << new_cd
    new_cd
  end

  def CompactDisc.all
    @@all_cds
  end

  def CompactDisc.search_by_title(title)
    search_result = nil
    @@all_cds.each do |cd|
      if cd.title == title
        search_result = cd
      end
    end
    search_result
  end

  def CompactDisc.search_by_artist(artist)
    search_result = []
    @@all_cds.each do |cd|
      if cd.artist.artist_name == artist
        search_result << cd
      end
    end
    search_result
  end
end
