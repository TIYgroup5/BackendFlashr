class CardsController < ApplicationController
  def index
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
    if @cards
      render "index.json.jbuilder", status: :ok
        # status 200
    else 
      render json: { error: "There are no cards to display." },
        status: :not_found
          # status 404
    end
  end

  def show
    @card = Card.find(params[:id])
    deck = Deck.find_by(id: @card.deck_id)
    if @card && deck.user_id == current_user.id
      render "show.json.builder", status: :ok
    end
  end

  def create
    @deck = Deck.find(params[:id])
    if @deck && @deck.user_id == current_user.id
      @card = @deck.cards.create(question: params[:question],
                                 answer: params[:answer])
      render "create.json.jbuilder", status: :created
        # status 201
    else
      render json: { error: "Deck was not found. The new card was not created successfully." },
        status: :expectation_failed
          # status 417
    end
  end

  def update
    @card = Card.find(params[:id])
    deck = Deck.find_by(id: @card.deck_id)
    if @card && current_user.id == deck.user_id
      @card.update(question: params[:question],
                   answer: params[:answer])
        render "update.json.jbuilder", status: :accepted
          # status 202
    else
        render json: { error: "Either the card was not found or it does not belong to #{current_user.username}" },
          status: :expectation_failed
            # status 417
    end
  end

  def destroy
    @card = Card.find_by(id: params[:id])
    deck = Deck.find_by(id: @card.deck_id)
    if @card && current_user.id == deck.user_id
      @card.destroy
      render plain: "The card has been deleted successfully.",
        status: :accepted
        # status: 202
    else
      render json: { error: "The card you requested does not exist, or you aren't authorized to delete it." },
        status: :unauthorized
        # status: 401
    end
  end
end
