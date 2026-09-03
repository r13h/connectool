{{- define "connectool.name" -}}
connectool
{{- end }}

{{- define "connectool.labels" -}}
app.kubernetes.io/name: {{ include "connectool.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | quote }}
access.connectool.io/relationship: controlled-cluster
access.connectool.io/owner: {{ .Values.cluster.owner | quote }}
{{- end }}
