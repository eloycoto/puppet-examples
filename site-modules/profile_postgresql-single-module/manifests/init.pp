class profile_postgresql_single_module (
  String        $version       = lookup('profile_postgresql_single_module::version'),
  Array[String] $package_names = lookup('profile_postgresql_single_module::package_names'),
  String        $service_name  = lookup('profile_postgresql_single_module::service_name'),
) {
  $postgres_nodes = puppetdb_query(
    "resources[certname] {
      type = 'Class' and
      title = 'Profile_postgresql_single_module'
    }"
  )

  $health_check = myFunction1('http://localhost:8080/health')

  myType1 { 'http://localhost:8080/health': }

  contain profile_postgresql_single_module::repo
  contain profile_postgresql_single_module::install
  contain profile_postgresql_single_module::service

  Class['profile_postgresql_single_module::repo']
  -> Class['profile_postgresql_single_module::install']
  -> Class['profile_postgresql_single_module::service']
}
