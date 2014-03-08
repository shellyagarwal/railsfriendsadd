class WelcomeController < ApplicationController
 before_filter :authenticate_user!
 def index
  @notcurrent=User.where.not(:id => current_user.id)
  @users=User.all
  @friendships1=current_user.friendships.map {|a| a.friend_id}
end
def show
 @user=current_user
 @circles=Circle.where(:user_id => current_user.id)
end
def new
  @user=User.new
  @circle=Circle.new
end
def create_circle
  @circle = current_user.circles.new(circle_params)
  if @circle.save
    flash[:error] = "Created Circle!"
    redirect_to root_path

  else
    flash[:error] = "Unable to add friend!"
    redirect_to root_path
  end
end
def add_to_circle
 @circles=Circle.where(:user_id => current_user.id)
 @friendships1=current_user.friendships.map {|a| a.friend_id}
 @a=Friendship.where(:user_id => current_user.id, :friend_id=>params[:friend_id]).first
 @cir=Circle.where(:user_id=>current_user.id,:circle_name => params[:name]).first
 @cir.update_attribute(:friendship_id, @a.id)
 redirect_to root_path
end


def circle_params
  params.require(:circle).permit(:user_id,:circle_name)
end

end