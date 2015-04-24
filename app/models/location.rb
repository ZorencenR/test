class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def get_barrio(latitude, longitude)
    unless self.barrio.present?
      barrio = if latitude.present? and longitude.present?
                  Geocoder.search("#{latitude},#{longitude}").first.data["address_components"][2]["long_name"]
                else
                  "VERIFICAR DIRECCIÓN"
                end
       save_barrio(barrio)
    end
  end

  def save_barrio(barrio)
    self.update_attributes!(barrio: barrio)
  end
end
