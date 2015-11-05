class UserGuessesController < ApplicationController
  def new
    if current_user
      @guess = current_user.user_guesses.create(duration: nil,
                                  correct: nil)
      render "show.json.jbuilder", status: :created
        # status: 201
    else 
      render json: { error: "You must be logged in to create a new guess."},
        status: :unauthorized
        # status: 401
    end
  end

  def update
    @guess = user_guesses.find_by(id: params[:id])
    if @guess && current_user.id == @guess.user_id
      @guess.update(duration: (params[:updated_at] - params[:created_at])),
                    correct: params[:correct])
    render "show.json.jbuilder", status: :accepted
      # status 202
    else
      render json: { error: "The guess you've requested either oes not exist or does not belong to #{current_user.username}."},
        status: :not_found
        # status 404
    end
  end

  def show
    @guess = user_guesses.find_by(id: params[:id])
    if @guess
      render "show.json.jbuilder", status: :ok
        # status 200
    else
      render json: { error: "The guess you've requested does not exist."},
        status: :not_found
        # status 404
    end
  end
end