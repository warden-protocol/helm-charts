{{/*
Expand the name of the chart.
*/}}
{{- define "node.name" -}}
{{ .Release.Name }}-{{ .Values.node.name }}
{{- end }}

{{- define "service.trafficPolicy" -}}
{{- default .Values.node.p2p.trafficPolicy }}
{{- end }}

{{- define "p2p.serviceAnnotations" -}}
{{- with .Values.node.p2p.serviceAnnotations }}
{{- range $key, $value := . }}
{{ $key}}: {{$value}}
{{- end}}
{{- end}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "release.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "node.labels" -}}
helm.sh/chart: {{ include "release.chart" . }}
{{ include "node.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "node.selectorLabels" -}}
app.kubernetes.io/name: {{ .Release.Name }}-{{ .Values.node.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
ExternalDNS Annotations
*/}}
{{- define "node.externalDNS" -}}
{{- if .Values.node.ingress.externalDNS }}
external-dns.alpha.kubernetes.io/hostname: "{{- if .Values.node.rpc.enabled }}rpc.{{ .Values.node.ingress.host }}{{- end }}{{- if .Values.node.p2p.enabled }},p2p.{{ .Values.node.ingress.host }}{{- end }}{{- if .Values.node.api.enabled }},api.{{ .Values.node.ingress.host }}{{- end }}"
{{- end }}
{{- end }}

{{/*
Ingress Annotations
*/}}
{{- define "node.ingressAnnotations" -}}
{{- with .Values.node.ingress.annotations }}
    {{- range $key, $value := . }}
    {{ $key }}: {{ $value }}
    {{- end }}
  {{- end }}
{{- end }}

{{/*
Service Annotations
*/}}
{{- define "node.serviceAnnotations" -}}
{{ .Values.serviceAnnotations |toYaml}}
{{- end }}
