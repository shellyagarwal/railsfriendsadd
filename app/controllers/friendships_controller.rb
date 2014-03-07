class FriendshipsController < ApplicationController
	def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id],:status=>0)

  if @friendship.save
    
     redirect_to action: 'show', controller: "welcome"
  else
    flash[:error] = "Unable to add friend!"
    redirect_to root_path
  end
end
def add_friend
  @friendship = Friendship.where(:user_id=>params[:id],:friend_id=>current_user.id).first
  @friendship.update_attribute(:status ,1)

    flash[:notice] = "Accepted friend!"
    redirect_to root_path


end
def reject_friend
  @friendship = Friendship.where(:user_id=>params[:id],:friend_id=>current_user.id).first
  
    flash[:notice] = "Rejected friend!"
  @friendship.destroy
    redirect_to root_path  
end

def block_friend

  @friendship = Friendship.where(:user_id=>params[:id],:friend_id=>current_user.id).first
    @friendship.update_attribute(:status ,2)
    flash[:notice] = "Blocked friend!"
  redirect_to root_path
end
def destroy
  @friendship = Friendship.find(params[:id])
   @friendship.destroy
  redirect_to root_path
end


end
