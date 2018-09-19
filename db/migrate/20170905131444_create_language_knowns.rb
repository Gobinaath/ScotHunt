class CreateLanguageKnowns < ActiveRecord::Migration[5.1]
  def change
    create_table :language_knowns do |t|
      t.string :english
      t.string :spanish
      t.string :scotish

      t.timestamps
    end
  end
end
