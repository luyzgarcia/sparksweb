xml.instruct!

xml.rows  do
  @tipos.each do |nivel|
  	xml.row('id'=>nivel.id) do		  	
  	 # xml.cell nivel.id
      xml.cell nivel.titulo
      xml.cell nivel.created_at
      xml.cell nivel.updated_at
    end
  end
end