class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :shared_by

      t.timestamps
    end
  end
end
