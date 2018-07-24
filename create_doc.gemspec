Gem::Specification.new do |s|
  s.name = "create_doc"  # i.e. visualruby.  This name will show up in the gem list.
  s.version = "0.0.2"  # i.e. (major,non-backwards compatable).(backwards compatable).(bugfix)
  s.add_dependency "visualruby", ">= 3.0.18"
  s.add_dependency "require_all", ">= 1.2.0"
  s.has_rdoc = false
  s.authors = ["Chen Liang"] 
  s.email = "holdstock@yeah.net" # optional
  s.summary = "create docx file." # optional
  s.homepage = "http://www.yoursite.org/"  # optional
  s.description = "just a toy,use VisualRuby and caracal to create docx file." # optional
  s.executables = ['create_doc']  # i.e. 'vr' (optional, blank if library project)
  s.default_executable = 'create_doc'  # i.e. 'vr' (optional, blank if library project)
  s.bindir = ['.']    # optional, default = bin
  s.require_paths = ['lib']  # optional, default = lib 
  s.files = Dir.glob(File.join("**", "*.{rb,glade}"))
  s.rubyforge_project = "nowarning" # supress warning message 
end
