<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="<?php echo site_url('admin/dashboard/index'); ?>"><i class="fa fa-home"></i> Dashboard</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-object-group"></i> Manajemen Master <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="<?php echo site_url('admin/modul/modul/'); ?>">Modul</a></li>
                  <li><a href="<?php echo site_url('admin/modul/kategori_modul'); ?>">Kategori Modul</a></li>
                  <li><a href="<?php echo site_url('admin/settings/index'); ?>"><i class="fa fa-cogs"></i> Pengaturan</a></li>
                </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-server"></i> Data Master <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="<?php echo site_url('admin/opd/'); ?>"> OPD</a></li>
                  <li><a href="<?php echo site_url('admin/user/'); ?>">Manejemen User</a></li>
                  <li><a href="<?php echo site_url('admin/user_groups/'); ?>">Manajemen User Group</a></li>
                </ul>
            </li>
              <?php if ($this->ion_auth->is_admin()): ?>
              <li><a href="<?php echo site_url('admin/contoh/index'); ?>"><i class="fa fa-book"></i> Contoh</a></li>
              <li><a href="<?php echo site_url('admin/fitur/daftar'); ?>"><i class="fa fa-list"></i> Fitur</a></li>
                  </ul>
              <?php endif?>
      
        </div>
<!-- /.sidebar -->
<script type="text/javascript">
    $(document).ready(function () {

        $('.sidebar ul li').each(function () {
            if (window.location.href.indexOf($(this).find('a:first').attr('href')) > -1) {
                $(this).closest('ul').closest('li').attr('class', 'active');
                $(this).addClass('active').siblings().removeClass('active');
            }
        });

    });
</script>