require "pry"
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
    new = self.new 
    new.save 
    new 
  end 
  def self.new_by_name(song_name)
    new = self.new
    new.name = song_name
    new
  end 
  def self.create_by_name(song)
    new = self.new
    new.name = song
    new.save
    new 
  end 
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end 
  def self.alphabetical
    @@all.sort_by {|a,b| a.name <=> b.name}
  end 
 end