class CancelAdminsController < ApplicationController
  layout "person"


  def edit
    if current_admin_user.present?
      @table = ActiveTable.find(params[:id])
      @user =  @table.users.order(:last_name)
      @subscriptions = Subscription.where(user: @user, paid: false)
    else
      redirect_to new_user_session_path
    end
  end

  def destroy_lesson
    @table = ActiveTable.find(params[:id])
    @table.update(active: false)
    if @table.users.blank?
      @table.destroy
      redirect_to admin_active_tables_path
    else
      redirect_to edit_cancel_admin_path(@table)
    end
  end

  def active_lesson
    @table = ActiveTable.find(params[:id])
    @table.update(active: true)
    redirect_to edit_cancel_admin_path(@table)
  end

end