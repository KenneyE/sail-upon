module Api
  class VotesController < ApiController
    def vote
      upvote = params[:vote_key] == 1
      vote = Vote.find_by(user_id: current_user.id, website_id: params[:website_id])
      if vote
        vote.update_attributes(upvote: upvote)
        status = "updated"
      else
        vote = Vote.new(user_id: current_user.id,
                        website_id: params[:website_id],
                        upvote: upvote)
        vote.save
        status = "new"
      end

      render json: { vote: vote, status: status }
    end

    # private
    #
    # def vote_params
    #   params.permit()
    # end
  end
end
