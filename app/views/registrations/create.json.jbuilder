json.user do
  json.extract! @user, :username, :full_name, :email, :access_token
end