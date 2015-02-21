class Tags < ActiveRecord::Migration
  def change
	  create_table :tags do |t|
		  t.string :label
		  t.integer :parent
		  t.timestamps
	  end
  end
end
