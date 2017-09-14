class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    self.songs.first.genre
  end

  def song_count
    self.songs.count
  end

  def genre_count
    self.songs.map do |song|
      song.genre
    end.uniq.size
  end

  def self.find_or_create_by_name(name)
    exists = self.all.find_by(name: name.capitalize)
    unless exists
      exists = Artist.new({name:name.capitalize})
      exists.save
    end
    exists
  end
end
