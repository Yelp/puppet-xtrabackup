# == Class: xtrabackup
#
# Class to install xtrabackup from packages
#
class xtrabackup::install {
  package { 'xtrabackup':
    ensure => $xtrabackup::version
  }
}
