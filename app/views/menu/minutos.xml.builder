xml.instruct!

xml.complete  do
  (0..59).each do |minuto|

    xml.option('value'=>minuto) do
      xml.text! minuto.to_s
    end
  end
end
