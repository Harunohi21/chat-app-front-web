class TDirectReactMsgController < ApplicationController
  before_action :check_token
  def create
    #check unlogin user
    # checkuser

    if session[:s_user_id].nil?
      redirect_to home_url
    else
      data = {
        s_user_id: session[:s_user_id],
        message_id: params[:message_id],
        user_id: session[:current_user_id],
        emoji: params[:emoji],
      }
      post_data("/directreact", data)
      if params[:status] == "true"
        redirect_to m_user_path(session[:s_user_id])
      else
        redirect_to t_direct_message_path(params[:message_id])
      end
    end
  end
end
