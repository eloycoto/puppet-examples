class profile_postgresql_custom_module_and_no_conversion::repo {

  include apt

  apt::source { 'pgdg':
    location => lookup('profile_postgresql_custom_module_and_no_conversion::repo_location'),
    release  => lookup('profile_postgresql_custom_module_and_no_conversion::repo_release'),
    repos    => 'main',
    key      => {
      id     => lookup('profile_postgresql_custom_module_and_no_conversion::repo_key_id'),
      source => lookup('profile_postgresql_custom_module_and_no_conversion::repo_key_source'),
    },
  }
}
