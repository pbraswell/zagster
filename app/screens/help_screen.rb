class HelpScreen < PM::WebScreen
  title "Help"

  def on_load
    set_nav_bar_button :right, title: "Done", action: :close_help_screen
  end

  def close_help_screen
    close
  end

  def content
    NSURL.URLWithString('http://motioninmotion.tv/about')
  end

  def load_failed
    UIAlert.alloc.initWithTitle('Failed to load',
      message: 'The help content failed to load, sorry man!',
      delegate: nil,
      cancelButtonTitle: 'Ok',
      otherButtontitles: nil
      ).show
  end

end
