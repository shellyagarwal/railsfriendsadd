class FriendshipsController < ApplicationController
	def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    # flash[:notice] = "Added friend!"
    # redirect_to root_url
    # redirect_to action: 'show', controller: "welcome", status: :added_friend
  else
    flash[:error] = "Unable to add friend!"
  end
    redirect_to root_path
end

def destroy
  @friendship = current_user.friendships.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed friendship!"
  redirect_to root_path
end
end
