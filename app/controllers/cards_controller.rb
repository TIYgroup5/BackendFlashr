class CardsController < ApplicationController
  def index
    @deck = Deck.find_by(id: params[:id])
    if @deck
      @deck.cards.each do |card|
         render "index.json.jbuilder", status: :ok
          # status 200
        end
    else 
      render json: { error: "Deck was not found." },
        status: :not_found
          # status 404
    end
  end

  def create
    @deck = Deck.find_by(id: params[:id])
    if @deck
      card = deck.cards.create(question: params[:question],
                               answer: params[:answer])
      render "create.json.jbuilder"
    else
      render json: { error: "Deck was not found. The new card was not created successfully." },
        status: :expectation_failed
          # status 417
    end
  end

  def update
    @deck = Deck.find_by(id: params[:id])
    if @deck && current_user.id == deck.user_id
      @card = @deck.cards.find_by(id: params[:id])
      if @card
        @card.update(question: params[:question]
                     answer: params[:answer])
        render "update.json.jbuilder"
      else
        render json: { error: "Card was not found" }
          status: :expectation_failed
            # status 417
      end
    else 
      render json: { error: "Either the deck does not exist, or it doesn't belong to #{current_user.username}."}
  end

  def destroy
  end
end
