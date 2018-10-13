class VotesController < ApplicationController

  def index
    @votes = Vote.all
  end

  def edit
    @vote = Vote.find_by(id: params[:id])
  end

  def update
    @vote = Vote.find(params[:id])
    if @vote.update(vote_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    vote = Vote.new(vote_params)
    if vote.save
      # do something
    else
      # flash that something went wrong
    end
  end


  private

  def vote_params
    return params.require(:vote).permit(
      :user_id,
      :work_id
    )
  end



end
