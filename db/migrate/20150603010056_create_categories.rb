class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :descricao
      t.boolean :ativo

      t.timestamps
    end
  end
end
