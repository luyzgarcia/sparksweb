xml.instruct!

xml.complete  do
  @dias.each do |dia|
    xml.option('value'=>dia) do
      xml.text! I18n.t(Date::DAYNAMES[dia.to_i])
    end
  end
end
