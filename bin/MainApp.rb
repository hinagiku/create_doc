
class MainApp #(change name)
 
  include GladeGUI
  
  # make $ENV global object available everywhere
  def before_show()
    $ENV = VR::load_yaml(SavableSettings, "settings.yaml")
    @builder[:window1].resize $ENV.width, $ENV.height
    refresh()
  end  

  def refresh()
    @builder[:filename].text = $ENV.filename
    @builder[:title].text = $ENV.title
    @builder[:smalltitle].text = $ENV.smalltitle
    @builder[:foot].text = $ENV.foot
  end  

  def buttonEdit__clicked(*a)
    $ENV.show_glade(self)
    refresh()
  end

  # delete_event signal occurs before the window actually closes
  # It gives us time to save the height and width of the widow before 
  #closing it.  Returns: true = don't close window, false = close window.
  def window1__delete_event(*)
    $ENV.width, $ENV.height = @builder[:window1].size()
    VR::save_yaml($ENV)
    return false #ok to close
  end

  def buttonCancel__clicked(*a)
    window1__delete_event
    @builder[:window1].destroy
  end

  def CreateDocButton__clicked(*a)
    $ENV = VR::load_yaml(SavableSettings, "settings.yaml")

    Caracal::Document.save $ENV.filename+'.docx' do |docx|
    # page 1
    docx.p $ENV.title, color: 'FF0000', size: 56, bold: true, align: :center
    docx.p $ENV.smalltitle, size: 30, align: :center
    docx.hr
    docx.p $ENV.filename, align: :center
    docx.p $ENV.foot
    end
  end

end

