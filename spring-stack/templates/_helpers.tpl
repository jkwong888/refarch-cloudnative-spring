{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "eurekaUrl" -}}
{{- if .Values.eurekaServer.service.name -}}
http://{{ .Values.eurekaServer.service.name }}:{{ .Values.eurekaServer.service.port }}/eureka/
{{- else -}}
http://{{ .Release.Name }}-{{ .Chart.Name }}:{{ .Values.eurekaServer.service.port }}/eureka/
{{- end -}}
{{- end -}}

{{- define "zipkinUrl" -}}
{{- if .Values.zipkinServer.service.name -}}
http://{{ .Values.zipkinServer.service.name }}:{{ .Values.zipkinServer.service.port }}/
{{- else -}}
http://{{ .Release.Name }}-{{ .Chart.Name }}:{{ .Values.zipkinServer.service.port }}/
{{- end -}}
{{- end -}}
