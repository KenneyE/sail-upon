json.extract! user, :id, :username
json.interests user.interests, partial: 'api/interests/interest', as: :interest
json.votes user.votes, partial: 'api/votes/vote', as: :vote