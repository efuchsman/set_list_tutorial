require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}
  describe 'instance methods' do
    before :each do
      @prince = Artist.create!(name: 'Prince')
      @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
      @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 99)
      @other_song = @prince.songs.create!(title: 'Another Prince Song', length: 1, play_count: 99)
    end
    describe 'average_song_length' do
      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(503.33)
      end
    end
    describe '#songs' do
      it 'returns all of the associated song objects' do

        expect(@prince.songs).to eq([@purple, @beret, @other_song])
      end
    end
    describe '#song_count' do
      it 'counts the number of songs' do
        expect(@prince.song_count).to eq(3)
      end
    end
    describe '#wrote_song?' do
      it 'returns true if the song is associated with the artist' do
        expect(@prince.wrote_song?(@purple)).to be true
      end
    end
  end
end
