class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  def get_barrio(latitude, longitude)
    unless self.barrio.present?
      if latitude.present? and longitude.present?
        barrio = Geocoder.search("#{latitude},#{longitude}").first.data["address_components"][2]["long_name"]
      else
        barrio = "VERIFICAR DIRECCION"
      end
       save_barrio(barrio)
    end
  end

  def save_barrio(barrio)
    self.update_attributes!(barrio: barrio)
  end
end
