class app {
    include app::localtime
    include app::lang
    include app::base
    include app::os-user-2014
    include app::os-group
    include app::db-2014
    include app::sshd
    include app::iptables
    include app::php
    include app::httpd
    include app::mysql

    Class['app::os-group']
    -> Class['app::httpd']
    ~> Class['app::os-user-2014']
}
