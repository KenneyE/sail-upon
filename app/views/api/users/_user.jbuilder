json.extract! user, :id, :username
json.interests user.interests, partial: 'api/interests/interest', as: :interest