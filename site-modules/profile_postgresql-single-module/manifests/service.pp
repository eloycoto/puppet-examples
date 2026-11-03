class profile_postgresql_single_module::service {

  service { $profile_postgresql_single_module::service_name:
    ensure  => running,
    enable  => true,
    require => Class['profile_postgresql_single_module::install'],
  }
}
