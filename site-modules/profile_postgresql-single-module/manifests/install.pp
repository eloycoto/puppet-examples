class profile_postgresql_single_module::install {

  package { $profile_postgresql_single_module::package_names:
    ensure  => installed,
    require => Class['profile_postgresql_single_module::repo'],
  }

  package { 'libpq-dev':
    ensure => installed,
  }
}
