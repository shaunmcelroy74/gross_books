class CreatePublishers < ActiveRecord::Migration[8.0]
  def change
    create_table :publishers do |t|
      t.string :publisher_name
      t.string :publisher_revenue

      t.timestamps
    end
  end
end
