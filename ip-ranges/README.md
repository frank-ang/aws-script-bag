# AWS IP Ranges

Download https://ip-ranges.amazonaws.com/ip-ranges.json

Example queries.

```bash
jq '.prefixes[] | select(.region=="ap-southeast-1")' < ip-ranges.json

jq '.prefixes[] | select(.service=="CLOUDFRONT")' < ip-ranges.json


jq '[.prefixes[] | select(.region=="ap-southeast-1")] - [.prefixes[] | select( (.service=="AMAZON") or (.service=="GLOBALACCELERATOR"))]' < ip-ranges.json

jq -r '.prefixes[] | select(.region=="ap-southeast-1" and .service=="EC2") | .ip_prefix' < ip-ranges.json
```

