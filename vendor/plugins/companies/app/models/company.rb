class Company < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "400x216#", :slide => "204x110#"}
  has_friendly_id :name, :use_slug => true
  acts_as_indexed :fields => [:name, :logo_file_name, :logo_content_type, :page_text, :weblink],
                  :index_file => [Rails.root.to_s, "tmp", "index"]

  validates_presence_of :name
  validates_uniqueness_of :name

end
