module PelotonAPI
  module Records
    class Workout < PelotonObject
      fields :id, :start_time, :status, :end_time, :metrics_type, :total_work
      field :ride, Ride
    end
  end
end
