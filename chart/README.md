# hcloud-cluster

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.33.2](https://img.shields.io/badge/AppVersion-1.33.2-informational?style=flat-square)

Kubernetes cluster for Hetzner Cloud

**Homepage:** <https://github.com/cloudhippie/hcloud-cluster>

## Installing the Chart

```console
helm install hcloud-cluster oci://ghcr.io/cloudhippie/hcloud-cluster
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| tboerger | <thomas@cloudhippie.de> | <https://github.com/tboerger> |

## Source Code

* <https://github.com/cloudhippie/hcloud-cluster>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/cloudhippie/charts | calico-cni-proxy | 1.0.0 |
| oci://ghcr.io/cloudhippie/charts | hcloud-ccm-proxy | 1.1.0 |
| oci://ghcr.io/cloudhippie/charts | hcloud-csi-proxy | 1.0.1 |
| oci://ghcr.io/cloudhippie/charts | prom-crds-proxy | 1.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| calico-cni-proxy | object | `{"fullnameOverride":"calico-cni"}` | Values for calico-cniproxy dependency |
| cluster.cni | string | `"calico"` | Name of the used cni provider |
| cluster.containerd | string | `"1.7.26"` | Version of containerd installed |
| cluster.endpoint | string | `nil` | Address or domain for cluster endpoint |
| cluster.name | string | `nil` | Name of the cluster |
| cluster.podCidrs | list | `["10.1.0.0/16"]` | List of pod cidrs for the cluster |
| cluster.runc | string | `"1.2.5"` | Version of runc installed |
| cluster.sans | list | `[]` | List of cert SANs applied to API server |
| cluster.serviceCidrs | list | `["10.96.0.0/12"]` | List of service cidrs for the cluster |
| cluster.version | string | `nil` | Version of the Kubernetes components |
| cp.image | string | `"ubuntu-24.04"` | Instance image used for control plane |
| cp.instance | string | `"cx22"` | Instance type used for control plane |
| cp.regions | list | `["fsn1","nbg1","hel1"]` | Regions for the control plane |
| cp.replicas | int | `3` | Number of replicas for control plane |
| hcloud-ccm-proxy | object | `{"fullnameOverride":"hcloud-ccm","target":{"namespace":"kube-system","release":"hcloud-ccm"}}` | Values for hcloud-ccm-proxy dependency |
| hcloud-csi-proxy | object | `{"fullnameOverride":"hcloud-csi","target":{"namespace":"kube-system","release":"hcloud-csi"}}` | Values for hcloud-csi-proxy dependency |
| hcloud.ccm.enabled | bool | `true` | Enable Hetzner Cloud CCM sub-chart |
| hcloud.csi.enabled | bool | `true` | Enable Hetzner Cloud CSI sub-chart |
| hcloud.loadBalancer | object | `{"enabled":false}` | Load balancer configuration forHhetzner cluster |
| hcloud.network | object | `{"enabled":true}` | Network configuration for Hetzner cluster |
| hcloud.sshKeys | list | `["terraform"]` | List of integrated SSH keys |
| labels | object | `{}` | Define additional labels |
| oidc.adminGroup | string | `nil` | Override group name for cluster-admin mapping |
| oidc.client | string | `"kubernetes"` | Client used for OIDC authentication |
| oidc.enabled | bool | `true` | Enable authentication via OIDC |
| oidc.issuer | string | `"https://auth.cloudhippie.de/realms/console"` | Issuer used for OIDC authentication |
| prom-crds-proxy | object | `{"fullnameOverride":"prom-crds"}` | Values for prom-crds-proxy dependency |
| worker.image | string | `"ubuntu-24.04"` | Instance image used for workers |
| worker.instance | string | `"cx22"` | Instance type used for workers |
| worker.sets | list | `[{"domain":"fsn1","name":"fsn1","replicas":1},{"domain":"nbg1","name":"nbg1","replicas":1},{"domain":"hel1","name":"hel1","replicas":1}]` | List of deployment sets for workers |
