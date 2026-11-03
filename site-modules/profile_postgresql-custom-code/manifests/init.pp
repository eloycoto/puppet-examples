class profile_postgresql_custom_code (
  String        $version       = lookup('profile_postgresql_custom_code::version'),
  Array[String] $package_names = lookup('profile_postgresql_custom_code::package_names'),
  String        $service_name  = lookup('profile_postgresql_custom_code::service_name'),
) {
  $postgres_nodes = puppetdb_query(
    "resources[certname] {
      type = 'Class' and
      title = 'Profile_postgresql_custom_code'
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

  contain profile_postgresql_custom_code::repo
  contain profile_postgresql_custom_code::install
  contain profile_postgresql_custom_code::service

  Class['profile_postgresql_custom_code::repo']
  -> Class['profile_postgresql_custom_code::install']
  -> Class['profile_postgresql_custom_code::service']
}
