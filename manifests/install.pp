# == Class: xtrabackup
#
# Class to install xtrabackup from packages
#
class xtrabackup::install {
  package { 'percona-xtrabackup-24':
    ensure => $xtrabackup::version
  }
}
