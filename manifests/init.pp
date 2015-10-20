class fluentd (
  $repo_name = $fluentd::repo_name,
  $repo_baseurl = $fluentd::repo_baseurl,
  $repo_enabled = $fluentd::repo_enabled,
  $repo_gpgcheck = $fluentd::repo_gpgcheck,
  $repo_gpgkey = $fluentd::repo_gpgkey,
  $package_name = $fluentd::package_name,
  $package_ensure = $fluentd::package_ensure,
  $plugin_names = $fluentd::plugin_names,
  $plugin_ensure = $fluentd::plugin_ensure,
  $service_name = $fluentd::service_name,
  $service_ensure = $fluentd::service_ensure,
  $service_enable = $fluentd::service_enable,
  $service_manage = $fluentd::service_manage,
  $config_file = $fluentd::config_file,
  $config_template = $fluentd::config_template,
  $config = $fluentd::params::config,
) inherits fluentd::params {

  # Param validations
  validate_string($repo_name)
  validate_string($repo_baseurl)
  validate_bool($repo_enabled)
  validate_bool($repo_gpgcheck)
  validate_string($repo_gpgkey)
  validate_string($package_name)
  validate_string($package_ensure)
  validate_array($plugin_names)
  validate_string($plugin_ensure)
  validate_string($service_name)
  validate_string($service_ensure)
  validate_bool($service_enable)
  validate_bool($service_manage)
  validate_absolute_path($config_file)
  validate_string($config_template)
  validate_hash($config)

  contain fluentd::install
  contain fluentd::config
  contain fluentd::service

  Class['Fluentd::Install'] ->
  Class['Fluentd::Config'] ~>
  Class['Fluentd::Service']
}