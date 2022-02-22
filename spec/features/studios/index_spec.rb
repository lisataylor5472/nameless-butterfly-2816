require 'rails_helper'

RSpec.describe Studio do
  describe 'User story 1' do
    before :each do
      @studio_1 = Studio.create!({name: 'Universal Studios', location: 'Hollywood'})
      @studio_2 = Studio.create!({name: 'Lucas Films', location: 'Hollywood'})
      @movie_1 = @studio_1.movies.create!({title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure'})
      @movie_2 = @studio_1.movies.create!({title: 'Dune', creation_year: 1984, genre: 'Science Fiction'})
      @movie_3 = @studio_2.movies.create!({title: 'Great Ewok Adventure', creation_year: 1986, genre: 'Science Fiction'})
    end

    it 'index page shows Studio and all Movies' do
      visit "/studios"

      within("#studio-#{@studio_1.id}") do
        expect(page).to have_content(@studio_1.name)
        expect(page).to have_content(@movie_1.title)
        expect(page).to have_content(@movie_2.title)
        expect(page).to_not have_content(@movie_3.title)
      end
    end
  end
end
