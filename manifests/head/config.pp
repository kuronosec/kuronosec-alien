class alien::head::config inherits alien {

    # AliEn host private key and certificate
    file { "$user_home/.globus":
        ensure  => directory,
        owner   => $user_name,
        group   => $group_name,
        mode    => '0700',
        require => [ User['alien_user'], Group['alien_group'] ],
    }

    # AliEn configuration
    file { "$user_home/.alien":
        ensure => directory,
        owner  => $user_name,
        group  => $group_name,
        mode   => '0755',
    } ->
    file { "$user_home/.alien/etc":
        ensure => directory,
        owner  => $user_name,
        group  => $group_name,
        mode   => '0755',
    } ->
    file { "$user_home/.alien/etc/aliend":
        ensure => directory,
        owner  => $user_name,
        group  => $group_name,
        mode   => '0755',
    } ->
    file { "$user_home/.alien/etc/aliend/ALICE":
        ensure => directory,
        owner  => $user_name,
        group  => $group_name,
        mode   => '0755',
    }

    file { "$user_home/.alien/etc/aliend/startup.conf":
        owner   => $user_name,
        group   => $group_name,
        mode    => '0644',
        content => "ALIEN_ORGANISATIONS=\"ALICE\"\n",
        require => File["$user_home/.alien/etc/aliend"],
    }

    file { "$user_home/.alien/etc/aliend/ALICE/startup.conf":
        owner   => $user_name,
        group   => $group_name,
        mode    => '0644',
        content => "AliEnUser=$user_name\nAliEnServices=\"Monitor CE CMreport MonaLisa\"\n",
        require => File["$user_home/.alien/etc/aliend/ALICE"],
    }

    file { "$user_home/.alien/alice.conf":
        owner   => $user_name,
        group   => $group_name,
        mode    => '0644',
        content => "CLUSTERMONITOR_ADDRESS http://${cluster_monitor}\nCLUSTERMONITOR_SOAPTYPE httpd\nJOB_MANAGER_ADDRESS https://aliendb8.cern.ch:8083\n",
        require => File["$user_home/.alien"],
    }

    file { "$user_home/.alien/Environment":
        owner   => $user_name,
        group   => $group_name,
        mode    => '0644',
        content => "export ALIEN_USER=$user_cert_name\nexport ALIEN_DOMAIN=$alien_domain\nexport ALIEN_WORKDIR=$user_home/.alien/tmp\nexport ALIEN_VERSION=v2-19-395\n",
        require => File["$user_home/.alien"],
    }

        if $service_manage == true {
        service { 'alien_middleware':
          ensure     => $service_ensure,
          enable     => $service_enable,
          name       => $service_name,
          hasstatus  => true,
          hasrestart => true,
        }
    }

    if $use_cvmfs == true {
        file_line { 'alien_path':
            path    => "$user_home/.bashrc",
            line    => 'export PATH="/cvmfs/alice.cern.ch/bin:$PATH"',
            require => User['alien_user'],
        }
    } else {
        file_line { 'alien_path':
            path    => "$user_home/.bashrc",
            line    => 'export PATH="$HOME/alien/bin:$PATH"',
            require => User['alien_user'],
        }
    }

    file_line { 'alien_lang':
        path    => "$user_home/.bashrc",
        line    => 'export LANG=C',
        require => User['alien_user'],
    }
}
