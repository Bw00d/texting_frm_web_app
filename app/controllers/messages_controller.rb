class MessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
    @messages = Message.all
  end
end
