# faucet

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

Faucet chart for Kubernetes deployment

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| zavertiaev |  |  |
| jlehtimaki |  |  |
| mikolajsobolewski |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| env | list | `[]` |  |
| envFrom | list | `[]` |  |
| fullnameOverride | string | `"faucet"` |  |
| image | string | `"ghcr.io/warden-protocol/wardenprotocol/faucet"` |  |
| imagePullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` |  |
| imageTag | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"kong"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `""` |  |
| nameOverride | string | `""` |  |
| networkPolicy.enabled | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secretManager.cmd | string | `"/usr/bin/faucet"` |  |
| secretManager.enabled | bool | `false` |  |
| secretManager.secrets | list | `[]` |  |
| secretManager.serviceAccount.annotations | object | `{}` |  |
| secretManager.serviceAccount.create | bool | `false` |  |
| secretManager.serviceAccount.name | string | `""` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.enabled | bool | `true` |  |
| service.ports[0].name | string | `"http"` |  |
| service.ports[0].port | int | `8081` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
