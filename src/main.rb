#===============================================================================
# Much of the platform specific code should be called before Swing is touched.
# The useScreenMenuBar is an example of this.
require 'rbconfig'
require 'java'

#===============================================================================
# Platform specific operations, feel free to remove or override any of these
# that don't work for your platform/application

case Config::CONFIG["host_os"]
when /darwin/i # OSX specific code
  java.lang.System.set_property("apple.laf.useScreenMenuBar", "true")
when /^win/i # Windows specific code
when /linux/i # Linux specific code
end

# End of platform specific code
#===============================================================================


$LOAD_PATH.unshift File.dirname(__FILE__)
Dir.glob(File.expand_path(File.dirname(__FILE__) + "/**")).each do |directory|
  $LOAD_PATH << directory unless directory =~ /\.\w+$/ #File.directory? is broken in current JRuby for dirs inside jars
end

require 'manifest'
Dir[File.expand_path(File.dirname(__FILE__) + "/../lib/ruby/**")].map do |dir| 
  lib = "#{dir}/lib"
  lib = dir if lib =~ /\.\w+$/   #File.directory? is broken in current JRuby for dirs inside jars
  $: << lib
  
  gem_name = File.basename(dir.gsub(/-\d+.\d+.\d+$/, ''))
  gem_path = dir + "/lib/" + gem_name + ".rb"
  begin
    require gem_path if File.exists? gem_path
  rescue
     p "could not load gem #{gem_path}"
  end
end



begin
   require 'tweet_controller'
   require 'login_controller'
   LoginController.instance.open
rescue Exception => e
  $stderr << "Error in application:\n#{e}\n#{e.message}"
  # Additional error handling goes here
  java.lang.System.exit(1)
end