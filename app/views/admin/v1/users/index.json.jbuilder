json.users do
  json.array! @users.records, :id,:name, :email, :profile
end