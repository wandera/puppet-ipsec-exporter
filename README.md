# ipsec_exporter

This Puppet module installs [Prometheus IPSec exporter](https://github.com/dennisstritzke/ipsec_exporter) as a system service.

## Description

Once installed, the IPsec metrics are published to `http://localhost:9536/metrics`  by default. The port is configurable.

## Setup

### Setup Requirements

An IKE is required for the exporter to operate properly. Tested with Strongswan, refer to original project for what implementations are supported.

## Usage

The only required parameter is `version`.

```puppet
class {'ipsec_exporter':
  version => '0.3.1',
}
```

See REFERENCE.md for complete list of parameters.
