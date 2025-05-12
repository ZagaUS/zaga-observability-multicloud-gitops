{{/*
Expand the name of the chart.
*/}}
{{- define "kafka-srv-5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kafka-srv-5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}

{{- define "kafka-srv-5.fullname" -}}
{{- default .Values.nameOverride .Chart.Name }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "kafka-srv-5.labels" -}}
helm.sh/chart: {{ include "kafka-srv-5.chart" . }}
app.kubernetes.io/managed-by: {{ .Chart.Name }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{ include "kafka-srv-5.selectorLabels" . }}
app.kubernetes.io/instance: {{ .Chart.Name }}
app.openshift.io/runtime: {{ .Values.languageFramework }}

{{- end }}

{{/*
Selector labels
*/}}
{{- define "kafka-srv-5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kafka-srv-5.fullname" . }}
{{- end }}