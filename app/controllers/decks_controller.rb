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
      render json: { error: "Could not create deck"},
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
      render json:{error: "Could not update"},
        status: :unprocessable_entity
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    if @deck && current_user.id == @deck.user_id
      @deck.destroy
      render json: { reponse: "Has been deleted"}
    else

      render json: { error: "Can not destroy" },
        status: :unauthorized
    end
  end
end
