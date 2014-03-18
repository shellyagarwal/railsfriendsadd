class WelcomeController < ApplicationController
 before_filter :authenticate_user!
 def index
  @notcurrent=User.where.not(:id => current_user.id)
  @users=User.all
  @friendships1=current_user.friendships.map {|a| a.friend_id}
  @user=current_user
  @circles=Circle.where(:user_id => current_user)
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
  @circle = Circle.new(circle_params)
  if @circle.save
    flash[:error] = "Created Circle!"
    redirect_to root_path

  else
    flash[:error] = "Unable to add friend!"
    redirect_to root_path
  end
end

def delete_circle
  @cir=Circle.find(params[:id])
    @cir.destroy
    redirect_to root_path
  end

def add_to_circle
 @user = User.find(params[:friend_id])
@circles = Circle.find(params[:circle_id])
@circles.users << @user
 if @circles.save
    flash[:error] = "Added to Circle!"
    redirect_to root_path

  else
    flash[:error] = "Unable to add friend!"
    redirect_to root_path
  end
end

def delete_from_circle
  @user=User.find(params[:friend_id])
  @circles = Circle.find(params[:id])
  @circles.users.delete(@user)
  redirect_to root_path
end
def circle_params
  params.require(:circle).permit(:user_id,:circle_name)
end
def circle_friend
  @cirfrens=Circle.where(:id => params[:id],:circle_name =>params[:name])
  @d=User.where(:id=>current_user.id)
end
end