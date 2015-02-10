# == Class: xtrabackup::config
#
# The configuration of xtrabackup
#
class xtrabackup::config {
  file { "$xtrabackup::scriptdir/mysql-xtrabackup":
    owner   => 'root',
    group   => 'root',
    mode    => '744',
    content => template('xtrabackup/backupscript.sh.erb')
  }
  file { "$xtrabackup::scriptdir/mysql-xtrabackup-restore":
    owner   => 'root',
    group   => 'root',
    mode    => '744',
    content => template('xtrabackup/restorescript.sh.erb')
  }
  # keepdays is deprecated, prunes to 24 hours older than last success file
  file { "$xtrabackup::scriptdir/mysql-xtrabackup-async-prune":
    owner  => 'root',
    group  => 'root',
    mode   => '744',
    source => 'puppet:///modules/xtrabackup/asyncprune.sh'
  }
}
