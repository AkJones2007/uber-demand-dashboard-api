class AddRefsToAreas < ActiveRecord::Migration
  def change
    add_reference :areas, :market, index: true, foreign_key: true
  end
end
