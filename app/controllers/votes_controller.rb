module Api
  class VotesController < ApiController
    def vote
      upvote? = params[:vote_key] == 1
      vote = Vote.find_by_user_and_site(current_user.id, params[:website_id])
      if vote
        vote.update_attributes(upvote: upvote?)
      else
        vote = Vote.new(user_id: current_user.id,
                        website_id: params[:website_id],
                        upvote: upvote?)
        vote.save
      end
      render json: vote
    end

    # private
    #
    # def vote_params
    #   params.permit()
    # end
  end
end
