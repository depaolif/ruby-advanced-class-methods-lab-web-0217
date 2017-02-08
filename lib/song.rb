class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	new_song = self.new
  	self.all << new_song
  	new_song
  end

  def self.new_by_name(name)
  	new_song = self.new
  	new_song.name = name
  	new_song
  end

  def self.create_by_name(name)
  	new_song = self.new_by_name(name)
  	self.all << new_song
  	new_song
  end

  def self.find_by_name(name)
  	self.all.detect do |song|
  		return song if song.name == name
  	end
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name)
  		self.find_by_name(name)
  	else
  		self.create_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by do |song|
  		song.name
  	end
  end

  def self.new_from_filename(filename)
  	file = filename.split(' - ')
  	new_song_artist = file[0]
  	new_song_name = file[1].split('.')[0]
  	new_song = self.create_by_name(new_song_name)
  	new_song.artist_name =  new_song_artist
  	new_song
  end

  def self.create_from_filename(filename)
  	new_song = self.new_from_filename(filename)
  	self.all << new_song
  	new_song
  end

  def self.destroy_all
  	self.all.clear
  end

end
