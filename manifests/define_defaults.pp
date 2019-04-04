# == Class: xtrabackup::define_defaults
#
# Create unique defaults files
# Especially useful if you don't define datadir
# innodb_log_group_home_dir or other things explicitly
#
define xtrabackup::define_defaults(
  $ensure                      = present, # Ensure things present/absent
  $user                        = '',      # The user to connect with
  $password                    = '',      # The password to use
  $port                        = '',      # The port to use
  $socket                      = '',      # The socket, they're not all the same
  $confdir                     = '',      # The directory to stash the cnf
  $datadir                     = '',      # The main mysql directory
  $innodb_log_group_home_dir   = '',      # The innodb log file dir
  $xtrabackup_open_files_limit = '',      # The innobackupex hidden setting
  $file_params                 = {},      # Override config's file params
) {
  $default_params = {
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('xtrabackup/defaults.cnf.erb')
  }
  $merged_params = merge($default_params, $file_params)
  create_resources('file', {"${confdir}/${title}" => $merged_params})
}
