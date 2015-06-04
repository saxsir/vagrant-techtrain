class os-user-2014::config{
    user { 'techtrain':
        ensure => present,
        gid => 'developer',
        comment => 'techtrain',
        home => '/home/techtrain',
        password => '$6$u/a559S9y3CwTJCp$sSwn.GZDUrRGh5Ref8eKH3cxQxJHB/dCJqJOyxjnBk8zkXnasT2zLfM9LQ2EYzA.ntrwYuWrAkvXzNGYyAoLk1',
        managehome => true,
        shell => '/bin/bash',
        require => Group['developer'],
    }

    file { '/home/techtrain/.ssh':
        ensure => directory,
        owner => 'techtrain',
        group => 'developer',
        mode => '0700',
        require => User["techtrain"]
    }

    exec { "techtrain chmod" :
        user => 'root',
        path => ['/bin'],
        command => "chmod 755 /home/techtrain",
        timeout => 999,
        require => User["techtrain"]
    }

}
