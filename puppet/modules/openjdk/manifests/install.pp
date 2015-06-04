class openjdk::install{
    package{
        [
        'java-1.8.0-openjdk-headless',
        'java-1.8.0-openjdk-devel',
        ]:
        ensure => installed,
        before => Package['jenkins']
    }
}
