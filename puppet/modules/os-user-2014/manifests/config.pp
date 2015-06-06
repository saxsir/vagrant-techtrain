class os-user-2014::config{
    user { 'techtrain':
        ensure => present,
        groups => ['developer', 'wheel'],
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

    ssh_authorized_key { 'techtrain@techtrain':
      user => 'techtrain',
      type => 'ssh-rsa',
      key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEArXF9cp9GL5XJln5byWJh+pdelI32S1R1NIWWzCt6LbNphFecgMoxPQ6Hr/9RgU9ETf3XMI+WggFbKU3pii4hCfTY573ogJz73Y7JbklkPBlWlHx9GjP2/wGfpQkUnf5Wec+v0Y0uZKxaZ8VXTZizOnXvliR8oPFEFEPMffxluCFtVyuJ7cpD0ry3HtIu4I9xcaf8x+t5zGXttqc390qOor9+nLQibpICtZlM/jfp5Z5H0wRKTUCYZHq2dTxl1wRMddOaTQtAW/z2rKXknQzIO7+p2yJTS9XPF89leLs3bci84GIp/7Gmw4HyHV5bSRwJ2lQyOkJsx0/HBmfv7d2FsQ==',
    }

    file { '/etc/sudoers':
        owner => 'root',
        group => 'root',
        mode => '0440',
        content => template('os-user-2014/sudoers'),
    }
}
