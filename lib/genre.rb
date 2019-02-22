class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
      @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    songs.collect{ |song| song.artist}.uniq
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    Genre.new(name).save
  end

end
