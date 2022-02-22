require 'rails_helper'

RSpec.describe Movie do
  describe 'User story 2' do
    before :each do
      @studio_1 = Studio.create!({name: 'Universal Studios', location: 'Hollywood'})
      @studio_2 = Studio.create!({name: 'Lucas Films', location: 'Hollywood'})
      @movie_1 = @studio_1.movies.create!({title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure'})
      @movie_2 = @studio_1.movies.create!({title: 'Dune', creation_year: 1984, genre: 'Science Fiction'})
      @movie_3 = @studio_2.movies.create!({title: 'Great Ewok Adventure', creation_year: 1986, genre: 'Science Fiction'})
      @actor_1 = Actor.create!({name: 'Harrison Ford', age: 78})
      @actor_2 = Actor.create!({name: 'Karen Allen', age: 56})
      @actor_3 = Actor.create!({name: 'Alfred Molina', age: 65})
      @cast_1 = MovieActor.create!({movie_id: @movie_1.id, actor_id: @actor_1.id})
      @cast_2 = MovieActor.create!({movie_id: @movie_1.id, actor_id: @actor_2.id})
      @cast_3 = MovieActor.create!({movie_id: @movie_1.id, actor_id: @actor_3.id})
    end

    it 'movies show page - shows attributes and actors sorted from youngest to oldest with average' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
    end

    it 'movies show page - actors sorted from youngest to oldest with average' do
      visit "/movies/#{@movie_1.id}"
      expect(page).to have_content(@movie_1.actors.avg_age)
      save_and_open_page
      
      within('#actor-0') do
        expect(page).to have_content(@actor_2.name)
      end

      within("#actor-1") do
        expect(page).to have_content(@actor_3.name)
      end

      within("#actor-2")do
        expect(page).to have_content(@actor_1.name)
      end
    end
  end
end
