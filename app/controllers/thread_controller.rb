class ThreadController < ApplicationController
  include FaradayApiClient
  before_action :check_token
  def show
    session.delete(:s_user_id)
    session.delete(:s_channel_id)
    session.delete(:s_direct_message_id)
    session.delete(:s_group_message_id)
    session.delete(:r_direct_size)
    session.delete(:r_group_size)
    response1 = get_data('/main')
    @current_user = response1['current_user']
    @user_id = @current_user['id']
    response = get_data("/thread?user_id=#{@user_id}")
    if response.nil?
      flash.now[:danger] = 'Null value'
    else
      @t_direct_messages = response['t_direct_messages'] || []
      @t_direct_threads = response['t_direct_threads'] || []
      @t_group_messages = response['t_group_messages'] || []
      @t_group_threads = response['t_group_threads'] || []
      @t_direct_star_thread_msgids = response['t_direct_star_thread_msgids'] || []
      @t_direct_star_msgids = response['t_direct_star_msgids'] || []
      @t_group_star_msgids = response['t_group_star_msgids'] || []
      @t_group_star_thread_msgids = response['t_group_star_thread_msgids'] || []

      @t_direct_react_msgids = response['t_direct_react_msgids'] || []
      @t_direct_msg_emojiscounts = response['t_direct_msg_emojiscounts'] || []
      @react_usernames = response['react_usernames'] || []

      @t_direct_react_thread_msgids = response['t_direct_react_thread_msgids'] || []
      @t_direct_thread_emojiscounts = response['t_direct_thread_emojiscounts'] || []
      @t_direct_thread_react_usernames = response['t_direct_thread_react_usernames'] || []

      @t_group_react_msgids = response['t_group_react_msgids'] || []
      @group_emoji_counts = response['group_emoji_counts'] || []
      @group_react_usernames = response['group_react_usernames'] || []
      
      @t_group_react_thread_msgids = response['t_group_react_thread_msgids'] || []
      @t_group_thread_emoji_counts = response['t_group_thread_emoji_counts'] || []
      @t_group_thread_react_usernames = response['t_group_thread_react_usernames'] || []
    end

    retrievehome
  end
end
