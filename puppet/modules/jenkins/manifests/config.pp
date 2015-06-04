class jenkins::config {
    file { '/etc/sysconfig/jenkins':
        owner => 'root', group => 'root',
        content => template('jenkins/jenkins'),
        mode => 600,
        notify => Service['jenkins']
    }
}
