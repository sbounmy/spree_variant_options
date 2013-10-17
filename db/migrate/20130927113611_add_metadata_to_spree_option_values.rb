class AddMetadataToSpreeOptionValues < ActiveRecord::Migration
  def change
    add_column :spree_option_values, :metadata, :string
  end
end
