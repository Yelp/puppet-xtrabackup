# == Class: xtrabackup
#
# Class to install xtrabackup from packages
#
class xtrabackup::install {
  package { 'percona-xtrabackup':
    ensure => $xtrabackup::version
  }
}
