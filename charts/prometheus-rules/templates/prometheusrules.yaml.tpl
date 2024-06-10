{{- if .Values.rules }}
apiVersion: v1
kind: List
metadata:
  name: {{ template "prometheus-rules.fullname" . }}
  namespace: {{ template "prometheus-rules.namespace" . }}
items:
{{- range $prometheusRuleName, $prometheusRule := .Values.rules }}
  - apiVersion: monitoring.coreos.com/v1
    kind: PrometheusRule
    metadata:
      name: {{ template "prometheus-rules.fullname" $ }}-{{ $prometheusRuleName }}
      namespace: {{ template "prometheus-rules.namespace" $ }}
      labels:
        {{- include "prometheus-rules.labels" $ | nindent 8 }}
        {{- with $.Values.labels -}}
{{- toYaml . | nindent 8 -}}
        {{- end }}
    spec:
      groups:
{{ toYaml $prometheusRule.groups| indent 8 }}
{{- end }}
{{- end }}
