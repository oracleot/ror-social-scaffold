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
end
