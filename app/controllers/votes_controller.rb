class VotesController < ApplicationController



  # def new
  #   @vote = Vote.new
  # end


  def create
    if params.key?(:comment_id)
      thing = Comment.find(params[:comment_id])
      @post = Post.find(params[:post_id])
      return_to = @post
    elsif params.key?(:post_id)
      thing = Post.find(params[:post_id])
      return_to = posts_path
    elsif params.key?(:user_id)
      thing = Post.find(params[:user_id])
    else
      return render plain: "Invalid input."
    end

    my_vote = thing.votes.find_by_user_id(current_user.id)
    #if there is no vote from this user yet
    if my_vote.nil?
      #create a vote
      current_user.ratings << thing.votes.create(vote_params)
    else
      if(params[:vote][:value].to_i != my_vote.value)
        my_vote.value = params[:vote][:value]
        my_vote.save
      else
        flash[:danger] = "You have already voted on that!"
      end
    end

    respond_to do |format|
      format.html { redirect_to return_to }
      format.json {render json:{result: true, votes:thing.votes}}
    end

  end


  private

  def vote_params
    params.require(:vote).permit(:value,:votable,:user_id)
  end


end