class Aluno < ActiveRecord::Base
  belongs_to :turma
  has_many :etiquetas

  def self.import(file, turma_id)
    arquivo = open_spreadsheet(file)
    logger.info arquivo.info
    header = arquivo.row(1)
#    logger.info header

    (2..arquivo.last_row).each do |i|
      row = Hash[[header, arquivo.row(i)].transpose]
      #aluno = new
      aluno = find_by_codigo(row["codigo"]) || new
      aluno.attributes = row.to_hash.reject{|k,v| !aluno.attributes.keys.member?(k.to_s) }
      aluno.turma_id = turma_id if (turma_id)
      aluno.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
   # when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, file_warning: :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
