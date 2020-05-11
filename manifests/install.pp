# @summary Download and install ipsec exporter
#
# @api private
class ipsec_exporter::install {
  assert_private()

  archive { 'ipsec_exporter':
    ensure       => present,
    source       => "https://github.com/dennisstritzke/ipsec_exporter/releases/download/v${ipsec_exporter::version}/ipsec_exporter-v${ipsec_exporter::version}.linux-amd64.tar.gz",
    path         => "${ipsec_exporter::tmp_dir}/ipsec_exporter-v${ipsec_exporter::version}.linux-amd64.tar.gz",
    extract      => true,
    extract_path => $ipsec_exporter::install_dir,
    creates      => "${ipsec_exporter::install_dir}/ipsec_exporter-v${ipsec_exporter::version}.linux-amd64",
    user         => 'root',
    group        => 'root',
    cleanup      => true,
  }
  -> file {"${ipsec_exporter::install_dir}/ipsec_exporter-v${ipsec_exporter::version}.linux-amd64":
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  -> file {"${ipsec_exporter::install_dir}/ipsec_exporter":
    ensure => link,
    target => "${ipsec_exporter::install_dir}/ipsec_exporter-v${ipsec_exporter::version}.linux-amd64"
  }
}
