class DeckController < ApplicationController

  def index
    @decks = Deck.all
    render "index.json.jbuilder", status: :ok
    # status 200
  end

  def create
    @deck = Deck.new(params[:deck])
    if @deck.save
      render "create.json.jbuilder", status: :ok
    else
      render json: {@deck.errors},
        status: :unprocessable_entity
    end
  end


  def update
    @deck = Deck.find(params[:id])
    if @deck.update(deck: params[:deck]
                    title: params [:title])
      render "create.json.jbuilder",
        status: :ok

    else
      render json: {@deck.errors},
        status: :unprocessable_entity
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    if current_user.id == deck.user_id
      @deck.destroy
    else

      render json: { error: "Invalid (#{params[:user]})" },
        status: :unauthorized
    end
  end
end
