# BPC-ICT1 ANON PROJECT 2021

## How to run
Insert host ip into inventory file
```shell
[anon]
some ip
```
After that just execute this command:
```shell
ansible-playbook -i inventory -u root -k deploy.yml
```
