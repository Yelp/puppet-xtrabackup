# == Class: xtrabackup
#
# Class to install xtrabackup from packages
#
class xtrabackup::install {
  if $xtrabackup::compatibility__version == 'mysql80' {
    package {'percona-xtrabackup-80':
      ensure => $xtrabackup::version
    }
  } elsif $::lsbdistcodename != 'lucid' {
    package { 'percona-xtrabackup-24':
      ensure => $xtrabackup::version
    }
  } else {
    package { 'percona-xtrabackup':
      ensure => $xtrabackup::version
    }
  }
}
