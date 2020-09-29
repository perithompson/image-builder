# Developing the Ansible for a Windows machine

Ansible doesn't run on Windows but can used to configure a remote Windows host.  For faster development you can create a VM and run Ansible against the Windows VM directly with out using packer.This document gives the high level steps to use Ansible from Linux machine.

## Set up Windows machine
Follow the documentation for configuring WinRm on the Windows machine: https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html#winrm-setup. Note the [ConfigureRemotingForAnsible.ps1](https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1) is for development only.  Refer to [Ansible WinRM documentation](https://docs.ansible.com/ansible/latest/user_guide/windows_winrm.html) for details for advance configuration.

After WinRM is installed you can edit or `/etc/ansible/hosts` file with the following:

```
[winhost]    
<windows ip>

[winhost:vars]
ansible_user=username
ansible_password=<your password>
ansible_connection=winrm
ansible_winrm_server_cert_validation=ignore
```

Then run: `ansible-playbook -vvv node_windows.yml --extra-vars "@example.vars.yml`
