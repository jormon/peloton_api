module PelotonAPI
  module Records
    class Ride < PelotonObject
      fields :id, :duration, :original_air_time, :title, :scheduled_start_time
    end
  end
end
