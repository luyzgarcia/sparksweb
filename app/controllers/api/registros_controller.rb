class Api::RegistrosController < Api::ApiController
  protect_from_forgery :except => [:upload_file]

  def upload_file
    logger.info "Upload File"

    @registros = []

    #logger.info params[:file]

    #exit;

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
    #f = File.new("#{Rails.public_path}/H503A0015DD63A517488C4D28.txt", "r+")
    f = File.new(params[:file], "r+")

    f.each do |line|
      if line.strip.length > 1
        item = []
        registro = Registro.new
        objeto = line.strip.split('#')
        logger.info objeto
        registro[:etiqueta_id] = objeto[0]
        #registro[:data_hora] = Time.parse(objeto[8]+' '+objeto[9])
        registro[:dia] = Time.parse(objeto[8])
        registro[:hora] = Time.parse(objeto[9])
        registro[:tipo] = objeto[10]
        logger.info registro.inspect
        @registros.push(registro)
        #Para apagar a linha lida, descomentar as 3 linhas seguintes
        #f.seek(-line.length, IO::SEEK_CUR)
        #f.write(' ' * (line.length - 1))
        #f.write("\n")
      end
    end

    logger.info "Array size: #{@registros.size}"
    @registros.each do |item|
      #Se for salvar os registros lidos, descomentar as linhas abaixo
      #if(item.save)
      #  logger.info "Item: #{item.inspect} salvo"
      #end
    end
    logger.info '---Fim da verificição.'



    respond_to do |format|
      #format.html { render :text => 'Entrou no upload_file' }
      format.json { render json: {status: true} }
      #format.json { render json: {status: false, message: 'Erro bla bla bla'} }
    end
    #return true;
  end


  def upload_file_line
    logger.info "Upload File por linha"

    @registros = []

    #logger.info params[:file]
    line = params[:line]
    logger.info line

    if line.strip.length > 1
      item = []
      registro = Registro.new
      objeto = line.strip.split('#')
      logger.info objeto
      registro[:etiqueta_id] = objeto[0]
      registro[:dia] = Time.parse(objeto[8])
      registro[:hora] = Time.parse(objeto[9])
      registro[:tipo] = objeto[10]
    end

    #@registros.each do |item|
      #Se for salvar os registros lidos, descomentar as linhas abaixo
      if(registro.save)
      #  logger.info "Item: #{item.inspect} salvo"
      end
    #end
    #logger.info '---Fim da verificição.'



    respond_to do |format|
      #format.html { render :text => 'Entrou no upload_file' }
      format.json { render json: {status: true} }
      #format.json { render json: {status: false, message: 'Erro bla bla bla'} }
    end
    #return true;
  end

  def show
    logger.info "Show"
  end

end