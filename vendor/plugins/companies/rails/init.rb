Refinery::Plugin.register do |plugin|
  plugin.title = "Companies"
  plugin.description = "Manage Companies"
  plugin.version = 1.0
  plugin.activity = {
    :class => Company,
    :url_prefix => "edit",
    :title => 'name'
  }
end
