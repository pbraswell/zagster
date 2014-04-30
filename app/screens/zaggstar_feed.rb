class ZaggstarFeed < PM::TableScreen
  title "Zaggstar Feed"

  searchable placeholder: "Find a Zaggle"
  refreshable callback: :on_refresh,
              pull_message: "Pull to refresh",
              refreshing: "Refreshing Feed...",
              updated_format: "Last updated at %s",
              updated_time_format: "%l:%M %p"


  def on_load
    set_nav_bar_button :left, title: "Help", action: :open_help_screen
  end

  def will_appear
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }
  end

  def open_help_screen
    open_modal HelpScreen.new(nav_bar: true)
  end

  def open_zaggle
    open ZaggleScreen.new(nav_bar: true)
  end

  def table_data
    [
      {
        cells: (0..50).map do |zaggle|
          {
            title: "Zaggle #{zaggle}",
            subtitle: "Zaggle content",
            action: :open_zaggle,
            arguments: {zaggle_id: zaggle}
          }
        end
      }
    ]
  end

  def on_refresh
    end_refreshing
  end

end
