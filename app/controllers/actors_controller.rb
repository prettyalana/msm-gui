class ActorsController < ApplicationController
  def update
    actor_id = params.fetch("an_id")
    matching_records = Actor.where({:id => actor_id})
    the_actor = matching_records[0]
    the_actor.name = params.fetch("actor_name")
    the_actor.dob = params.fetch("actor_dob")
    the_actor.bio = params.fetch("actor_bio")
    the_actor.image = params.fetch("actor_image")
    # the_actor.director_id = params.fetch("actor_director_id")

    the_actor.save 

    redirect_to("/actors/#{the_actor.id}")
  end
  def create
    new_actor = Actor.new
    new_actor.name = params.fetch("actor_name")
    new_actor.dob = params.fetch("actor_dob")
    new_actor.bio = params.fetch("actor_bio")
    new_actor.image = params.fetch("actor_image")
    # new_actor.director_id = params.fetch("movie_director_id")

    new_actor.save

    redirect_to("/actors")
  end
  def delete
    the_id = params.fetch("an_id")
    matching_records = Actor.where({:id => the_id})
    the_actor = matching_records[0]
    the_actor.delete
    redirect_to("/actors")
  end
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
