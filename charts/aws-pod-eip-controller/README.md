# aws-pod-eip-controller

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square)

kubernetes aws-pod-eip-controller

**Homepage:** <https://github.com/aws-samples/aws-pod-eip-controller>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jlehtimaki | <joonas@wardenprotocol.org> | <https://github.com/jlehtimaki> |
| zavertiaev |  | <https://github.com/zavertiaev> |
| mikolajsobolewski |  | <https://github.com/mikolajsobolewski> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clusterName | string | `""` |  |
| createServiceAccount | bool | `false` |  |
| image | string | `"ghcr.io/warden-protocol/aws-pod-eip-controller:main"` |  |
| logLevel | string | `"DEBUG"` |  |
| nodeSelector | object | `{}` |  |
| region | string | `""` |  |
| resyncPeriod | int | `0` |  |
| serviceAccountName | string | `""` |  |
| vpcID | string | `""` |  |
| watchNamespace | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
