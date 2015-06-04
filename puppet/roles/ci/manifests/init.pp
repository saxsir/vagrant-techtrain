class ci {
    include ci::localtime
    include ci::lang
    include ci::base
    include ci::os-user-2014
    include ci::os-group
    include ci::db-2014
    include ci::sshd
    include ci::iptables
    include ci::php
    include ci::httpd
    include ci::mysql
    include ci::openjdk
    include ci::jenkins
    include ci

    Class['ci::os-group']
    -> Class['ci::httpd']
    ~> Class['ci::os-user-2014']
}
