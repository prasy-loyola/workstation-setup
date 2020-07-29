$target = "C:\Windows\System32\drivers\etc\hosts"
$ingress_details = $(kubectl get ingress -o json -A | ConvertFrom-Json)

foreach ($item in $ingress_details.items) {
    foreach ($rule in $item.spec.rules) {
        $rule_host = $rule.host
        $ip = $item.status.loadBalancer.ingress[0].ip
        (Get-Content $target) -notmatch "$rule_host" | Out-File $target
        "$ip $rule_host" >> $target
    }
}