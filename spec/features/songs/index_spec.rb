# AS a user,
# when I visit '/songs'
# I see each song's title and play count

require "rails_helper"

RSpec.describe "Songs index page", type: :feature do
  describe "As a user" do
    describe "when I visit '/songs'" do
      it "I see each song's title and play count" do
      artist = Artist.create!(name: 'Carly Rae Jepsen')
      song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357, artist_id: artist.id)
      song_2 = artist.songs.create(title: "Call Me Maybe", length: 207, play_count: 21456357, artist_id: artist.id)
        visit "/songs"
        # save_and_open_page
        expect(page).to have_content(song.title)
        expect(page).to have_content("Play Count: #{song.play_count}")

        expect(page).to have_content(song_2.title)
        expect(page).to have_content("Play Count: #{song_2.play_count}")
      end
    end
  end

end
