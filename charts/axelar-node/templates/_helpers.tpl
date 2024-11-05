{{/*
Expand the name of the chart.
*/}}
{{- define "axelar-node.name" -}}
{{ .Release.Name }}-{{ .Values.node.name }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "axelar-node.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "axelar-node.labels" -}}
helm.sh/chart: {{ include "axelar-node.chart" . }}
{{ include "axelar-node.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "axelar-node.selectorLabels" -}}
app.kubernetes.io/name: {{ include "axelar-node.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
