class FamilyCashesController < ApplicationController
  def add_user
    @cash = Cash.find(params[:family_id])
    @user = User.find(params[:id])

    if @cash.users.where(id: @user).empty?
      @user.cashes << @cash
      @cash.update(last_name: @cash.users.select(:last_name, :first_name).map{|c| "#{c.last_name} #{c.first_name}" }.join(', '))
      @answer = true
      flash[:message] = 'Добавлен'
    else
      @answer = false
      flash[:message] = 'Уже в списке'
    end
  end

  def remove_user
    @cash = Cash.find(params[:family_id])
    @user = User.find(params[:id])
    if @cash.users.where(id: @user).present?
      @cash.users.delete(@user)
      @cash.update(last_name: @cash.users.select(:last_name, :first_name).map{|c| "#{c.last_name} #{c.first_name}" }.join(', '))
      @user.update(cash_sort_id: 1)
      @answer = true
    end
  end
end