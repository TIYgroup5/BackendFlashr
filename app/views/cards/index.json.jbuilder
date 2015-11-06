json.cards @cards do |card|
  json.extract! card, :id, :deck_id, :question, :answer
end