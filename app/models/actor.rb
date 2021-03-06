class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.avg_age
    Actor.average(:age)
  end
end
