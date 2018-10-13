class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def edit
    @work = Work.find_by(id: params[:id])
  end

  def new
    @work = Work.new
  end

  def destroy
    work = Work.find_by(id: params[:id])
    work.destroy
    redirect_to root_path
  end

  def create
    title_already_taken = Work.find_by(title: params[:title])
    if title_already_taken
      flash[:error]= "A Problem Occured: work with this title already exists"
    else
      filtered_params = work_params()
      @work = Work.new(filtered_params)
      save_success = @work.save
      if save_success
        redirect_to works_path
      else
        flash.now[:error] =  "Invalid work entry"
        render :new, status: :bad_request
      end
    end
  end

    def show
      work_id = params[:id]
      @work = Work.find_by(id: work_id)
      if @work.nil?
        head :not_found
      end
    end

    def update
      @work = Work.find(params[:id])
      @work.update(work_params)
      redirect_to works_path
    end

    # def upvote
    #   @user = User.find_by(id: session[:user_id])
    #
    #   if @user
    #     @user.votes.each do |vote|
    #       if vote.work_id == @work.id
    #         flash[:error]="This user already voted on this work"
    #       else
    #         new_vote = Vote.new
    #         new_vote.work_id = @work.id
    #         new_vote.user_id = @user.id
    #         new_vote.save
    #         @user.votes << new_vote
    #       end
    #     end
    #   else
    #     flash[:error] = "You are not logged in"
    #     redirect_to sessions_path
    #
    #   end
    # end


    private

    def work_params
      return params.require(:work).permit(
        :title,
        :category,
        :publication_year,
        :description,
        :creator
      )
    end
  end
