{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{ .Release.Name }}-{{ .Values.name }}
{{- end }}

{{- define "name.short" -}}
{{ .Values.name }}
{{- end }}

Create chart name and version as used by the chart label.
*/}}
{{- define "release.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Service Annotations
*/}}
{{- define "serviceAnnotations" -}}
{{ .Values.serviceAnnotations |toYaml}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "labels" -}}
helm.sh/chart: {{ include "release.chart" . }}
{{ include "selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "selectorLabels" -}}
app.kubernetes.io/name: {{ .Release.Name }}-{{ .Values.name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "add1" -}}
  {{- add 1 . -}}
{{- end }}
