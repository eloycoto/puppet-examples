class profile_postgresql_custom_module_and_no_conversion (
  String        $version       = lookup('profile_postgresql_custom_module_and_no_conversion::version'),
  Array[String] $package_names = lookup('profile_postgresql_custom_module_and_no_conversion::package_names'),
  String        $service_name  = lookup('profile_postgresql_custom_module_and_no_conversion::service_name'),
) {
  $postgres_nodes = puppetdb_query(
    "resources[certname] {
      type = 'Class' and
      title = 'Profile_postgresql_custom_module_and_no_conversion'
    }"
  )

  $health_check = myFunction1('http://localhost:8080/health')

  file { '/var/lib/pgsql/health_check.json':
    ensure  => file,
    owner   => 'postgres',
    group   => 'postgres',
    mode    => '0644',
    content => stdlib::to_json($health_check),
  }

  myDeploy1 { 'myapp':
    version     => '2.1.0',
    url         => 'http://artifacts.internal/myapp-2.1.0.tar.gz',
    install_dir => '/opt/myapp',
  }

  $service_token = mySecretFunction1('postgres_service_token')

  mySecretType1 { 'postgres-node':
    schedule => 'daily',
  }

  myFormatType1 { 'app-mode':
    file  => '/etc/company/app.conf',
    value => 'cluster',
  }

  myFormatType1 { 'health-port':
    file  => '/etc/company/app.conf',
    value => '8080',
  }

  myCronType1 { 'postgres-backup':
    command => '/usr/local/bin/postgres-backup.sh',
    hour    => '2',
    minute  => '30',
  }

  contain profile_postgresql_custom_module_and_no_conversion::repo
  contain profile_postgresql_custom_module_and_no_conversion::install
  contain profile_postgresql_custom_module_and_no_conversion::service

  Class['profile_postgresql_custom_module_and_no_conversion::repo']
  -> Class['profile_postgresql_custom_module_and_no_conversion::install']
  -> Class['profile_postgresql_custom_module_and_no_conversion::service']
}
