# == Class: xtrabackup
#
# Class to install xtrabackup from packages
#
class xtrabackup::install {
  if $::lsbdistcodename != 'lucid' {
    package { 'percona-xtrabackup-24':
      ensure => $xtrabackup::version
    }
  } else {
    package { 'percona-xtrabackup':
      ensure => $xtrabackup::version
    }
  }
}
