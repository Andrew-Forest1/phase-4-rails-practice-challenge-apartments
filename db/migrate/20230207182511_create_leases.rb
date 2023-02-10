class CreateLeases < ActiveRecord::Migration[6.1]
  def change
    create_table :leases do |t|
      t.integer :rent
      t.references :apartment, null: false, foreign_key: {on_delete: :cascade}
      t.references :tenant, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
