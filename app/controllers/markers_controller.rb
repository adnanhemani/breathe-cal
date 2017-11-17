class MarkersController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Create a new marker
  def create
    # If the user has been assigned to a user object
    if session[:user_id] != nil
      marker = Marker.create!(marker_params.merge(:user_id => session[:user_id]))
      render :json => marker
    # If the user has not been assigned to a user object
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
  
  private 
  
  def marker_params
    params.require(:marker).permit(:lat, :lng, :cat, :dog, :mold, :bees, :perfume, :oak, :peanut, :gluten, :dust, :smoke, :title)
  end
  
  def bound_params
    params.require(:bounds).permit(:uplat,:downlat,:rightlong,:leftlong)
  end
end
