class WorkOrdersController < ApplicationController

  def complete
    params[:ids].each do |id|
      order = WorkOrder.find_by(id: id)
      order.update(status: 1)
    end
    redirect_to '/'
  end

end