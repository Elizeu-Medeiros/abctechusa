<?php
defined('BASEPATH') or exit('No direct script access allowed');

class SalesOrder extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		//Load URL helper
		$this->load->helper('url');
	
	//	$this->load->library("session");
	//	if (!$this->session->userdata("usuario")) {
			//redirect("logoff");
	//	}

		$this->load->model('SalesOrder_model', 'salesOrder');

	}

	public function index(){
		$data = array(
			"styles" => array(),
			"empresa" => "Abctechusa",
			"title" => "Sales Order",
			"descricao" => "",
			"pagina" => "Dashboard",
			"logo" => base_url("assets/img/usa.png"),
			"menu" => "dashboard",
		//	"usuario" => $usuario,
			"styles" => array("assets-for-demo/vertical-nav.css"),
			"scripts" => array(
				"plugins/jquery.dataTables.min.js",
				"util.js",
				"salesorder.js")
		);


		$this->template->show("dashboard.php", $data);
	}

	public function ajaxListSalesOrder()
	{
		//if (!$this->input->is_ajax_request()) {
	//		exit("Nenhum acesso de script direto permitido!");
//		}

		$salesOrder = $this->salesOrder->salesOrder();

		$data = array();
		foreach ($salesOrder as $so) {

			$row = array();

			$row[] = $so->type_name;
			$row[] = $so->FL;
			$row[] = $so->CA;
			$row[] = $so->orders;

			$data[] = $row;
		}

		$json = array(
			"draw" => $this->input->post("draw"),
		//	"recordsTotal" => $this->salesOrder->records_total(),
		//	"recordsFiltered" => $this->salesOrder->records_filtered(),
			"data" => $data,
		);

		echo json_encode($json);
	}
}