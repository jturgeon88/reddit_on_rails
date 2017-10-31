class SubsController < ApplicationController

  before_action :require_logged_in!

  def new
    @sub = Sub.new
    render :new 
  end

  def create
  end

  def edit
    @sub = Sub.find_by()
  end

  def update
  end

  def show
  end

  def index
  end

  def destroy
  end
end
