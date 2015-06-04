class base::service {
    service{ 'crond':
        enable => true,
        ensure => running,
        hasrestart => true,
    }
}
