class profile_postgresql_custom_code::service {

  service { $profile_postgresql_custom_code::service_name:
    ensure  => running,
    enable  => true,
    require => Class['profile_postgresql_custom_code::install'],
  }
}
