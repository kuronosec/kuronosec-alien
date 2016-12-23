class alien::params {
    # alien user and group
    $cluster_monitor = 'alice.cern.ch:8084'
    $user_cert_name  = 'aliprod'
    $alien_domain    = 'alice.cern.ch'
    $use_cvmfs       = true
    $user_name       = 'aliprod'
    $group_name      = 'aliprod'
    $user_uid        = 355
    $group_gid       = 355
    $user_home       = '/var/lib/aliprod'
    $service_ensure  = 'running'
    $service_enable  = 'true'
    $service_name    = 'alien_middleware'
    $alien_version   = 'v2-19'
    $mount_server    = '127.0.0.1'
    $mount_port      = 2049
}

