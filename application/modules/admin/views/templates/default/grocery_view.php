<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html>
<head>
    <?php require_once 'parts/grocery_header.php'; ?>
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

  <header class="main-header">
  <?php require_once 'parts/topbar.php'; ?>
  </header>
  <!-- Full Width Column -->
  <div class="content-wrapper" style="background:white;">
    <div class="container-fluid" >
    

      <!-- Main content -->
      <section class="content">
      {{CONTENT}}
      </section>
      <!-- /.content -->
    </div>
    <!-- /.container -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
        <?php require_once 'parts/grocery_footer.php'; ?>
 </footer>
