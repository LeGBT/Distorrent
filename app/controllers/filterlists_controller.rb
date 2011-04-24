class FilterlistsController < ApplicationController

	def index
		@filterlists = Filterlist.all
		@prefs=pref.symbolize_keys[:pref]
		render :index
	end

	def show
		@filterlist = Filterlist.find(params[:id])
		@prefs=pref.symbolize_keys[:pref]
		render :show
	end

	def new
		@filterlist = Filterlist.new
		@prefs=pref.symbolize_keys[:pref]
	end

	def edit
		@filterlist = Filterlist.find(params[:id])
		@prefs=pref.symbolize_keys[:pref]
		render :edit
	end

	def create
		@filterlist = Filterlist.new(params[:filterlist])
		@prefs=pref.symbolize_keys[:pref]
		if @filterlist.save
			flash[:notice] = 'Filterlist was successfully created.'
			redirect_to(@filterlist)
		else
			render :new
		end
	end

	def update
		@filterlist = Filterlist.find(params[:id])
		@prefs=pref.symbolize_keys[:pref]
		if @filterlist.update_attributes(params[:filterlist])
			flash[:notice] = 'Filterlist was successfully updated.'
			redirect_to(@filterlist)
		else
			#render "edit" 
			render :edit
		end
	end


	def inc
		@filterlist = Filterlist.find(params[:id])
		@filterlist.update_attributes(:ep => @filterlist.ep+1)
		@filterlists = Filterlist.all
		@prefs=pref.symbolize_keys[:pref]
		render "index"
	end

	def dec
		@filterlist = Filterlist.find(params[:id])
		@filterlist.update_attributes(:ep => @filterlist.ep-1)
		@filterlists = Filterlist.all
		@prefs=pref.symbolize_keys[:pref]
		render "index"
	end


	def destroy
		@filterlist = Filterlist.find(params[:id])
		@filterlist.destroy
		@prefs=pref.symbolize_keys[:pref]
		flash[:notice] = 'Filter deleted.'
		redirect_to(@filterlist)
	end
end
