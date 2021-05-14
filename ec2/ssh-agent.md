# Jumping to internal server

```
eval `ssh-agent`
echo $SSH_AGENT_SOCK
ssh-add
ssh-add -l
# Jump SSH
ssh -J ec2-user@bastion ubuntu@internal
```

