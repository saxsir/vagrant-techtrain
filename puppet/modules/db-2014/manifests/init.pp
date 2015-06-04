class db-2014{
    include db-2014::install
    include db-2014::config

       Class['db-2014::install']
    -> Class['db-2014::config']
}
