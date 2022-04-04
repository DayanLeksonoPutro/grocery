<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Contoh extends Admin_Base_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('grocery_CRUD');
        $this->setTemplateFile('grocery_view');
        $this->load->model('contoh_model');

        // check librarians groups or not
        $group = 'admin';
        if (!$this->ion_auth->in_group($group)) {
            $this->session->set_flashdata('message', 'You must be a admin to view this page.');
            redirect('admin/dashboard/access_denied');
        }
    }

    public function index()
    {
        redirect('admin/contoh/contoh_grocery');
    }

    public function contoh_grocery()
    {
        try {

            // Grocery settings getGroceryCRUD( $TableName, $Subject, $PageTitle, $Breadcrumbs )
            $crud = $this->getGroceryCRUD('contoh', 'Contoh Grocecry', 'Contoh Grocery', 'Contoh Grocery');

            // data Grid view fields
            $crud->columns('id', 'contoh_produk', 'contoh_harga');

            // Insert form
            $crud->add_fields('contoh_produk','contoh_harga');

            // Update form
            $crud->edit_fields('contoh_produk','contoh_harga');

    
            // Unset, hide fields
            $crud->change_field_type('cre_or_up_date', 'invisible')
                ->change_field_type('cre_or_up_by', 'invisible');

            // Unset, hide fields from view page
            $crud->unset_read_fields('cre_or_up_by');

            // Required fields
            $crud->required_fields('contoh_produk','contoh_harga');

            // render output result
            $output = $crud->render();
            $this->load->view('admin/contoh/v_contoh', (array) $output);

            // error handle
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }

    // add and update cre_or_up_date & cre_or_up_date value
    public function custom_data_callback($post_array)
    {
        $post_array['cre_or_up_date'] = date('Y-m-d');
        $created_by = $this->ion_auth->get_user_id();
        $post_array['cre_or_up_by'] = $created_by;

        return $post_array;
    }

    // add and update cre_or_up_date & cre_or_up_date value
    public function custom_data_update_callback($post_array)
    {
        $post_array['cre_or_up_date'] = date('Y-m-d');
        $created_by = $this->ion_auth->get_user_id();
        $post_array['cre_or_up_by'] = $created_by;

        return $post_array;
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
