# blockchain-listener

![Version: 0.3.3](https://img.shields.io/badge/Version-0.3.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

A Helm chart for Kubernetes

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
| envFrom | string | `""` |  |
| extraEnv | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image | string | `"ghcr.io/open-custody/keychain-operators/blockchain-listener"` |  |
| imagePullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` |  |
| imageTag | string | `""` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"20m"` |  |
| resources.requests.memory | string | `"64Mi"` |  |
| secretManager.cmd | string | `"yarn blockchain-listener"` |  |
| secretManager.enabled | bool | `false` |  |
| secretManager.pullSecrets | list | `[]` |  |
| secretManager.secrets | list | `[]` |  |
| secretManager.serviceAccount.annotations | object | `{}` |  |
| secretManager.serviceAccount.create | bool | `false` |  |
| secretManager.serviceAccount.name | string | `""` |  |
| securityContext | object | `{}` |  |
| service.enabled | bool | `true` |  |
| service.port | int | `3000` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
