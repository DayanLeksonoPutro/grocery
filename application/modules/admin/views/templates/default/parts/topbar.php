<nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="<?php echo site_url( 'admin/dashboard' ); ?>" class="navbar-brand"><b>Admin</b>LTE</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <?php require_once 'menu.php'; ?>
        <!-- /.navbar-collapse -->
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
          <li><a href="<?php echo site_url('admin/dashboard/profile'); ?>"><i class="fa fa-user"></i> <?php echo $_SESSION['settings_data']['settings_name']; ?></a></li>
          <li><a href="<?php echo site_url('auth/logout'); ?>"><i class="fa fa-sign-out"></i> Log Out</a></li>
          </ul>
        </div>
        <!-- /.navbar-custom-menu -->
      </div>
      <!-- /.container-fluid -->
    </nav>