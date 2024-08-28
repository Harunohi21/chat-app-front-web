class StarListsController < ApplicationController
  include FaradayApiClient
  before_action :check_token
  def show
 
    current_user_ids = session[:current_user_id]
    response = get_data("/starlists?user_id=#{current_user_ids}")

    # Correct the keys to match the response JSON
    @direct_star = response['direct_Star'] # Corrected
    @direct_star_thread = response['direct_star_thread']  
    @group_star = response['group_star']
    @group_star_thread = response['group_star_thread']

    # direct react for star
    @t_direct_react_msgids = response['t_direct_react_msgids']  
    @t_direct_msg_emojiscounts = response['t_direct_msg_emojiscounts']
    @react_usernames = response['react_usernames']

    # direct threads react for star
    @t_direct_react_thread_msgids = response['t_direct_react_thread_msgids']  
    @t_direct_thread_emojiscounts = response['t_direct_thread_emojiscounts']
    @t_direct_thread_react_usernames = response['t_direct_thread_react_usernames']

    # group react for star
    @t_group_react_msgids = response['t_group_react_msgids']  
    @group_emoji_counts = response['group_emoji_counts']
    @group_react_usernames = response['group_react_usernames']

    # group threads react for star
    @t_group_react_thread_msgids = response['t_group_react_thread_msgids']  
    @t_group_thread_emoji_counts = response['t_group_thread_emoji_counts']
    @t_group_thread_react_usernames = response['t_group_thread_react_usernames']

    # Fetch @m_channels from the session
    @m_channels = session[:m_channels]
    @m_p_channels = session[:m_p_channels]
    @m_channelsids = session[:m_channelsids]
    @m_user = session[:m_user]

    retrievehome

    render 'show'
  end
end
