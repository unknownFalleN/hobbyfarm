{{- define "custom-ca" -}}
{{- $altNames := list ( printf "%s.%s" "hobbyfarm-webhook" .Release.Namespace) ( printf "%s.%s.svc" "hobbyfarm-webhook" .Release.Namespace ) -}}
{{- $ca := genCA "hobbyfarm-webhook-ca" 3650 -}}
{{- $cert := genSignedCert "hobbyfarm-webhook" nil $altNames 3650 $ca -}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
ca: {{ $ca.Cert | b64enc }}
{{- end -}}
