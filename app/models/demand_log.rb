class DemandLog < ActiveRecord::Base
  belongs_to :area

  def self.last_twenty_four
    logs = DemandLog.where( created_at: 24.hours.ago..Time.now )

    logs.each do |log|
      time = log.created_at.strftime("%H:%M %p")
      surge = log.surge_multiplier.round(1).to_f
      { time: time, surge: surge }
    end
  end

end
