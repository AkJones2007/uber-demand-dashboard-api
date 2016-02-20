class AddRefsToDemandLogs < ActiveRecord::Migration
  def change
    add_reference :demand_logs, :area, index: true, foreign_key: true
  end
end
