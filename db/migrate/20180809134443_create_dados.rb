class CreateDados < ActiveRecord::Migration[5.2]
  def change
    create_table :dados do |t|
      t.string :titulo
      t.string :foto
      t.text :descricao
      t.string :recompensa
      t.string :tipo
      t.date :dataocorrido
      t.string :pessoa
      t.boolean :status

      t.timestamps
    end
  end
end
