class FamiliesController < ApplicationController
  layout "person"

  def index
    @cashes = Cash.where(cash_sort: 2).joins(:users).distinct
  end

  def edit
    if user_signed_in? and current_user.has_role? :teacher
      @filterrific = initialize_filterrific(
          User.with_role(:user).order(:last_name),
          params[:filterrific]
      ) or return

      if params[:id] == 'new'
        @cash = Cash.where(cash_sort: 2).where.not(id: User.joins(:cashes).select('cashes.id')).first
        if @cash.blank?
          @cash = Cash.create!(cash_sort_id: 2, cash_count: 0)
        else
          @cash.update(cash_count: 0)
        end
      else
        @cash = Cash.find(params[:id])
      end

      @users =  @cash.users.order(:last_name)

      @new_users = @filterrific.find.page(params[:page])
    else
      redirect_to new_user_session_path
    end
  end



  def destroy
    if user_signed_in? and current_user.has_role? :teacher
      cash = Cash.find(params[:id])
      cash.users.delete_all
      cash.destroy
      redirect_to  families_path
    else
      redirect_to new_user_session_path
    end
  end
end