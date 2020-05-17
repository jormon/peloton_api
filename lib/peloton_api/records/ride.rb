module PelotonAPI
  module Records
    class Ride < PelotonObject
      fields :id, :duration, :original_air_time, :title
    end
  end
end
