module PelotonAPI
  module Records
    class Workout < PelotonObject
      fields :id, :start_time, :status, :end_time
      field :ride, Ride
    end
  end
end
