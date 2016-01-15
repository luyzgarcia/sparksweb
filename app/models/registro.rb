class Registro < ActiveRecord::Base
	belongs_to :aluno
	before_save :verifica_aluno

	def verifica_servidor
		logger.info '---Iniciando verificação de novos registros no servidor.'
		logger.info "Acessando o arquivo na pasta #{Rails.public_path}"
		logger.info "Vai ler o arquivo H503A0015DD63A517488C4D28.txt"
		@registros = []

		#Se nao quiser apagar a linha lida
		#File.open("#{Rails.public_path}/H503A0015DD63A517488C4D28.txt", "r+") do |file|
		#	file.each_line do |line|
		#		logger.info "Line: #{line.strip}"
				#if line.strip.lenght > 1
		#			a.push(line.strip.split('#'))
				#end
		#	end
		#end


		#Se quiser apagar a linha lida
		f = File.new("#{Rails.public_path}/H503A0015DD63A517488C4D28.txt", "r+")
		f.each do |line|
			if line.strip.length > 1
				item = []
				registro = Registro.new
				objeto = line.strip.split('#')
				registro[:etiqueta_id] = objeto[0]
				registro[:data_hora] = Time.parse(objeto[8]+' '+objeto[9])
				registro[:tipo] = objeto[10]
				@registros.push(registro)
				#Para apagar a linha lida, descomentar as 3 linhas seguintes
				#f.seek(-line.length, IO::SEEK_CUR)
				#f.write(' ' * (line.length - 1))
	    		#f.write("\n")
	    	end
		end

		logger.info "Array size: #{@registros.size}"
		@registros.each do |item|
			logger.info "Item: #{item.inspect}"
		end

		logger.info '---Fim da verificição.'
    end

    def verifica_aluno
    	#logger.info "Verificando aluno da Etiqueta #{self[:etiqueta_id]}"
    	etiqueta = Etiqueta.find_by_codigo(self[:etiqueta_id])
    	
    	#Verifica se o registro já existe no banco de dados
    	if Registro.exists?(etiqueta_id: self[:etiqueta_id], dia: self[:dia],hora: self[:hora])
    		return false
    	end
    	#Caso a etiqueta não esteja associada a ninguem ele ignora e não salva
    	if etiqueta
	    	self[:aluno_id] = etiqueta.aluno_id
	    	return true
	    else
	    	return false
	    	self[:aluno_id] = 0
	    end
    end
end
