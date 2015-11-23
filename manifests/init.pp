# == Class: alien
#
# Full description of class alien here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'alien':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class alien (
      $use_cvmfs      = $alien::params::use_cvmfs,
      $user_name      = $alien::params::user_name,
      $group_name     = $alien::params::group_name,
      $user_uid       = $alien::params::user_uid,
      $group_gid      = $alien::params::group_gid,
      $user_home      = $alien::params::user_home,
      $service_ensure = $alien::params::service_ensure,
      $service_enable = $alien::params::service_enable,
      $service_name   = $alien::params::service_name,
      $alien_version  = $alien::params::alien_version
    ) inherits alien::params {

    # AliEn user and group
    group { 'alien_group':
        name   => $group_name,
        ensure => present,
        gid    => $group_gid,
    }

    user { 'alien_user':
        name       => $user_name,
        ensure     => present,
        uid        => $user_uid,
        managehome => true,
        home       => $user_home,
    }
}
