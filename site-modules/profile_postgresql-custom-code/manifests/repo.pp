class profile_postgresql_custom_code::repo {

  include apt

  apt::source { 'pgdg':
    location => lookup('profile_postgresql_custom_code::repo_location'),
    release  => lookup('profile_postgresql_custom_code::repo_release'),
    repos    => 'main',
    key      => {
      id     => lookup('profile_postgresql_custom_code::repo_key_id'),
      source => lookup('profile_postgresql_custom_code::repo_key_source'),
    },
  }
}
