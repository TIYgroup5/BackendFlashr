# class UserGuessesController < ApplicationController
#   def new
#     if current_user
#       @card = Card.find(params[:id])
#       @guess = current_user.user_guesses.create(duration: nil,
#                                                 correct: nil,
#                                                 card_id: @card.id)
#       render "show.json.jbuilder", status: :created
#         # status: 201
#     else 
#       render json: { error: "You must be logged in to create a new guess."},
#         status: :unauthorized
#         # status: 401
#     end
#   end

#   def update
#     @guess = user_guesses.find_by(id: params[:id])
#     if @guess && current_user.id == @guess.user_id
#       binding.pry
#       duration = Time.now - @guess.created_at
#       @guess.update(duration: duration,
#                     correct: params[:correct])
#     render "show.json.jbuilder", status: :accepted
#       # status 202
#     else
#       render json: { error: "The guess you've requested either does not exist or does not belong to #{current_user.username}."},
#         status: :not_found
#         # status 404
#     end
#   end

#   def show
#     @guess = user_guesses.find_by(id: params[:id])
#     if @guess
#       render "show.json.jbuilder", status: :ok
#         # status 200
#     else
#       render json: { error: "The guess you've requested does not exist."},
#         status: :not_found
#         # status 404
#     end
#   end
# end