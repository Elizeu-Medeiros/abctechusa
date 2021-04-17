$(document).ready(function () {

	//Listar todos os pedidos
	$("#lt_sales_order").DataTable({
		"destroy": true,
		"autoWidth": true,
		"processing": true,
		"serverSide": true,
		"ajax": {
			"url": BASE_URL + "SalesOrder/ajaxListSalesOrder",
			"type": "POST",
		},

		"columnDefs": [
			{ targets: "no-sort", orderable: false },
			{  "searchable": false },
			{ targets: "dt-center", className: "dt-center" },
			{ "searchable": false },
			{ orderable: false, targets: [0,1,2,3]}

		]
	})

})