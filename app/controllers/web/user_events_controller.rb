class Web::UserEventsController < Web::ApplicationController

  def index
    @search = UserEvent.ransack(params[:q])
    @events = @search.result.voted.with_active_speaker.by_created_at
  end
end

