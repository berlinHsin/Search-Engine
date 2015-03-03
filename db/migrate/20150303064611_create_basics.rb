class CreateBasics < ActiveRecord::Migration
  def change
    create_table :basics do |t|

      t.timestamps null: false
    end
  end
end
