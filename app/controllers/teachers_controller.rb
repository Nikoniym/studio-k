class TeachersController < ApplicationController
  layout "person"
  def index
    if user_signed_in?
      @user = current_user
      if @user.has_role? :user
        redirect_to user_root_path
      end
      if @user.has_role? :admin
        @time_table = ActiveTable.order(:date,:time_start).where('date >= ?', Date.today)
      else
        @time_table = ActiveTable.order(:date,:time_start).where(' date >= ? and teacher_id = ?', Date.today.monday, @user.id)
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    if user_signed_in?
      @filterrific = initialize_filterrific(
          User.with_role(:user).order(:last_name),
          params[:filterrific]
      ) or return

      @current_user = current_user
      if (@current_user.has_role? :user if @current_user.present?) && current_admin_user.blank?
        redirect_to user_root_path
      end

      @table = ActiveTable.find(params[:id])
      @user =  @table.users.order(:last_name)

      # id = @user.pluck(:id)
      # @new_users = User.with_role(:user).order(:last_name)
      @new_users = @filterrific.find.page(params[:page])

      @subscriptions = Subscription.where(user: @user, paid: false)
    else
      redirect_to new_user_session_path
    end
  end

  def add_no_registration

    @table = ActiveTable.find(params[:id])
    @table.no_registration += 1
    @table.place_current -= 1
    if @table.save
      @answer = true
    end
  end

  def remove_no_registration
    @table = ActiveTable.find(params[:id])
    if @table.no_registration > 0
      @table.no_registration -= 1
      @table.place_current += 1
      if @table.save
        @answer = true
      end
    end
  end

  def paid
   user = current_user
   @subscription = Subscription.find(params[:id])
   @subscription.update(paid: true, date_paid: Time.now, teacher_id: user.id, teacher_name: "#{user.last_name} #{user.first_name}")
  end

  def delete_paid
    @subscription = Subscription.find(params[:id])
    @subscription.update(paid: false, date_paid: nil, teacher_id: nil, teacher_name: nil)
  end

  def destroy_lesson
    @current_user = current_user
    @table = ActiveTable.find(params[:id])
    @table.update(active: false)
    redirect_to edit_teacher_path(@table)
  end

  def active_lesson
    @current_user = current_user
    @table = ActiveTable.find(params[:id])
    @table.update(active: true)
    redirect_to edit_teacher_path(@table)
  end

end