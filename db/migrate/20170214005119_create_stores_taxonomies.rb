class CreateStoresTaxonomies < ActiveRecord::Migration[5.0]
  def self.up
    create_table :stores_taxonomies, :id => false do |t|
      t.integer :store_id
      t.integer :taxonomies_id
    end
  end

  def self.down
    drop_table :stores_taxonomies
  end
end

