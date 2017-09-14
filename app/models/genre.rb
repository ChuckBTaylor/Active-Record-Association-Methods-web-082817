class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    self.songs.map do |song|
      song.artist
    end.uniq.count
  end

  def all_artist_names
    self.songs.map do |song|
      song.artist.name
    end.uniq
  end
end
