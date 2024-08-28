class AllUnreadController < ApplicationController
  before_action :check_token
  def show
    retrievehome
    @current_user_id = @current_user["id"]
    response = get_data("/allunread?user_id=#{@current_user_id}&workspace_id=#{session[:workspace_id]}")
    if response.nil?
      flash.now[:danger] = 'Null Value'
    else 
      @t_direct_messages = response['t_direct_messages'] || []
      @t_direct_threads = response['t_direct_threads'] || []
      @t_user_channelids = response['t_user_channelids'] || []
      @t_user_channelthreadids = response['t_user_channelthreadids'] || []
      @t_group_messages = response['t_group_messages'] || [] 
      @t_group_threads = response['t_group_threads'] || [] 
      @t_direct_msg_emojiscounts = response['t_direct_msg_emojiscounts'] || [] 
      @t_direct_react_msgids = response['t_direct_react_msgids'] || [] 
      @react_usernames = response['react_usernames'] || [] 
      @t_direct_thread_emojiscounts = response['t_direct_thread_emojiscounts'] || [] 
      @t_direct_react_thread_msgids = response['t_direct_react_thread_msgids'] || [] 
      @threads_react_usernames = response['threads_react_usernames'] || [] 
      @group_emoji_counts = response['group_emoji_counts'] || [] 
      @t_group_react_msgids = response['t_group_react_msgids'] || [] 
      @group_react_usernames = response['group_react_usernames'] || []
      @group_threads_emoji_counts = response['group_threads_emoji_counts'] || [] 
      @t_group_react_thread_msgids = response['t_group_react_thread_msgids'] || [] 
      @group_threads_react_usernames = response['group_threads_react_usernames'] || []  
    end
  end
end