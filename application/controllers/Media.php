<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Media extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        //$this->load->library('grocery_CRUD');
        //$this->setTemplateFile('grocery_view');
    }

    public function index()
    {
    
        //$this->uri->segment('3');
        //$this->load->view('admin/crud_grocery', (array) $output);
        echo $this->uri->segment('1');
        echo $this->uri->segment('2');
        echo $this->uri->segment('3');
        echo $this->uri->segment('4');
        echo $this->uri->segment('5');
            // error handle
      
    }

    public function load(){
        echo $this->uri->segment('1');
        echo '<br>';
        echo $this->uri->segment('2');
        echo '<br>';
        echo $this->uri->segment('3');
        echo '<br>';
        echo $this->uri->segment('4');
        echo '<br>';
        echo $this->uri->segment('6');
        echo '<br>';
        echo $this->uri->segment('7');
        echo '<br>';
        echo $this->uri->segment('8');
        echo '<br>';
        echo $this->uri->segment('9');
    }
    
    // initial setup of grocery crud by table name, theme and others
    public function getGroceryCRUD($TableName, $Subject, $PageTitle, $Breadcrumbs)
    {
        $crud = new grocery_CRUD();
        $this->data['title'] = $PageTitle;
        $this->data['breadcrumbs'] = $Breadcrumbs;
        $crud->set_theme('bootstrap');
        $crud->set_table($TableName);
        $crud->set_subject($Subject);
        return $crud;
    }

}
