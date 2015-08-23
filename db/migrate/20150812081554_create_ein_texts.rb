class CreateEinTexts < ActiveRecord::Migration
  def change
    create_table :ein_texts do |t|
      t.string :text
      t.string :farbe

      t.timestamps
    end
  end
end
