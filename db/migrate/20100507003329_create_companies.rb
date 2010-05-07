class CreateCompanies < ActiveRecord::Migration

  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at
      t.text :page_text
      t.string :weblink
      t.integer :position

      t.timestamps
    end

    add_index :companies, :id

    User.find(:all).each do |user|
      user.plugins.create(:title => "Companies", :position => (user.plugins.maximum(:position) || -1) +1)
    end

    page = Page.create(
      :title => "Companies",
      :link_url => "/companies",
      :deletable => false,
      :position => ((Page.maximum(:position, :conditions => "parent_id IS NULL") || -1)+1),
      :menu_match => "^/companies(\/|\/.+?|)$"
    )
    RefinerySetting.find_or_set(:default_page_parts, ["Body", "Side Body"]).each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end

  def self.down
    UserPlugin.destroy_all({:title => "Companies"})

    Page.find_all_by_link_url("/companies").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/companies"})

    drop_table :companies
  end

end
