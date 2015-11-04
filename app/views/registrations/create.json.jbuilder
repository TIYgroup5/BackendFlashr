json.user do
  json.extract! @user, :username, :full_name, :email, :auth_token
end