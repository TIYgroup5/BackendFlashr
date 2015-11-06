class UserGuessesController < ApplicationController
  def new
    if current_user
      @card = Card.find(params[:id])
      @correct = @card.answer == params[:guess]

      @guess = current_user.user_guesses.create!(duration: params[:duration].to_i,
                                                 correct: @correct,
                                                 card_id: @card.id)
      render "new.json.jbuilder", status: :created
        # status: 201
    else 
      render json: { error: "You must be logged in to create a new guess."},
        status: :unauthorized
        # status: 401
    end
  end

  def show
    @guess = current_user.user_guesses.find(params[:id])
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