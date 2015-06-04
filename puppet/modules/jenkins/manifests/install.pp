class jenkins::install{
    exec { "add-jenkins-repo":
        command => "wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo",
        path => ["/bin", "/usr/bin"],
    }

    exec { "install-jenkins-key":
        command => "rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key",
        path => ["/bin", "/usr/bin"],
    }

    package{
        [
        'jenkins',
        ]:
        ensure => installed,
        require => Exec['add-jenkins-repo', 'install-jenkins-key'],
    }
}
