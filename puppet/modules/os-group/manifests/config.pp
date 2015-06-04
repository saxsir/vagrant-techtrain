class os-group::config{
    group { 'developer':
        ensure => present,
        gid => 505,
    }
}
