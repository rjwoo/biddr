class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.float :bid_number

      t.timestamps null: false
    end
  end
end
