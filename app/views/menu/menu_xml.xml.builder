xml.instruct!

xml.tree('id'=>'0')  do
	xml.item('id'=>'registros', 'text'=>'Administrativo') do
		xml.userdata('name'=>'link') do
			xml.text! 'registros'
		end
		xml.item('id'=>niveis_path, 'text'=>'Niveis','im0'=>'folderClosed.gif', 'im1'=>'folderOpen.gif') do
			xml.userdata('name'=>'link') do
				xml.text! niveis_path
			end
		  @niveis.each do |nivel|
		  	xml.item('id'=>edit_nivel_path(nivel),'text'=>nivel.titulo, 'im0'=>'folderClosed.gif', 'im1'=>'folderOpen.gif') do
		  		xml.userdata('name'=>'link') do
					xml.text! edit_nivel_path(nivel)
				end
		  		if nivel.series.any?
		  			nivel.series.each do |serie|
		  				xml.item('id'=>series_path(serie), 'text'=>serie.titulo, 'im0'=>'folderClosed.gif', 'im1'=>'folderOpen.gif') do
		  					xml.userdata('name'=>'link') do
  								xml.text! series_path(serie)
  							end
			  				if serie.turmas.any?
			  					serie.turmas.each do |turma|
			  						xml.item('id'=>turma_path(turma), 'text'=>turma.titulo) do
			  							xml.userdata('name'=>'link') do
			  								xml.text! turma_path(turma)
			  							end
					  					xml.id turma.titulo
					  				end
			  					end
			  				end
		  					xml.id serie.titulo
		  				end
		  			end
		  		end
		  	  xml.id nivel.id
		      xml.titulo nivel.titulo
		      xml.dias_semana_letivo nivel.dias_semana_letivo
		      xml.created_at nivel.created_at
		      xml.updated_at nivel.updated_at
		    end
		  end
	  	end
	  	xml.item('id'=>tipo_periodos_path, 'text'=>'Tipos de Periodos', 'im0'=>'folderClosed.gif', 'im1'=>'folderOpen.gif') do
	  		xml.userdata('name'=>'link') do
				xml.text! tipo_periodos_path
			end
	  	end
		xml.item('id'=>alunos_path, 'text'=>'Alunos', 'im0'=>'folderClosed.gif','im1'=>'folderOpen.gif') do
			xml.userdata('name'=>'link') do
				xml.text! alunos_path
			end
		end
  	end
  	xml.item('id' => users_path, 'text'=>'Usuários' , 'im0'=>'folderClosed.gif','im1'=>'folderOpen.gif') do
  		xml.userdata('name'=>'link') do
			xml.text! users_path
		end
	end

	xml.item('id'=>'01', 'text'=>'Registro de acesso') do
		xml.item('id'=>'02', 'text'=>'Niveis','im0'=>'folderClosed.gif', 'im1'=>'folderOpen.gif') do
		  @niveis.each do |nivel|
		  	xml.item('id'=>nivel.id,'text'=>nivel.titulo, 'im0'=>'folderClosed.gif', 'im1'=>'folderOpen.gif') do
		  		if nivel.series.any?
		  			nivel.series.each do |serie|
		  				xml.item('id'=>serie.id, 'text'=>serie.titulo, 'im0'=>'folderClosed.gif', 'im1'=>'folderOpen.gif') do
			  				if serie.turmas.any?
			  					serie.turmas.each do |turma|
			  						xml.item('id'=>turma_path(turma),  'text'=>turma.titulo) do
			  							xml.userdata('name'=>'link') do
			  								xml.text! show_limited_turma_path(turma)
			  							end
					  					xml.id turma.titulo
					  				end
			  					end
			  				end
		  					xml.id serie.titulo
		  				end
		  			end
		  		end
		  	  xml.id nivel.id
		      xml.titulo nivel.titulo
		      xml.dias_semana_letivo nivel.dias_semana_letivo
		      xml.created_at nivel.created_at
		      xml.updated_at nivel.updated_at
		    end
		  end
	  	end
  	end
	
end
	