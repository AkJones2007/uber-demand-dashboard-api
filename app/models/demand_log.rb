class DemandLog < ActiveRecord::Base
  belongs_to :area

  def self.last_twenty_four
    logs = DemandLog.where( created_at: 24.hours.ago..Time.now )
  end

end
