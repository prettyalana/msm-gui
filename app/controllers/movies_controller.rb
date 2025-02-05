class MoviesController < ApplicationController
  def update
    movie_id = params.fetch("an_id")
    matching_records = Movie.where({:id => movie_id})
    the_movie = matching_records[0]
    the_movie.title = params.fetch("movie_title")
    the_movie.year = params.fetch("movie_year")
    the_movie.duration = params.fetch("movie_duration")
    the_movie.description = params.fetch("movie_description")
    the_movie.image = params.fetch("movie_image")
    the_movie.director_id = params.fetch("movie_director_id")

    the_movie.save 

    redirect_to("/movies/#{the_movie.id}")
  end
  def create
    new_movie = Movie.new
    new_movie.title = params.fetch("movie_title")
    new_movie.year = params.fetch("movie_year")
    new_movie.duration = params.fetch("movie_duration")
    new_movie.description = params.fetch("movie_description")
    new_movie.image = params.fetch("movie_image")
    new_movie.director_id = params.fetch("movie_director_id")

    new_movie.save

    redirect_to("/movies")
  end
  def delete
    the_id = params.fetch("an_id")
    matching_records = Movie.where({:id => the_id})
    the_movie = matching_records[0]
    the_movie.delete
    redirect_to("/movies")
  end
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
