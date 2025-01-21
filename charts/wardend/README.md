# wardend

![Version: 2.13.2](https://img.shields.io/badge/Version-2.13.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.5.4](https://img.shields.io/badge/AppVersion-v0.5.4-informational?style=flat-square)

A chart to deploy Wardend to Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| jlehtimaki | <joonas@wardenprotocol.org> | <https://github.com/jlehtimaki> |
| zavertiaev |  | <https://github.com/zavertiaev> |
| mikolajsobolewski |  | <https://github.com/mikolajsobolewski> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| cosmovisor.allowDownloadBinaries | bool | `true` |  |
| cosmovisor.enabled | bool | `false` |  |
| cosmovisor.restartAfterUpgrade | bool | `true` |  |
| cosmovisor.unsafeSkipBackup | bool | `true` |  |
| cosmovisor.version | string | `"v1.7.0"` |  |
| debug | string | `"false"` |  |
| echo.behindThreshold | int | `5` |  |
| echo.enabled | bool | `false` |  |
| echo.endpoints | string | `"http://localhost:26657"` |  |
| echo.image | string | `"ghcr.io/warden-protocol/echo"` |  |
| echo.imagePullPolicy | string | `"IfNotPresent"` |  |
| echo.imageTag | string | `"1.1.0"` |  |
| echo.peers | string | `""` |  |
| echo.port | int | `10010` |  |
| eipController.check | bool | `false` |  |
| eipController.enabled | bool | `false` |  |
| env | list | `[]` |  |
| evm.allowInsecureUnlock | bool | `true` |  |
| evm.allowUnprotectedTxs | bool | `false` |  |
| evm.api | string | `"eth,net,web3"` |  |
| evm.blockRangeCap | int | `10000` |  |
| evm.enableIndexer | bool | `false` |  |
| evm.evmTimeout | string | `"5s"` |  |
| evm.feehistoryCap | int | `100` |  |
| evm.filterCap | int | `200` |  |
| evm.gasCap | string | `"25000000"` |  |
| evm.httpIdleTimeout | string | `"2m0s"` |  |
| evm.httpTimeout | string | `"30s"` |  |
| evm.logsCap | int | `10000` |  |
| evm.maxOpenConnections | int | `10` |  |
| evm.metrics | bool | `true` |  |
| evm.rpc | bool | `true` |  |
| evm.txfeeCap | int | `1` |  |
| image | string | `"ghcr.io/warden-protocol/wardenprotocol/wardend"` |  |
| imagePullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` |  |
| imageTag | string | `"v0.4.2"` |  |
| keyringBackend | string | `"test"` |  |
| mnemonic | string | `""` | validator's mnemonic in secret (used in test purposes) |
| networkPolicy.enabled | bool | `true` |  |
| networkPolicy.metrics.namespaceSelector | object | `{}` |  |
| networkPolicy.metrics.podSelector | object | `{}` |  |
| networkPolicy.signer.namespaceSelector | object | `{}` |  |
| networkPolicy.signer.podSelector | object | `{}` |  |
| node.api.enabled | bool | `true` |  |
| node.api.swagger | bool | `false` |  |
| node.enabled | bool | `true` |  |
| node.externalSigner | bool | `false` |  |
| node.genesisSecretName | string | `""` |  |
| node.grpc.enabled | bool | `false` |  |
| node.home | string | `"/data/.warden"` |  |
| node.ingress.annotations | object | `{}` |  |
| node.ingress.class | string | `""` |  |
| node.ingress.enabled | bool | `false` |  |
| node.ingress.externalDNS | bool | `false` |  |
| node.ingress.host | string | `""` |  |
| node.ingress.pathType | string | `"ImplementationSpecific"` |  |
| node.livenessProbe.failureThreshold | int | `5` |  |
| node.livenessProbe.initialDelaySeconds | int | `30` |  |
| node.livenessProbe.path | string | `"/health"` |  |
| node.livenessProbe.periodSeconds | int | `10` |  |
| node.livenessProbe.port | string | `"rpc"` |  |
| node.livenessProbe.successThreshold | int | `1` |  |
| node.livenessProbe.timeoutSeconds | int | `3` |  |
| node.logLevel | string | `"info"` |  |
| node.mempool.broadcast | bool | `true` |  |
| node.mempool.maxTxs | int | `5000` |  |
| node.mempool.recheck | bool | `true` |  |
| node.mempool.recheckTimeout | string | `"1s"` |  |
| node.mempool.size | int | `5000` |  |
| node.mempool.type | string | `"nop"` |  |
| node.metrics.enabled | bool | `true` |  |
| node.minGasPrice | string | `"0award"` |  |
| node.mnemonicSecretName | string | `""` |  |
| node.moniker | string | `"mynode"` |  |
| node.name | string | `"node"` |  |
| node.nodeKeysSecretName | string | `""` |  |
| node.p2p.addrBookStrict | bool | `false` |  |
| node.p2p.enabled | bool | `true` |  |
| node.p2p.external | bool | `false` |  |
| node.p2p.externalAddress | string | `""` |  |
| node.p2p.externalDNS.domain | string | `""` |  |
| node.p2p.externalDNS.enabled | bool | `false` |  |
| node.p2p.maxInboundPeers | int | `40` |  |
| node.p2p.maxOutboundPeers | int | `10` |  |
| node.p2p.persistentPeers | string | `""` |  |
| node.p2p.pex | bool | `false` |  |
| node.p2p.privatePeerIds | string | `""` |  |
| node.p2p.seedMode | bool | `false` |  |
| node.p2p.seeds | string | `""` |  |
| node.p2p.serviceAnnotations | object | `{}` |  |
| node.p2p.serviceLoadBalancerClass | string | `"service.k8s.aws/nlb"` |  |
| node.p2p.trafficPolicy | string | `"Cluster"` |  |
| node.persistent.class | string | `""` |  |
| node.persistent.size | string | `"10Gi"` |  |
| node.pruning.mode | string | `"default"` |  |
| node.pruning.pruningInterval | string | `"0"` |  |
| node.pruning.pruningKeepRecent | string | `"0"` |  |
| node.ready | bool | `true` |  |
| node.replicaCount | int | `1` |  |
| node.resources | object | `{}` |  |
| node.rpc.enabled | bool | `true` |  |
| node.securityContext.runAsGroup | int | `1000` |  |
| node.securityContext.runAsNonRoot | bool | `true` |  |
| node.securityContext.runAsUser | int | `1000` |  |
| node.stateSync.snapshotInterval | int | `0` |  |
| node.stateSync.snapshotKeepRecent | int | `2` |  |
| node.statesync.enabled | bool | `false` |  |
| node.statesync.rpcServers | string | `""` |  |
| node.statesync.trustHash | string | `""` |  |
| node.statesync.trustHeight | int | `0` |  |
| node.statesync.trustPeriod | string | `"168h0m0s"` |  |
| nodeSelector | object | `{}` |  |
| oracle.enabled | bool | `false` |  |
| oracle.image | string | `"ghcr.io/skip-mev/slinky-sidecar"` |  |
| oracle.imageTag | string | `"v1.0.12"` |  |
| oracle.interval | string | `"5s"` |  |
| oracle.metricsEnabled | bool | `false` |  |
| oracle.priceTTL | string | `"10s"` |  |
| oracle.securityContext.runAsGroup | int | `65532` |  |
| oracle.securityContext.runAsNonRoot | bool | `true` |  |
| oracle.securityContext.runAsUser | int | `65532` |  |
| persistentVolumeClaimName | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podDisruptionBudget.enabled | bool | `false` |  |
| podDisruptionBudget.maxUnavailable | string | `""` |  |
| podDisruptionBudget.minAvailable | string | `""` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| scratch.genesisUrl | string | `""` |  |
| secretManager.enabled | bool | `false` |  |
| secretManager.secrets | list | `[]` |  |
| secretManager.serviceAccount.annotations | object | `{}` |  |
| secretManager.serviceAccount.create | bool | `false` |  |
| secretManager.serviceAccount.name | string | `""` |  |
| serviceAnnotations | object | `{}` |  |
| serviceMonitor.extraLabels | object | `{}` |  |
| snapshot | object | `{"url":"https://github.com/warden-protocol/snapshots/raw/main/devnet.tar.gz"}` | snapshot url if syncMethod is snapshot |
| syncMethod | string | `"scratch"` | syncmethod scratch or snapshot |
| tolerations | list | `[]` |  |
| topologySpreadConstraints.enabled | bool | `false` |  |
| topologySpreadConstraints.maxSkew | int | `1` |  |
| topologySpreadConstraints.topologyKey | string | `"kubernetes.io/hostname"` |  |
| topologySpreadConstraints.whenUnsatisfiable | string | `"DoNotSchedule"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
