class marksTable
  @bind : ()->
    for el in $('.sentTable').not('.dataTable')
      sentTable = $(el)
      sentTable.DataTable 
        responsive: true,
        dom: 'Bfrtip',
        buttons: [{ 
          extend: 'excelHtml5', 
          text: 'Descargar', 
          title: 'Marcaciones',
          exportOptions: {
            columns: [ 0, 1, 2, 3, 4, 5 ]
          }
        }], 
        "language": {
          "lengthMenu": "Mostrar _MENU_ registros por página",
          "zeroRecords": "No se encontraron registros",
          "info": "Página _PAGE_ de _PAGES_",
          "infoEmpty": "No hay registros",
          "infoFiltered": "(filtrado de un total de _MAX_)",
          "search":         "Buscar:",
          "searchPlaceholder": "EJ: Entrada",
          "paginate": {
            "first":      "Inicio",
            "last":       "Final",
            "next":       "Siguiente",
            "previous":   "Anterior"
          },
        } 

document.addEventListener('turbolinks:load', marksTable.bind)