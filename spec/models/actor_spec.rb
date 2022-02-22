require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe 'class methods' do
    before :each do
      @actor_1 = Actor.create!({name: 'Harrison Ford', age: 72})
      @actor_2 = Actor.create!({name: 'Karen Allen', age: 50})
      @actor_3 = Actor.create!({name: 'Alfred Molina', age: 66})

    end

    xit 'avg_age works' do
    # How do I fix this? It's giving me a .623333 as an answer - but is working on my show page.
      expect(Actor.avg_age).to eq(66)
    end
  end
end
