class profile_postgresql_custom_module_and_no_conversion::service {

  service { $profile_postgresql_custom_module_and_no_conversion::service_name:
    ensure  => running,
    enable  => true,
    require => Class['profile_postgresql_custom_module_and_no_conversion::install'],
  }
}
