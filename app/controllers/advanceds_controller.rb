class AdvancedsController < ApplicationController
  
  def save
    raw_config = File.open("#{RAILS_ROOT}/config/prefs.yml")
    config = YAML.load(raw_config).symbolize_keys
    config[:pref]["cmd"]='couillon'
    File.open( "#{RAILS_ROOT}/config/prefs.yml", 'w' ) do |out|
        YAML.dump(config, out)
    end
    @prefs=config[:pref]
    render 'index'
  end

  def index
    raw_config = File.open("#{RAILS_ROOT}/config/prefs.yml")
    config = YAML.load(raw_config).symbolize_keys
    @prefs=config[:pref]
    render 'index'
  end

end
