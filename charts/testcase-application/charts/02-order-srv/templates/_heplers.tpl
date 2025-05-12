{{/*
Expand the name of the chart.
*/}}
{{- define "order-srv-2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "order-srv-2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "order-srv-2.fullname" -}}
{{- default .Values.nameOverride .Chart.Name }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "order-srv-2.labels" -}}
helm.sh/chart: {{ include "order-srv-2.chart" . }}
app.kubernetes.io/managed-by: {{ .Chart.Name }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{ include "order-srv-2.selectorLabels" . }}
app.kubernetes.io/instance: {{ .Chart.Name }}
app.openshift.io/runtime: {{ .Values.languageFramework }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "order-srv-2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "order-srv-2.fullname" . }}
{{- end }}