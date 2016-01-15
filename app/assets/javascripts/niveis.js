$(document).ready(function(){
	//*Configuração dos dias no formulario de niveis
	var source = [
        "Domingo",
        "Segunda",
        "Terça",
        "Quarta",
        "Quinta",
        "Sexta",
        "Sabado"];
	
	$("#jqxListBox").jqxListBox({source: source, multiple: true,width: 200, height: 180});
	var dias = $('#nivel_dias_semana_letivo').val().split(",");	
	for (var i = 0; i < dias.length; i++) {
		$("#jqxListBox").jqxListBox('selectIndex', dias[i]);
	}
	$("#jqxListBox").on('select', function (event) {
        if (event.args) {
            var args = event.args;
            var index = args.item.index;
            var items = $("#jqxListBox").jqxListBox('getSelectedItems');
            var selection = '';
            if(items.length > 0) {
	            for (var i = 0; i < items.length; i++) {
	                selection += items[i].index + (i < items.length - 1 ? "," : "");
	            }
	            
	           //$('input[name="nivel[dias_semana_letivo][]"]').val(selection);
	           $('#nivel_dias_semana_letivo').val(selection);
            }
        }
    });
	
	
	//*Area de dias não letivos
	//$("input[type='date']").jqxDateTimeInput({ width: '250px', height: '25px' });
	
});