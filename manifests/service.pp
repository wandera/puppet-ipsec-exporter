# @summary Setup system service
#
# @api private
class ipsec_exporter::service {
  assert_private()

  if $ipsec_exporter::service_manage {
    file {"/etc/systemd/system/${ipsec_exporter::service_name}.service":
      content => epp('ipsec_exporter/etc/systemd/system/ipsec_exporter.service.epp',{
        install_dir => $ipsec_exporter::install_dir,
        flags       => $ipsec_exporter::service_flags,
      })
    }
    ~> service{ $ipsec_exporter::service_name:
      ensure => $ipsec_exporter::service_ensure,
      enable => $ipsec_exporter::service_enable,
    }
  }
}
