# == Class: xtrabackup::define_defaults
#
# Create unique defaults files
# Especially useful if you don't define datadir
# innodb_log_group_home_dir or other things explicitly
#
define xtrabackup::define_defaults(
  $user,
  $pass,
  $port,
  $socket,
  $scriptdir,                # The directory to stash the cnf
  $datadir,                  # The main mysql directory
  $innodb_log_group_home_dir # The innodb log file dir
) {
  file { "${scriptdir}/${title}":
    owner   => 'root',
    group   => 'root',
    mode    => 644,
    content => template('xtrabackup/defaults.cnf.erb')
  }
}
