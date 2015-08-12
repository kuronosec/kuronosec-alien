class alien::head::service inherits alien {

    # TODO: really implement this class.
    # * Is there an already service defined for alice?
    # * What to do with alien proxy-init?
    # * Wait until the user supplies the certificates?
    # This questions should be solved before creting an actual service

    if ! ($service_ensure in [ 'running', 'stopped' ]) {
        fail('service_ensure parameter must be running or stopped')
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
}
