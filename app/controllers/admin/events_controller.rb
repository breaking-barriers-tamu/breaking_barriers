# frozen_string_literal: true

module Admin
  class EventsController < ApplicationController
    before_action :set_event, only: %i[show edit update destroy]

    # GET /events or /events.json
    def index
      @events = Event.all
      @upcoming_events = Event.where('datetime > ?', DateTime.now).order(datetime: :asc)
      @past_events = Event.where('datetime < ?', DateTime.now).order(datetime: :desc)
    end

    # GET /events/1 or /events/1.json
    def show
      @event = Event.find(params[:id])
      @event_logs = EventLog.where(event_id: @event.id)
    end

    # GET /events/new
    def new
      @event = Event.new
    end

    # GET /events/1/edit
    def edit; end

    # POST /events or /events.json
    def create
      @event = Event.new(event_params)

      respond_to do |format|
        if @event.save
          format.html do
            redirect_to(admin_event_path(@event), notice: 'Event was successfully created.')
          end
          format.json { render(:show, status: :created, location: @event) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @event.errors, status: :unprocessable_entity) }
        end
      end
    end

    # PATCH/PUT /events/1 or /events/1.json
    def update
      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to(admin_event_path(@event), notice: 'Event was successfully updated.') }
          format.json { render(:show, status: :ok, location: @event) }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @event.errors, status: :unprocessable_entity) }
        end
      end
    end

    # DELETE /events/1 or /events/1.json
    def destroy
      @event.destroy!

      respond_to do |format|
        format.html { redirect_to(admin_events_path, notice: 'Event was successfully destroyed.') }
        format.json { head(:no_content) }
      end
    end

    def update_participation
      # safe navigation: continue if event_log_attributes present

      params[:event][:event_logs_attributes]&.each do |attrs|
        event_log = EventLog.find(attrs.second[:id])

        # if going from false to true
        if (event_log.participating == false) && (attrs.second[:participating] == '1')
          event_log.update(participating: attrs.second[:participating])
          EventConfirmationMailer.with(user: event_log.user,
                                       event: event_log.event
                                      ).confirmation_email.deliver_later
        else
          event_log.update(participating: attrs.second[:participating])
        end
      end
    end

    def purge_flier
      @event = Event.find(params[:id])
      if @event.flier.attached?
        @event.flier.purge
        redirect_to(admin_event_path(@event), notice: 'Flier was successfully deleted.')
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :location, :duration, :description, :event_enabled,
                                    :officer_in_charge, :datetime,
                                    :flier, event_logs_attributes: %i[id participating]
      )
    end
  end
end
