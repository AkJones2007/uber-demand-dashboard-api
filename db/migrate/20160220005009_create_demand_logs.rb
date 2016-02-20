class CreateDemandLogs < ActiveRecord::Migration
  def change
    create_table :demand_logs do |t|
      t.string :product
      t.decimal :surge_multiplier

      t.timestamps null: false
    end
  end
end
