class WelcomeController < ApplicationController
  	before_filter :authenticate_user!
  def index
    @notcurrent=User.where.not(:id => current_user.id)
  	@users=User.all
    @friendships1=current_user.friendships.map {|a| a.friend_id}
  end
  def show
  	@user=current_user
  end
  def new
   	@user=User.new
   end
 end