class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :track_global_visit
  before_action :track_page_visit
  before_action :update_last_visited_time
  before_action :set_todo, only: %i[show edit update destroy]

  private

  # Tracks total visits across the entire application
  def track_global_visit
    session[:total_visits] ||= 0
    session[:total_visits] += 1
  end

  # Tracks visits to specific controller#action combinations
  def track_page_visit
    session[:page_visits] ||= {}
    current_path = "#{controller_name}##{action_name}"
    session[:page_visits][current_path] ||= 0
    session[:page_visits][current_path] += 1
  end

  # Updates the last visited timestamp
  def update_last_visited_time
    session[:last_visited] = Time.current
  end
  # validation 

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
end