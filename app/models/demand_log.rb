class DemandLog < ActiveRecord::Base
  belongs_to :area

  def self.last_twenty_four
    logs = DemandLog.where( created_at: 24.hours.ago..Time.now )

    logs.collect do |log|
      time = log.created_at.strftime("%H:%M %p")
      surge = log.surge_multiplier.round(1).to_f
      { time: time, surge: surge }
    end
  end

  def self.daily_avg
    logs = DemandLog.all
    grouped_by_time = {}
    grouped_average = []

    logs.collect! do |log|
      time = log.created_at.strftime("%H:%M %p")
      surge = log.surge_multiplier.round(1).to_f
      { time: time, surge: surge }
    end

    logs.each do |log|
      time = log[:time]
      surge = log[:surge]

      unless grouped_by_time.has_key?(time)
        grouped_by_time[time] = []
      end

      grouped_by_time[time].push(surge)
    end

    grouped_by_time.each_pair do |key, value|
      sum = value.reduce(:+)
      hash = {}
      hash[:time] = key
      hash[:surge] = (sum / value.length).round(1)
      grouped_average.push(hash)
    end

    grouped_average
  end

end
