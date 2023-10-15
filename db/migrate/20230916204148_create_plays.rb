class CreatePlays < ActiveRecord::Migration[6.1]
  def change
    create_table :plays do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
