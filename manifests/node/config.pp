class alien::node::config inherits alien {

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
