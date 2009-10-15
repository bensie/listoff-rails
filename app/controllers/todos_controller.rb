class TodosController < ApplicationController

  def index
    @todos = current_user.todos.all

    respond_to do |format|
      format.html
      format.xml  { render :xml  => @todos }
      format.json { render :json => @todos }
    end
  end

  def show
    @todo = current_user.todos.find(params[:id])
    @itme = Item.new

    respond_to do |format|
      format.html
      format.xml  { render :xml  => @todo }
      format.json { render :json => @todo }
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid todo."
    redirect_to root_url
  end

  def new
    @todo = current_user.todos.build

    respond_to do |format|
      format.html
      format.xml  { render :xml  => @todo }
      format.json { render :json => @todo }
    end
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid todo."
    redirect_to root_url
  end

  def create
    @todo = current_user.todos.build(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo }
        format.xml  { render :xml  => @todo, :status => :created, :location => @todo }
        format.json { render :json => @todo, :status => :created, :location => @todo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml  => @todo.errors, :status => :unprocessable_entity }
        format.json { render :json => @todo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @todo = current_user.todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo }
        format.any(:xml, :json)  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml  => @todo.errors, :status => :unprocessable_entity }
        format.json { render :json => @todo.errors, :status => :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid todo."
    redirect_to root_url
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to(todos_url) }
      format.any(:xml, :json)  { head :ok }
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid todo."
    redirect_to root_url
  end
  
end
