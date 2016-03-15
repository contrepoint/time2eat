class CreateMailingLists < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
    	t.string :email, null: false
      t.timestamps null: false
    end
  end
end
