class alien::head::install inherits alien {

    if $use_cvmfs == false {
        # AliEn VOBOX local installation
        exec { 'install_alien':
            creates => "$user_home/alien",
            path    => '/usr/bin:/bin',
            command => "curl http://alien.cern.ch/alien-installer -o alien-installer && chmod +x alien-installer && su $user_name -c './alien-installer -version $alien_version -type vobox -batch -notorrent -install-dir $user_home/alien'",
            cwd     => '/tmp',
            timeout     => 1800,
            require => User['alien_user'],
        }
    }
}
