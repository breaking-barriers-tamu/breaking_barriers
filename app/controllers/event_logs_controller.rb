class EventLogsController < ApplicationController
  before_action :set_event_log, only: %i[ show edit update destroy ]

  # GET /event_logs or /event_logs.json
  def index
    @event_logs = EventLog.all
  end

  # GET /event_logs/1 or /event_logs/1.json
  def show
  end

  # GET /event_logs/new
  def new
    @event_log = EventLog.new
  end

  # GET /event_logs/1/edit
  def edit
  end

  # POST /event_logs or /event_logs.json
  def create
    @event_log = EventLog.new(event_log_params)

    respond_to do |format|
      if @event_log.save
        format.html { redirect_to event_log_url(@event_log), notice: "Event log was successfully created." }
        format.json { render :show, status: :created, location: @event_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_logs/1 or /event_logs/1.json
  def update
    respond_to do |format|
      if @event_log.update(event_log_params)
        format.html { redirect_to event_log_url(@event_log), notice: "Event log was successfully updated." }
        format.json { render :show, status: :ok, location: @event_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_logs/1 or /event_logs/1.json
  def destroy
    @event_log.destroy

    respond_to do |format|
      format.html { redirect_to event_logs_url, notice: "Event log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_log
      @event_log = EventLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_log_params
      params.require(:event_log).permit(:hourlog_id, :user_id, :event_id, :hours)
    end
end
