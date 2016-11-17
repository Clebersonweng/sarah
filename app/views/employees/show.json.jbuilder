json.id @employee.id
json.name @employee.name
json.lastname @employee.lastname
json.salary @employee.salary
json.user_id @employee.user_id

json.user do |json|
  json.id @employee.user.id
  json.email @employee.user.email
end