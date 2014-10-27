class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.references :user, index: true
      t.string :nonce
      t.datetime :expires_at

      t.timestamps
    end
  end
end
