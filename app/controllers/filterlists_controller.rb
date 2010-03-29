class FilterlistsController < ApplicationController
  # GET /filterlists
  # GET /filterlists.xml
  def index
    @filterlists = Filterlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @filterlists }
    end
  end

  # GET /filterlists/1
  # GET /filterlists/1.xml
  def show
    @filterlist = Filterlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @filterlist }
    end
  end

  # GET /filterlists/new
  # GET /filterlists/new.xml
  def new
    @filterlist = Filterlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @filterlist }
    end
  end

  # GET /filterlists/1/edit
  def edit
    @filterlist = Filterlist.find(params[:id])
  end

  # POST /filterlists
  # POST /filterlists.xml
  def create
    @filterlist = Filterlist.new(params[:filterlist])

    respond_to do |format|
      if @filterlist.save
        flash[:notice] = 'Filterlist was successfully created.'
        format.html { redirect_to(@filterlist) }
        format.xml  { render :xml => @filterlist, :status => :created, :location => @filterlist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @filterlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /filterlists/1
  # PUT /filterlists/1.xml
  def update
    @filterlist = Filterlist.find(params[:id])

    respond_to do |format|
      if @filterlist.update_attributes(params[:filterlist])
        flash[:notice] = 'Filterlist was successfully updated.'
        format.html { redirect_to(@filterlist) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @filterlist.errors, :status => :unprocessable_entity }
      end
    end
  end
   
  
  def inc
    @filterlist = Filterlist.find(params[:id])
       @filterlist.update_attributes(:ep => @filterlist.ep+1)
       render "inc"
  end
  
  def dec
    @filterlist = Filterlist.find(params[:id])
       @filterlist.update_attributes(:ep => @filterlist.ep-1)
       render "inc"
  end
   

  # DELETE /filterlists/1
  # DELETE /filterlists/1.xml
  def destroy
    @filterlist = Filterlist.find(params[:id])
    @filterlist.destroy

    respond_to do |format|
      format.html { redirect_to(filterlists_url) }
      format.xml  { head :ok }
    end
  end
end
