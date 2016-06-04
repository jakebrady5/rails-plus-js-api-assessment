class WorkOrdersController < ApplicationController

  def complete
    WorkOrder.mark_complete_by_ids(params[:ids])
    redirect_to '/'
  end

end