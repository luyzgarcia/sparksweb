xml.instruct!

xml.complete  do
  @tipo_periodos.each do |tipo|
  	xml.option('value'=>tipo.id) do
  		xml.text! tipo.titulo
    end
  end
end