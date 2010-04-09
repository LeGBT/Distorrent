#module Prefs_mod
  # Allows accessing config variables from harmony.yml like so:
  # Harmony[:domain] => harmonyapp.com
#  def self.[](key)
#    unless @config
#      raw_config = File.open("#{RAILS_ROOT}/config/prefs.yml")
#      @config = YAML.load(raw_config).symbolize_keys
#    end
#    @config[key]
#  end
  
#  def self.[]=(key, value)
#    @config[key.to_sym] = value
    #File.open("#{Rails.root}/config/prefs.yml", 'w' ) do |out|
    #  out.write(r[:pref][key.to_sym].to_yaml)
    #end
#    File.open( "#{RAILS_ROOT}/config/prefs.yml", 'w' ) do |out|
#        out.write(["pref"][key.to_sym])
#    end
#  end
#end