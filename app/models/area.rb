class Area < ActiveRecord::Base
  belongs_to :market
  has_many :demand_logs
end
