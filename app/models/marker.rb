class Marker < ActiveRecord::Base

  # Finds all markers witin the given bounds
  def self.find_all_within_bounds(top, bottom, left, right)
    markersTop = Marker.where("lat < (?)", top)
    markersBottom = Marker.where("lat > (?)", bottom)
    markersLeft = Marker.where("lng < ?", left)
    markersRight = Marker.where("lng > ?", right)
    markers = markersBottom & markersTop & markersLeft & markersRight
    return markers
  end
end
