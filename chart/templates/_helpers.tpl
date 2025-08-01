{{/*
Name of the cluster, falls back to fullname
*/}}
{{- define "hcloud-cluster.clusterName" -}}
{{ default (include "hcloud-cluster.fullname" .) .Values.cluster.name }}
{{- end -}}

{{/*
Group name from OIDC mapped to cluster-admin
*/}}
{{- define "hcloud-cluster.oidcAdminGroup" -}}
{{- if .Values.oidc.adminGroup -}}
{{- .Values.oidc.adminGroup -}}
{{- else -}}
{{- printf "cluster-%s" (include "hcloud-cluster.clusterName" .) -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hcloud-cluster.fullname" -}}
{{- if contains .Chart.Name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hcloud-cluster.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create basic labels
*/}}
{{- define "hcloud-cluster.labels" -}}
helm.sh/chart: "{{ include "hcloud-cluster.chart" . }}"
app.kubernetes.io/name: "{{ include "hcloud-cluster.fullname" . }}"
app.kubernetes.io/instance: "{{ .Release.Name }}"
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- with .Values.labels }}
{{ toYaml . }}
{{- end }}
{{- end -}}
