class RunnersController < ApplicationController
    before_action :authenticate_admin!, only: [:edit, :update, :destroy, :admin_page]
  
    def index
      @runners = Runner.includes(:team).all
    end
  
    def edit
      @runner = Runner.find(params[:id])
    end
  
    def update
      @runner = Runner.find(params[:id])
      if @runner.update(runner_params)
        redirect_to runners_path, notice: 'Runner updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @runner = Runner.find(params[:id])
      @runner.destroy
      redirect_to runners_path, notice: 'Runner deleted successfully.'
    end
  
    def admin_page
      @runners = Runner.all
    end
  
    private
  
    def runner_params
      params.require(:runner).permit(:name, :email, :age, :team_id)
    end
  
    def authenticate_admin!
      # logic for admin users here
      unless current_user&.admin?
        redirect_to root_path, alert: 'You are not authorized to perform this action.'
      end
    end
  end
  