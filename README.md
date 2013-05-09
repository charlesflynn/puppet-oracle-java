# puppet-oracle-java

Agree to Oracle's license and download the .bin (Java 6) or .tar.gz (Java 7) installation file. Place the downloaded file in the `files` directory. The module expects the original filename, so do not change it. You can keep multiple installation files in the `files` directory.

Call the module as follows:

    class {'oracle_java':
        file        => 'jdk-7u21-linux-x64.tar.gz',
        base_dir    => '/usr/local/java',
    }

The `base_dir` parameter defaults to `/usr/local/java` if not specified. The `file` parameter must be specified.
