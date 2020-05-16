module PelotonAPI
  module Records
    class Workout
      fields :id, :start_time, :status
      field :ride, Ride
    end
  end
end
