class profile_postgresql_single_module::repo {

  include apt

  apt::source { 'pgdg':
    location => lookup('profile_postgresql_single_module::repo_location'),
    release  => lookup('profile_postgresql_single_module::repo_release'),
    repos    => 'main',
    key      => {
      id     => lookup('profile_postgresql_single_module::repo_key_id'),
      source => lookup('profile_postgresql_single_module::repo_key_source'),
    },
  }
}
