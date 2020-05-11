# @summary Install Prometheus IPSec exporter and configure it as a system service
# @see https://github.com/dennisstritzke/ipsec_exporter
#
# @example
#   class {'ipsec_exporter':
#     version => '0.3.1',
#   }
#
# @param version
#   Set version to install
#
# @param install_dir
#   Directory to extract downloaded package. Defaults to `'/opt'`.
#
# @param tmp_dir
#   Temporary file for downloading archive before extracting. Defaults to `'/tmp'`.
#
# @param service_manage
#   Defaults `true`.
#
# @param service_enable
#   Defaults `true`.
#
# @param service_ensure
#   Defaults `'running'`
#
# @param service_name
#   Defaults `'ipsec_exporter'`
#
# @param service_flags
#   Hash enabling to configure command line parameters
#   for the exporter. See https://github.com/dennisstritzke/ipsec_exporter for docs.
#
class ipsec_exporter (
  String                     $version,
  Stdlib::AbsolutePath       $install_dir,
  Stdlib::AbsolutePath       $tmp_dir,
  Boolean                    $service_enable,
  Enum['running', 'stopped'] $service_ensure,
  Boolean                    $service_manage,
  String                     $service_name,
  Hash[String,String]        $service_flags,
) {
  contain ipsec_exporter::install
  contain ipsec_exporter::service

  Class['::ipsec_exporter::install']
  ~> Class['::ipsec_exporter::service']
}
