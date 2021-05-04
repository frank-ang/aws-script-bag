# AWS IP Ranges

>> Doc https://docs.aws.amazon.com/general/latest/gr/aws-ip-ranges.html

>> Download https://ip-ranges.amazonaws.com/ip-ranges.json

## Example queries.

```bash
# CloudFront 
jq -r '.prefixes[] | select(.service=="CLOUDFRONT") | .ip_prefix' < ip-ranges.json

# Singapore Region
jq -r '.prefixes[] | select(.region=="ap-southeast-1") | .ip_prefix' < ip-ranges.json

# Singapore EC2
jq -r '.prefixes[] | select(.region=="ap-southeast-1" and .service=="EC2") | .ip_prefix' < ip-ranges.json

# Complex filter
jq '[.prefixes[] | select(.region=="ap-southeast-1")] - [.prefixes[] | select( (.service=="AMAZON") or (.service=="GLOBALACCELERATOR"))]' < ip-ranges.json
```

## Counts

Summaries
```bash
# List of regions (30 regions)
jq -r '.prefixes[] | .region' < ip-ranges.json | sort | uniq

# Total count of all unique prefixes (3338 prefixes)
jq -r '.prefixes[] | .ip_prefix' < ip-ranges.json | sort |uniq | wc -l

# List of services (19)
jq -r '.prefixes[] | .service' < ip-ranges.json | sort | uniq
```

Global Region
```bash
# List of services in GLOBAL region (9) 
jq -r '.prefixes[] | select(.region=="GLOBAL") | .service' < ip-ranges.json | sort |uniq 

# Total count of all unique prefixes in GLOBAL region (130)
jq -r '.prefixes[] | select(.region=="GLOBAL") | .ip_prefix' < ip-ranges.json | sort |uniq | wc -l

# Total count of all unique prefixes in GLOBAL region that are CLOUDFRONT service (74)
jq -r '.prefixes[] | select(.region=="GLOBAL" and .service=="CLOUDFRONT") | .service' < ip-ranges.json | sort |uniq 
```

Singapore Region
```bash
# Total count of all unique prefixes in SIN region (190)
jq -r '.prefixes[] | select(.region=="ap-southeast-1") | .ip_prefix' < ip-ranges.json | sort |uniq | wc -l

# List of services in SIN region (14) 
jq -r '.prefixes[] | select(.region=="ap-southeast-1") | .service' < ip-ranges.json | sort |uniq 

```

Advanced example
```bash
# All prefixes in Singapore or Global (130+190=320)
jq -r '.prefixes[] | select(.region=="ap-southeast-1" or .region=="GLOBAL") | .ip_prefix' < ip-ranges.json | sort |uniq | wc -l

jq '[.prefixes[] | select(.region=="ap-southeast-1" or .region=="GLOBAL")] - [.prefixes[] | select( (.service=="CHIME_MEETINGS") or (.service=="CHIME_VOICECONNECTOR") or (.service=="KINESIS_VIDEO_STREAMS"))]' < ip-ranges.json | sort | uniq | wc -l
```
