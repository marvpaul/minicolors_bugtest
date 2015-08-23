class AddAktiviertToEinText < ActiveRecord::Migration
  def change
    add_column :ein_texts, :aktiviert, :boolean
  end
end
