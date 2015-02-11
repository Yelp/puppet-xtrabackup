# == Class: xtrabackup
#
# Configures xtrabackup to take MySQL database backups
#
# === Parameters
#
# [*workdir*]
#   Working directory.  The volume it is on needs at least as much free space as
#   total database size on disk.  Must already exist.
#   (Optional, uses /tmp by default)
# [*outputdir*]
#   Directory to write backups to.  If sshdest is also specified, will be the remote 
#   database host.  Must already exist.
#   (Required)
# [*parallel*]
#   Speed up backup by using this many theads.
#   (Optional, defaults to 1)
# [*slaveinfo*]
#   Record master info so that a slave can be created from this backup.
#   (Optional, disabled by default)
# [*scriptdir*]
#   Specify the actual directory to put the script on the filesystem
#
# === Examples
#
#  Create a backup and set the retention policy to 2 weeks
#
#  class { "xtrabackup":
#    workdir   => "/root/backupworkdir",
#    outputdir => "/mnt/nfs/mysqlbackups",
#  }
#
# === Authors
#
# Sam Bashton <sam@bashton.com>
#
# === Copyright
#
# Copyright 2013 Bashton Ltd
#
class xtrabackup (
  $workdir   = '/tmp',            # Working directory
  $outputdir,                     # Directory to output to
  $parallel  = 1,                 # Threads to use
  $slaveinfo = undef,             # Record master log pos if true
  $scriptdir = '/usr/local/bin/', # The default script dir
  $version   = 'present'
) {
  class{'xtrabackup::install': } ->
  class{'xtrabackup::config': } ->
  Class['xtrabackup']
}
