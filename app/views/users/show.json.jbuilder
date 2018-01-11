json.partial! 'users/user', user: @user
json.auth_token @token
json.bookmark_ids @user.bookmarks.pluck(:id)
