xml.instruct!

xml.complete  do
  (0..23).each do |hora|
    xml.option('value'=>hora) do
      xml.text! hora.to_s
    end
  end
end
