class MessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
    @user = current_user
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @user = current_user
    @message = Message.create(message_params)
    if @message.save
      redirect_to :back, notice: "Your message was sent."
    else
      redirect_to :back, alert: "You messed something up. Try again."
    end
  end

  private

    def message_params
      params.require(:message).permit(:to, :from, :body)
    end
end
