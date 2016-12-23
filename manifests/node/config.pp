class alien::node::config inherits alien {

    if $use_cvmfs == true {
        file_line { 'alien_path':
            path    => "$user_home/.bashrc",
            line    => 'export PATH="/cvmfs/alice.cern.ch/bin:$PATH"',
            require => User['alien_user'],
        }
        exec {"mount_cvmfs":
            command  => "mount -t nfs -o proto=tcp,port=$mount_port $mount_server:$user_home/.alien/tmp $user_home/.alien/tmp",
            path     => "/bin:/usr/bin:/usr/local/sbin:/usr/local/bin",
            unless   => "grep -qs '$user_home/.alien/tmp' /proc/mounts",
            provider => 'shell',
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
