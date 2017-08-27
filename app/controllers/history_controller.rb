class HistoryController < ApplicationController
  layout "person"

  def index
    if user_signed_in?
      @user = current_user
      @history = @user.active_tables.where(active: false)

      @filterrific = initialize_filterrific(
          @history,
          params[:filterrific],
          :select_options => {
              with_training_name: @history.pluck(:training_name).uniq
          }
      ) or return
      @history  = @filterrific.find.page(params[:page])
    else
      redirect_to new_user_session_path
    end
  end
end