class AddEndDateToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :end_date, :text
  end
end
