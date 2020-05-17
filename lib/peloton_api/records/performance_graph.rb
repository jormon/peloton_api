module PelotonAPI
  module Records
    class PerformanceGraph < PelotonObject
      fields :summaries, :average_summaries, :duration, :metrics
    end
  end
end
