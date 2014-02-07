# == Class: xtrabackup::define_defaults
#
# Create unique defaults files
# Especially useful if you don't define datadir
# innodb_log_group_home_dir or other things explicitly
#
define xtrabackup::define_defaults(
  $ensure = present,         # Ensure things present/absent
  $user,                     # The user to connect with
  $password,                 # The password to use
  $port,                     # The port to use
  $socket,                   # The socket, they're not all the same
  $confdir,                  # The directory to stash the cnf
  $datadir,                  # The main mysql directory
  $innodb_log_group_home_dir # The innodb log file dir
) {
  file { "${confdir}/${title}":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    content => template('xtrabackup/defaults.cnf.erb')
  }
}
