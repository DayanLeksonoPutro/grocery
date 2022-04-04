<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Modul extends Admin_Base_Controller
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
        redirect('admin/fitur/daftar');
    }
    public function kategori_modul()
    {
        try {

            // Grocery settings getGroceryCRUD( $TableName, $Subject, $PageTitle, $Breadcrumbs )
            $crud = $this->getGroceryCRUD('kategori_modul', 'kategori_modul', 'Kategori Modul', 'Kategori Modul');

            // data Grid view fields
            //$crud->columns('judul_fitur', 'status');

            // Insert form
            $crud->add_fields('nama_kategori_modul');

            // Update form
            $crud->edit_fields('nama_kategori_modul');

    
            // Unset, hide fields
            //$crud->change_field_type('cre_or_up_date', 'invisible')
            //    ->change_field_type('cre_or_up_by', 'invisible');

            // Unset, hide fields from view page
            //$crud->unset_read_fields('cre_or_up_by');

            // Required fields
            $crud->required_fields('nama_kategori_modul');

            // callback functions
            //$crud->callback_column('status', array($this, '_callback_status'))
            //->callback_read_field('status', array($this, '_callback_status'));
            // render output result
            $output = $crud->render();
            $this->load->view('admin/crud_grocery', (array) $output);

            // error handle
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    public function modul()
    {
        try {

            // Grocery settings getGroceryCRUD( $TableName, $Subject, $PageTitle, $Breadcrumbs )
            $crud = $this->getGroceryCRUD('modul', 'Modul', 'Modul', 'Modul');

            // data Grid view fields
            //$crud->columns('judul_fitur', 'status');

            // Insert form
            $crud->add_fields('fa_icon','nama_modul','url','id_kategori_modul');

            // Update form
            $crud->edit_fields('fa_icon','nama_modul','url','id_kategori_modul');

            // Relasi 
            $crud->set_relation('id_kategori_modul','kategori_modul','nama_kategori_modul');
            // display relasi
            $crud->display_as('id_kategori_modul','Kategori');
    
            // Unset, hide fields
            //$crud->change_field_type('cre_or_up_date', 'invisible')
            //    ->change_field_type('cre_or_up_by', 'invisible');

            // Unset, hide fields from view page
            //$crud->unset_read_fields('cre_or_up_by');

            // Required fields
            $crud->required_fields('nama_modul','url','id_kategori_modul');

            // callback functions
            $crud->callback_column('fa_icon', array($this, '_callback_faicon'))
            ->callback_read_field('fa_icon', array($this, '_callback_faicon'));
            // render output result
            $output = $crud->render();
            $this->load->view('admin/crud_grocery', (array) $output);

            // error handle
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    public function _callback_faicon($value, $row)
    {
        return '<i class="fa '.$value.'"></i>';
    }

    public function _callback_status($value, $row)
    {
        return $value == '1' ? "<strong style='color: #67bf7e'>DONE</strong>" : "<strong style='color: #e66f57'>WAITING</strong>";
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
