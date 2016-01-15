xml.instruct!

xml.rows  do
  @users.each do |user|
  	xml.row('id'=>user.id) do
  		xml.cell user.nome
      xml.cell user.status
      xml.cell user.role
      xml.cell user.email
      xml.cell user.last_sign_in_at
    end
  end
end
