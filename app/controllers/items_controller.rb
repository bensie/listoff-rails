class ItemsController < ApplicationController
  
  before_filter :find_todo

  def index
    @items = @todo.items.all

    respond_to do |format|
      format.html
      format.xml  { render :xml  => @items }
      format.json { render :json => @items }
    end
  end

  def show
    @item = @todo.items.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml  => @item }
      format.json { render :json => @item }
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid item."
    redirect_to @todo
  end

  def new
    @item = @todo.items.build

    respond_to do |format|
      format.html
      format.xml  { render :xml  => @item }
      format.json { render :json => @item }
    end
  end

  def edit
    @item = @todo.items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid item."
    redirect_to @todo
  end

  def create    
    @item = @todo.items.build(params[:item])

    respond_to do |format|      
      if @item.save
        format.html { redirect_to @todo }
        format.xml  { render :xml  => @item, :status => :created, :location => [@todo, @item] }
        format.json { render :json => @item, :status => :created, :location => [@todo, @item] }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml  => @item.errors, :status => :unprocessable_entity }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }

        format.js do
          render :update do |page| 
            flash[:error] = @item.errors.full_messages.to_sentence
            page.redirect_to @todo 
          end
        end
      end
    end
  end

  def update
    @item = @todo.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @todo }
        format.any(:xml, :json) { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml  => @item.errors, :status => :unprocessable_entity }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid item."
    redirect_to @todo
  end

  def destroy
    @item = @todo.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @todo }
      format.any(:xml, :json) { head :ok }
      format.js   { render 'create'}  
    end
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid item."
    redirect_to @todo
  end
  
protected

  def find_todo
    @todo = current_user.todos.find(params[:todo_id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Invalid todo."
    redirect_to @todo
  end

end
