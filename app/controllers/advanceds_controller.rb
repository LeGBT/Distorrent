class AdvancedsController < ApplicationController

  def save
    tpref=pref.symbolize_keys
    tpref[:pref]["cmd"]=params["cmd"]["f"]
    if params["logs"]
      tpref[:pref]["logs"]=1
    else
      tpref[:pref]["logs"]=nil
    end
    File.open( "#{Rails.root}/config/prefs.yml", 'w' ) do |out|
        YAML.dump(tpref, out)
    end
    @prefs=tpref[:pref]
    render 'index'
  end

  def index
    @prefs=pref.symbolize_keys[:pref]
    render 'index'
  end

end
