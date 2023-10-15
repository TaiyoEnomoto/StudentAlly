class PlaysController < ApplicationController
	def create
    play = current_user.plays.create(post_id: params[:post_id]) #user_idとpost_idの二つを代入
    redirect_back(fallback_location: root_path)
  end

  def destroy
    play = Play.find_by(post_id: params[:post_id], user_id: current_user.id)
    play.destroy
    redirect_back(fallback_location: root_path)
  end
end
