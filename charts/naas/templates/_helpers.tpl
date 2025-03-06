{{/*
Expand the name of the chart.
*/}}
{{- define "naas.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "naas.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "naas.labels" -}}
helm.sh/chart: {{ include "naas.chart" . }}
{{ include "naas.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "naas.selectorLabels" -}}
app.kubernetes.io/name: {{ include "naas.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}