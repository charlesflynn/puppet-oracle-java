# puppet-oracle-java

This module installs Oracle's JDK or JRE on a Puppet-managed VM. Agree to Oracle's license and download the .bin (Java 6) or .tar.gz (Java 7) installation file. Place the downloaded file in the `files` directory. The module expects the original filename, so do not change it. You can keep multiple installation files in the `files` directory.

Call the module as follows:

    class {'oracle_java':
        file        => 'jdk-7u21-linux-x64.tar.gz',
        base_dir    => '/usr/local/java',
    }

The `base_dir` parameter defaults to `/usr/local/java` if not specified. The `file` parameter must be specified. The module installs `file` to a version-specific subdirectory of `base_dir`.

Tested with the latest JDK and JRE downloads for Java 6 and 7. The downloaded files were:

    jdk-6u45-linux-x64.bin
    jdk-7u21-linux-x64.tar.gz
    jre-6u45-linux-x64.bin
    jre-7u21-linux-x64.tar.gz

Here is the installed outcome of four separate runs on the same VM with `base_dir` left default:

    /usr/local/java/jdk1.6.0_45
    /usr/local/java/jdk1.7.0_21
    /usr/local/java/jre1.6.0_45
    /usr/local/java/jre1.7.0_21
