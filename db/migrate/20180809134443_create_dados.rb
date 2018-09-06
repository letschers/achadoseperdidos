class CreateDados < ActiveRecord::Migration[5.2]
  def change
    create_table :dados do |t|
      t.string :titulo, null: false
      t.string :foto, null: false
      t.text :descricao, null: false
      t.string :recompensa, null: false
      t.string :tipo, null: false
      t.date :dataocorrido, null: false 
      t.string :pessoa, null: false
      t.boolean :status, default: true, null: false

      t.timestamps
    end
  end
end
