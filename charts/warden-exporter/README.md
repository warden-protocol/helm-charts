# warden-exporter

![Version: 0.5.2](https://img.shields.io/badge/Version-0.5.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.6.1](https://img.shields.io/badge/AppVersion-1.6.1-informational?style=flat-square)

A Helm chart for Warden Exporter

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jlehtimaki | <joonas@wardenprotocol.org> | <https://github.com/jlehtimaki> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| containerSecurityContext.allowPrivilegeEscalation | bool | `false` |  |
| containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| containerSecurityContext.privileged | bool | `false` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/warden-protocol/warden-exporter"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| logLevel | string | `"info"` |  |
| nameOverride | string | `""` |  |
| networkPolicy.enabled | bool | `true` |  |
| networkPolicy.metrics.namespaceSelector | object | `{}` |  |
| networkPolicy.metrics.podSelector | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext.fsGroup | int | `65532` |  |
| podSecurityContext.runAsGroup | int | `65532` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.runAsUser | int | `65532` |  |
| podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secretManager.enabled | bool | `false` |  |
| secretManager.secrets | list | `[]` |  |
| secretManager.serviceAccount.annotations | object | `{}` |  |
| secretManager.serviceAccount.create | bool | `false` |  |
| secretManager.serviceAccount.name | string | `""` |  |
| service.port | int | `8081` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceMonitor.additionalLabels | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.interval | string | `"1m"` |  |
| serviceMonitor.metricRelabelings | list | `[]` |  |
| serviceMonitor.relabelings | list | `[]` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| serviceMonitor.targetLabels | list | `[]` |  |
| serviceMonitor.telemetryPath | string | `"/metrics"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
