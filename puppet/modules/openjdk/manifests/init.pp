class openjdk{
    include openjdk::install
    include openjdk::config
    include openjdk::service

       Class['openjdk::install']
    -> Class['openjdk::config']
    ~> Class['openjdk::service']
}
