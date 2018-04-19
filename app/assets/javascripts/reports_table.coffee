class reportsTable
  @bind : ()->
    for el in $('.reportTable').not('.dataTable')
      reportTable = $(el)
      reportTable.DataTable 
        responsive: true,
        dom: 'Bfrtip',
        buttons: [{ 
          extend: 'excelHtml5', 
          text: 'Descargar', 
          title: 'Reporte asistencia mensual',
          exportOptions: {
            columns: [ 0, 1, 2, 3, 4, 5, 6, 7]
          }
        }], 
        "language": {
          "lengthMenu": "Mostrar _MENU_ registros por pagina",
          "zeroRecords": "No se encontraron registros",
          "info": "Pagina _PAGE_ de _PAGES_",
          "infoEmpty": "No hay registros",
          "infoFiltered": "(filtrado de un total de _MAX_)",
          "search":         "Buscar:",
          "searchPlaceholder": "EJ: Pedro Perez",
          "paginate": {
            "first":      "Inicio",
            "last":       "Final",
            "next":       "Siguiente",
            "previous":   "Anterior"
          },
        } 

document.addEventListener('turbolinks:load', reportsTable.bind)
