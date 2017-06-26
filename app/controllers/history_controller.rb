class HistoryController < ApplicationController
  layout "person"

  def index
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


  end
end