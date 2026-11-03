class profile_postgresql_custom_code::install {

  package { $profile_postgresql_custom_code::package_names:
    ensure  => installed,
    require => Class['profile_postgresql_custom_code::repo'],
  }

  package { 'libpq-dev':
    ensure => installed,
  }
}
