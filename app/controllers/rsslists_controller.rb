class RsslistsController < ApplicationController
  # GET /rsslists
  # GET /rsslists.xml
  def index
    @rsslists = Rsslist.all
    @prefs=pref.symbolize_keys[:pref]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rsslists }
    end
  end

  # GET /rsslists/1
  # GET /rsslists/1.xml
  def show
    @rsslist = Rsslist.find(params[:id])
    @prefs=pref.symbolize_keys[:pref]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rsslist }
    end
  end

  # GET /rsslists/new
  # GET /rsslists/new.xml
  def new
    @rsslist = Rsslist.new
    @prefs=pref.symbolize_keys[:pref]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rsslist }
    end
  end

  # GET /rsslists/1/edit
  def edit
    @rsslist = Rsslist.find(params[:id])
    @prefs=pref.symbolize_keys[:pref]
  end

  # POST /rsslists
  # POST /rsslists.xml
  def create
    @rsslist = Rsslist.new(params[:rsslist])
    @prefs=pref.symbolize_keys[:pref]
    respond_to do |format|
      if @rsslist.save
        flash[:notice] = 'Rsslist was successfully created.'
        format.html { redirect_to(@rsslist) }
        format.xml  { render :xml => @rsslist, :status => :created, :location => @rsslist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rsslist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rsslists/1
  # PUT /rsslists/1.xml
  def update
    @rsslist = Rsslist.find(params[:id])
    @prefs=pref.symbolize_keys[:pref]
    respond_to do |format|
      if @rsslist.update_attributes(params[:rsslist])
        flash[:notice] = 'Rsslist was successfully updated.'
        format.html { redirect_to(@rsslist) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rsslist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rsslists/1
  # DELETE /rsslists/1.xml
  def destroy
    @rsslist = Rsslist.find(params[:id])
    @rsslist.destroy
    @prefs=pref.symbolize_keys[:pref]
    respond_to do |format|
      format.html { redirect_to(rsslists_url) }
      format.xml  { head :ok }
    end
  end
end
