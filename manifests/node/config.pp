class alien::node::config inherits alien {

    file_line { 'aliprod_alien_path':
        path    => "$user_home/.bashrc",
        line    => 'export PATH="$HOME/alien/bin:$PATH"',
        require => User['aliprod_user'],
    }

    file_line { 'aliprod_alien_lang':
        path    => "$user_home/.bashrc",
        line    => 'export LANG=C',
        require => User['aliprod_user'],
    }
}
