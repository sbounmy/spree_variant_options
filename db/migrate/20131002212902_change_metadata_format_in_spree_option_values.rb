class ChangeMetadataFormatInSpreeOptionValues < ActiveRecord::Migration
  def change
    change_column  :spree_option_values, :metadata, :text
  end
end
