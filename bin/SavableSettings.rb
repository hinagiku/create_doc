
class SavableSettings 
 
  include GladeGUI
 
  attr_accessor :filename, :title, :smalltitle, :foot, :height, :width

  def initialize()
    defaults()
  end

  # defaults are set on new and loaded objects.  You can add to this list
  # and it will not cause errors.  New variables will be added
  # and loaded objects will function flawlessly.  When you load a yaml
  # file using VR::load_yaml, it will look for a method named "defaults"
  # and execute it, so use the name "defaults, and it will automatically run.

  def defaults()
    @height ||= 200
    @width ||= 350
    @filename ||= "文件名"
    @title ||= "文章标题"
    @smalltitle ||= "文章小标题"
    @foot ||= "页脚"
  end  

  def buttonSave__clicked(*a)
    get_glade_variables
    VR::save_yaml(self) 
    @builder[:window1].destroy
  end


end

