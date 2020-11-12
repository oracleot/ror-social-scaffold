module UserHelper
  def list_pending_friends
    if @pending_friends.empty?
      content_tag :p, 'No pending friends.'
    else
      content_tag :ul, class: 'users-list' do
        @pending_friends.each do |friend|
          link = link_to(friend.name.to_s, user_path(friend), class: 'profile-link')
          content = content_tag(:span, link)
          concat content_tag(:li, content)
        end
      end
    end
  end

  def invite_links(user)
    if current_user.friend_requests.include?(user)
      concat link_to 'Accept friendship', confirm_friend_path(user), class: 'profile-link'
      concat link_to 'Reject friendship', reject_friendship_path(user), class: 'profile-link'
    elsif !current_user.pending_friends.include?(user) && current_user != user && !current_user.friend?(user)
      concat link_to 'Invite to friendship', invite_friend_path(user), class: 'profile-link'
    end
  end
end
