<?php
class mod_paypal extends controller
{
	function __construct()
	{
		parent::__construct();
	}	
	public function paypal($id=false,$data_detail=false,$total=false)
    {
        if(ctype_digit($id)&&$data_detail&&$total){ 
            $paypal = array(
                'METHOD'             => 'SetExpressCheckout',
                'MAXAMT'             => $total*1.5,
                'RETURNURL'          => 'http://mah.vn/paypal_finish/'.$id,
                'CANCELURL'          => 'http://mah.vn/Cart',
                'REQCONFIRMSHIPPING' => 0,
                'NOSHIPPING'         => 0,
                'ALLOWNOTE'          => 0,
                'LOCALECODE'         => 'EN',
                'LANDINGPAGE'        => 'Login',
                'HDRIMG'             => null,
                'PAYFLOWCOLOR'       => '',
                'CHANNELTYPE'        => 'Merchant'
            );
            $paypal1=array(
                'PAYMENTREQUEST_0_ITEMAMT' => $total,
                'PAYMENTREQUEST_0_AMT' => $total
            );
            $data=array_merge($paypal,$data_detail,$paypal1);           
            $result = $this->call($data);
            if (!isset($result['TOKEN'])) {
                $this->log($result,'Paypal session');
                // $datas=array(
                //     "TOKEN"=>false,
                // );
               $this->notify("Can't connect paypal page! Error:14077410:SSL routines");
                header('location: '.URL.CTL);
            }else{
                // $datas=array(
                //     "TOKEN"=>$result['TOKEN'],                  
                // );
                var_dump($result['TOKEN']);
                header('Location: https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=' . $result['TOKEN'] . '&useraction=commit');
            }
        }
    }
    public function paypal_finish($id=false)
    {
        if(ctype_digit($id)){
            if($_GET['token']&&$_GET['PayerID']);
            $order=$this->model->get_paypal_detail($id);
            $paypal = array(
                'TOKEN'                             => $_GET['token'],
                'PAYERID'                           => $_GET['PayerID'],
                'METHOD'                            => 'DoExpressCheckoutPayment',
                'MAXAMT'                            => ($order['amount'])*1.5,
                'RETURNFMFDETAILS'                  => 1,
                'PAYMENTREQUEST_0_SHIPPINGAMT'      => '',
                'PAYMENTREQUEST_0_CURRENCYCODE'     => 'USD',
                'PAYMENTREQUEST_0_PAYMENTACTION'    => 'Sale',
            );
            $paypal1=array();
            $paypal2=array(
                'PAYMENTREQUEST_0_ITEMAMT' => $order['amount']+0.00,
                'PAYMENTREQUEST_0_AMT' => $order['amount']+0.00
            );
            $orders=explode(";",$order['orders']);
            foreach ($orders as $pay_key=>$pay_item) {
                list($item_id,$price,$qty)=explode("-",$pay_item);
                $item=$this->model->get_item($item_id);
                $itemlist=array(
                    'L_PAYMENTREQUEST_0_DESC'.$pay_key => false,
                    'L_PAYMENTREQUEST_0_NAME'.$pay_key => $item['name'],
                    'L_PAYMENTREQUEST_0_NUMBER'.$pay_key => "item_".$item_id,
                    'L_PAYMENTREQUEST_0_AMT'.$pay_key => $price+0.00,
                    'L_PAYMENTREQUEST_0_QTY'.$pay_key => $qty+0,
                    'L_PAYMENTREQUEST_0_ITEMURL'.$pay_key => URL.'/Item/detail/'.$item_id,
                    'L_PAYMENTREQUEST_0_ITEMWEIGHTVALUE'.$pay_key => '0.00',
                    'L_PAYMENTREQUEST_0_ITEMWEIGHTUNIT'.$pay_key => 'kg'
                );
                $paypal1=array_merge($paypal1,$itemlist);
            }
            $data=array_merge($paypal,$paypal1,$paypal2);
            $result=$this->call($data);
            if(strtolower($result['ACK'])=='success'){
                $payment_id="WE-".$result['PAYMENTINFO_0_TRANSACTIONID'];
                if($this->model->payment_paypal($id,$payment_id)){
                    $_SESSION['notify']="You just completed payment!";
                    header('location: '.URL.'Featured');
                }else{
                    Flash::warning("You can't completed payment!");
                    header('location: '.URL.CTL);
                }
            }else{
                Flash::warning("You can't completed payment! Plz check again");
                header('location: '.URL.CTL);
            }
        }
    }
    public function call($data) {        
        $api_url = 'https://api-3t.sandbox.paypal.com/nvp';
        $api_user = 'binh.webempire_api1.gmail.com';
        $api_password = 'UNHXG5JB9PEE94L3';
        $api_signature = 'AFcWxV21C7fd0v3bYYYRCpSSRl31AkZmq4zMcs9xpJTi3pB1xvpjV4PX';

        $settings = array(
            'USER'         => $api_user,
            'PWD'          => $api_password,
            'SIGNATURE'    => $api_signature,
            'VERSION'      => '109.0',
            'BUTTONSOURCE' => 'WE_button'
        );
        $this->log($data, 'Call data');
        $defaults = array(
            CURLOPT_POST => 1,
            CURLOPT_HEADER => 0,
            CURLOPT_URL => $api_url,
            CURLOPT_USERAGENT => "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.1) Gecko/20061204 Firefox/2.0.0.1",
            CURLOPT_FRESH_CONNECT => 1,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_FORBID_REUSE => 1,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_SSL_VERIFYPEER => 0,
            CURLOPT_SSL_VERIFYHOST => 0,
            CURLOPT_POSTFIELDS => http_build_query(array_merge($data, $settings), '', "&"),
        );
        $ch = curl_init();
        curl_setopt_array($ch, $defaults);
        if (!$result = curl_exec($ch)) {
            $this->log(array('error' => curl_error($ch), 'errno' => curl_errno($ch)), 'cURL failed');
        }
        var_dump($result);exit;
        $this->log($result, 'Result');
        curl_close($ch);
        return $this->cleanReturn($result);
    }
    public function cleanReturn($data) {
        $data = explode('&', $data);
        $arr = array();
        foreach ($data as $k=>$v) {
            $tmp = explode('=', $v);
            $arr[$tmp[0]] = isset($tmp[1]) ? urldecode($tmp[1]) : '';
        }
        return $arr;
    }
    public function log($data, $title = null) {
        $this->handle = fopen(PAYPAL, 'a');
        fwrite($this->handle, date('Y-m-d G:i:s') . ' - ' . print_r('PayPal Express debug (' . $title . '): ' . json_encode($data), true) . "\n");
        fclose($this->handle);
    }
}