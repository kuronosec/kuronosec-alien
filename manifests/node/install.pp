class alien::node::install inherits alien {

    # AliEn workernode local installation
    exec { 'install_alien':
        creates => "$user_home/alien",
        path    => '/usr/bin:/bin',
        command => "curl http://alien.cern.ch/alien-installer -o alien-installer && chmod +x alien-installer && su $user_name -c './alien-installer -version $alien_version -type workernode -batch -notorrent -install-dir $user_home/alien'",
        cwd     => '/tmp',
        timeout     => 1800,
        require => User['alien_user'],
    }
}
