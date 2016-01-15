desc "Esta tarefa é chamada pelo Heroku scheduler add-on"

task :verifica_registros_servidor => :environment do
	puts "Iniciando tarefa verifica registros no servidor..."
	registro = RegistrosController.new
	registro.verifica_servidor
	puts "Finalizou tarefa"	
end