xml.instruct!

xml.data  do
  xml.id_user @user.id
  xml.nome @user.nome
  xml.email @user.email
  xml.role @user.role
  xml.status @user.status
end
