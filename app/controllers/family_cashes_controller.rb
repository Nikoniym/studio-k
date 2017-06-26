class FamilyCashesController < ApplicationController
  def add_user
    @cash = Cash.find(params[:family_id])
    @user = User.find(params[:id])

    if @cash.users.where(id: @user).empty?
      @user.cashes << @cash
      @answer = true
    end
  end

  def remove_user
    @cash = Cash.find(params[:family_id])
    @user = User.find(params[:id])
    if @cash.users.where(id: @user).present?
      @cash.users.delete(@user)
      @answer = true
    end
  end
end