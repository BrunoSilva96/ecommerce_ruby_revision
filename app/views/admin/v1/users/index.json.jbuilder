json.users do
  json.array! @users.records, :id,:name, :email, :profile
end

# json.meta do
#   json.partial! 'shared/pagination', pagination: @users.pagination
# end