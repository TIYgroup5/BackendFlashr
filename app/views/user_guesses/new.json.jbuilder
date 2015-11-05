json.user do
  json.extract! @guess, :id, :duration, :correct, :card_id, :user_id
end