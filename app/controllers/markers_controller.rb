class MarkersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Create a new marker
  def create
    if current_user
      marker = Marker.create!(marker_params.merge(:user_id => session[:user_id]))
      render :json => marker
    elsif guest_user
      marker = Marker.create!(marker_params.merge(:user_id => session[:guest_user_id]))
      render :json => marker
    # If no user profile exists
    else
      render :nothing => true
    end
  end
  
  # Show all markers inside the bounds of the map
  def show
    up = bound_params[:uplat]
    down = bound_params[:downlat]
    left = bound_params[:leftlong]
    right = bound_params[:rightlong]
    markers = Marker.find_all_within_bounds(up,down,left,right)
    render :json => markers
  end
  
  # Remove a marker
  def destroy
    
  end
  
  private 
  
  def marker_params
    params.require(:marker).permit(:cat, :dog, :mold, :bees, :perfume, :oak, :peanut, :gluten, :dust, :smoke, :title, :user_id)
  end
  
  def bound_params
    params.require(:bounds).permit(:uplat, :downlat, :rightlong, :leftlong)
  end
end
