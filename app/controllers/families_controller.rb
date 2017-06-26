class FamiliesController < ApplicationController
  layout "person"

  def index
    @cashes = Cash.where(cash_sort: 2).joins(:users).distinct
  end

  def edit
    @filterrific = initialize_filterrific(
        User.with_role(:user).order(:last_name),
        params[:filterrific]
    ) or return


    user = current_user
    if user.has_role? :user
      redirect_to user_root_path
    end

    if params[:id] == 'new'
      @cash = Cash.where(cash_sort: 2).where.not(id: User.joins(:cashes).select('cashes.id')).first
      if @cash.blank?
        @cash = Cash.create!(cash_sort_id: 2, cash_count: 0)
      end
    else
      @cash = Cash.find(params[:id])
    end

    @users =  @cash.users.order(:last_name)

    # id = @user.pluck(:id)
    # @new_users = User.with_role(:user).order(:last_name)
    @new_users = @filterrific.find.page(params[:page])
  end

  def new
    @cash = Cash.where(cash_sort: 2).where.not(id: User.joins(:cashes).select('cashes.id'))
    if @cash.blank?
      @cash = Cash.create!(cash_sort_id: 2, cash_count: 0)
    end

  end

  def destroy
    cash = Cash.find(params[:id])
    cash.users.delete_all
    cash.destroy
    redirect_to  families_path
  end
end