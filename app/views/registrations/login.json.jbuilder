json.user do
  json.extract! @user, :email, :auth_token
end