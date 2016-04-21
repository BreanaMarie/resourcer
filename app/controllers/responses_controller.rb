class ResponsesController < ApplicationController
  def create
    @message = Message.find(params[:message_id])
    response_params = params.require(:response).permit(:content, :message_id, :user_id, :author)
    @response = @message.responses.create(response_params)
    redirect_to message_path(@message)
  end

  def show
    @message = Message.find_by_id(params[:id])
    @response = Response.find_by_id(params[@message.response_id])
  end

  def destroy
  end

end
