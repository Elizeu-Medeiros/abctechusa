<?php

defined('BASEPATH') or exit('No direct script access allowed');

class SalesOrder_model extends CI_Model
{
  public function __construct()
  {
  }

  public function salesOrder()
  {
    $query = $this->db->query('select 
    so.type_name,
    (select sum(sop.payment_amount) total from accounts acc
          inner join account_type_table at ON at.account_type_id = acc.account_type_id
          left join industry_type_table it ON it.industry_type_id = acc.account_id
      inner join sales_order sal on sal.account_id = acc.account_id
      inner join sales_order_status_table sos ON sos.sales_order_status_id = sal.status_id
      inner join sales_order_payment sop ON sop.sales_order_id = sal.sales_order_id
      inner join payment_status ps ON ps.payment_status_id = sop.payment_status
        where acc.state = "FL"
              and sop.payment_status = 2
        and acc.account_type_id = so.account_type_id) FL, 
    (select sum(sop.payment_amount) total from accounts acc
      inner join account_type_table at ON at.account_type_id = acc.account_type_id
      inner join sales_order sal on sal.account_id = acc.account_id
      inner join sales_order_payment sop ON sop.sales_order_id = sal.sales_order_id
      inner join payment_status ps ON ps.payment_status_id = sop.payment_status
        where acc.state = "CA"
            and sop.payment_status = 2
        and acc.account_type_id = so.account_type_id) CA,
    (select count(sal.sales_order_id) total from accounts acc
          inner join account_type_table at ON at.account_type_id = acc.account_type_id
          left join industry_type_table it ON it.industry_type_id = acc.account_id
      inner join sales_order sal on sal.account_id = acc.account_id
      inner join sales_order_payment sop ON sop.sales_order_id = sal.sales_order_id
      inner join payment_status ps ON ps.payment_status_id = sop.payment_status
        where acc.account_type_id = so.account_type_id
              and sop.payment_status = 2) orders
    from account_type_table so ');

    return $query->result();
  }
}
