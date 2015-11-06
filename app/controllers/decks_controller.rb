class DecksController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @decks = Deck.all
    # binding.pry
    render "index.json.jbuilder", status: :ok
    # status 200
  end

  def create
    @deck = Deck.new(title: params[:title], user_id: current_user.id)
    if @deck.save
      render "create.json.jbuilder", status: :ok
    else
      render json: { error: "Deck was not found. The new deck was not created successfully."},
        status: :unprocessable_entity
    end
  end


  def update
    @deck = Deck.find(params[:id])
    if @deck.update(title: params[:title]
                    )

      render "create.json.jbuilder",
        status: :ok

    else
      render json:{error: "Either the deck was not found or it does not belong to #{current_user.username}"},
        status: :unprocessable_entity
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    if @deck && current_user.id == @deck.user_id
      @deck.destroy
      render json: { reponse: "The deck has been deleted successfully."}
    else

      render json: { error: "The deck you requested does not exist, or you aren't authorized to delete it." },
        status: :unauthorized
    end
  end
end
