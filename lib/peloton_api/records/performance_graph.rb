module PelotonAPI
  module Records
    class PerformanceGraph < PelotonObject
      field :summaries, :average_summaries, :duration, :metrics
    end
  end
end
