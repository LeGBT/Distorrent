class AdvancedsController < ApplicationController
  
  def save
   # Prefs_mod[:pref]["cmd"] = 'salope !'
   File.open( "#{RAILS_ROOT}/config/prefs.yml", 'w' ) do |out|
          out.write(["pref"][key.to_sym])
   end
    render 'index'
  end

  def index
    raw_config = File.open("#{RAILS_ROOT}/config/prefs.yml")
    config = YAML.load(raw_config).symbolize_keys
    @prefs=config[:pref]
    render 'index'
  end

end
