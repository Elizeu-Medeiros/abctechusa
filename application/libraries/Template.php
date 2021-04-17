<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Template
{
	
	function show($view, $data = array())
	{
		$CI = &get_instance();

		// Load header
		$CI->load->view('template/dashboard/header', $data);

		// Load menu
		$CI->load->view('template/dashboard/menu', $data);

		// Load content
		$CI->load->view($view, $data);

		// Load footer
		$CI->load->view('template/dashboard/footer', $data);

		// Scripts
		$CI->load->view('template/dashboard/scripts', $data);
	}
}

/* End of file Template.php */

/* Location: ./system/application/libraries/Template.php */