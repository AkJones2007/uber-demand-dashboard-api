class DemandLog < ActiveRecord::Base
  belongs_to :area

  # Daily
  def self.last_twenty_four
    logs = DemandLog.where( created_at: 24.hours.ago..Time.now )
    logs.collect do |log|
      time = log.created_at.strftime("%H:%M %p")
      surge = log.surge_multiplier.round(1).to_f
      { time: time, surge: surge }
    end
  end

  def self.daily_avg
    hour = "EXTRACT (HOUR from created_at)"
    minute = "EXTRACT (MINUTE from created_at)"
    logs = DemandLog.group(hour).order(hour).group(minute).order(minute).average(:surge_multiplier)
    serialized_logs = []

    logs.each_pair do |time_array, surge_multiplier|
      h = time_array[0].to_i
      m = time_array[1].to_i
      time = Time.parse("#{h}:#{m}").strftime("%I:%M %p")
      surge = surge_multiplier.round(1).to_f
      serialized_logs.push ({ time: time, surge: surge })
    end

    serialized_logs
  end

  def self.avg_by_weekday(weekday_id)
    weekdays = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    weekday = "EXTRACT (DOW from created_at) = #{weekday_id}"
    hour = "EXTRACT (HOUR from created_at)"
    minute = "EXTRACT (MINUTE from created_at)"
    logs = DemandLog.where(weekday).group(hour).order(hour).group(minute).order(minute).average(:surge_multiplier)
    serialized_logs = []

    logs.each_pair do |time_array, surge_multiplier|
      wday = weekdays[weekday_id]
      h = time_array[0].to_i
      m = time_array[1].to_i
      time = Time.parse("#{h}:#{m}").strftime("%I:%M %p")
      surge = surge_multiplier.round(1).to_f
      serialized_logs.push({ dow: wday, time: time, surge: surge })
    end

    serialized_logs
  end

  # Weekly
  def self.last_week
    weekdays = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    weekday = "EXTRACT (DOW from created_at)"
    hour = "EXTRACT (HOUR from created_at)"
    logs = DemandLog.where(created_at: DateTime.now.last_week.beginning_of_week..DateTime.now.last_week.end_of_week).group(weekday).order(weekday).group(hour).order(hour).average(:surge_multiplier)
    serialized_logs = []

    logs.each_pair do |date, surge_multiplier|
      dow = weekdays[date[0].to_i]
      hour = date[1].to_i
      time = Time.parse("#{hour}:00").strftime("%I:%M %p")
      surge = surge_multiplier.round(1).to_f
      serialized_logs.push({ dow: dow, time: time, surge: surge })
    end

    serialized_logs
  end

end
