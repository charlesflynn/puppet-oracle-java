class oracle_java ($base_dir = '/usr/local/java', $file) {
    if $file =~ /^(\w+)-(\d+)u(\d+)-\w+-\w+\.(.+)$/ {
        $java = {   distrib => $1,
                    version => $2,
                    update  => $3,
                    ext     => $4
        }
        if $java['ext'] == 'bin' {
            $java['unpack'] = "chmod +x ${file}; ./${file}; rm ${file}"
        }
        elsif $java['ext'] == 'tar.gz' {
            $java['unpack'] = "tar xvfz ${file}; rm ${file}"
        }
        else {
            fail("Java installation file must have .bin or .tar.gz extension.")
        }
    }
    else {
        fail("Java installation file has nonstandard name. Please use the original filename from the Oracle website.")
    }

    $version_dir = "${base_dir}/${java[distrib]}1.${java[version]}.0_${java[update]}"

    file { "${base_dir}":
        alias   => 'base-dir',
        ensure  => directory,
        notify  => File['version-dir'],
    }

    file { "${version_dir}":
        alias   => 'version-dir',
        ensure  => absent,
        recurse => true,
        notify  => File['package-file'],
    }

    file { "${base_dir}/${file}":
        alias   => 'package-file',
        ensure  => present,
        source  => "puppet:///modules/oracle_java/${file}",
        notify  => Exec['unpack-java'],
    }

    exec { 'unpack-java':
        command     => "${java['unpack']}",
        cwd         => "${base_dir}",
        path        => '/bin',
        refreshonly => true,
    }
}