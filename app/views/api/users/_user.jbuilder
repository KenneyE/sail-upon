if user
  json.cache! ["users", users.length] do
    json.extract! user, :id, :username, :sail_count
    json.interests user.interests, partial: 'api/interests/interest', as: :interest
    json.votes user.votes, partial: 'api/votes/vote', as: :vote
  end
end