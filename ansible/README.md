## Ansible Setup

1. Get your Lima SSH port:
```bash
   limactl show-ssh ansible-node1
```

2. Update `inventory.ini` with your username and port.

3. Run the playbook:
```bash
   ansible-playbook playbook.yaml -i inventory.ini
```
