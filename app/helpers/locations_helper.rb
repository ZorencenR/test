module LocationsHelper

  def get_barrios(location)
    if location.barrio.present?
      location.barrio
    else
      location.get_barrio(location.latitude, location.longitude)
    end
  end

end
