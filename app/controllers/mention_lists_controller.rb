class MentionListsController < ApplicationController
  include FaradayApiClient
  before_action :check_token
  def show
    #check login user
    current_user_id = session[:current_user_id]
    response = get_data("/mentionlists?user_id=#{current_user_id}")
    @t_group_messages = response['t_group_messages']
    @t_group_threads = response['t_group_threads']
    @t_group_star_msgids = response['t_group_star_msgids']
    @t_group_star_thread_msgids = response['t_group_star_thread_msgids']
    @t_group_react_msgids = response['t_group_react_msgids']
    @group_emoji_counts = response['group_emoji_counts']
    @group_react_usernames = response['group_react_usernames']
    @t_group_react_thread_msgids = response['t_group_react_thread_msgids']
    @group_thread_emoji_counts = response['group_thread_emoji_counts']
    @group_thread_react_usernames = response['group_thread_react_usernames']
    
    retrievehome
    # render 'show'

  end
end
