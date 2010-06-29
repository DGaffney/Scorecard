class ResourcesController < ApplicationController
  layout "main"

  def create
    @resource = Resource.new(params[:resource])
    respond_to do |format|
      if @resource.save
        flash[:notice] = 'Resource was successfully created.'
        format.html { redirect_to :controller => 'researchers', :action => 'edit', :id => @resource.researcher_id}
        format.xml  { render :xml => @resource, :status => :created, :location => @resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @resource = Resource.find(params[:id])
    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        flash[:notice] = 'Resource was successfully updated.'
        format.html { redirect_to :controller => 'researchers', :action => 'edit', :id => @resource.researcher_id}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    respond_to do |format|
      format.xml  { head :ok }
      format.js do
        render :update do |page|
          page.visual_effect :Fade, "resource_#{@resource.id}", :duration => 0.4
        end
      end
    end
  end
end
