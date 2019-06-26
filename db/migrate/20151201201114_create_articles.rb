class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content

    end

  Article.create(:title =>  "Tori", :content => "My special article is about nothing." )
  Article.create(:title =>  "Victor", :content => "In Black Shirt" )
  Article.create(:title =>  "Vika", :content => "My russian name" )
  Article.create(:title =>  "Victoria", :content => "Full names.." )

  end

end
