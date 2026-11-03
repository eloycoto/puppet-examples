class profile_postgresql_custom_module_and_no_conversion::install {

  package { $profile_postgresql_custom_module_and_no_conversion::package_names:
    ensure  => installed,
    require => Class['profile_postgresql_custom_module_and_no_conversion::repo'],
  }

  package { 'libpq-dev':
    ensure => installed,
  }
}
