
## How to use this repo ####

- Create a hcl file as shown under /example/f5nia.hcl
- provide token for terraform cloud Workspace area, token should be teams token
- provide consul HCP token 

## How to run the Consul terraform Sync to configure WAF policy and Tenant

- Copy terraform.tfvars.example file to terraform.tfvars and provide values
  
```
  cp terraform.tfvars.example terraform.tfvars

```

- Run CTS file

```
consul-terraform-sync -config-file=f5nia.hcl

```

- example output here

```
consul-terraform-sync -config-file=f5nia.hcl
2022-07-28T04:18:16.114Z [WARN]  config.task: the 'services' field in the task block is deprecated in v0.5.0 and will be removed in a future major version after v0.8.0.

Please replace 'services' in your task configuration with one of the options below:
 * condition "services": if there is _no_ preexisting condition block configured in your task
 * module_input "services": if there is a preexisting condition block configured in your task
.....

orkspace_name=AS3_8
2022-07-28T04:18:20.619Z [INFO]  driver.tfc: run results can be viewed at run URL: run_url=https://app.terraform.io/app/SCStest/workspaces/AS3_8/runs/run-uUkq7T7tyckAX4n7
2022-07-28T04:18:20.619Z [INFO]  driver.tfc: waiting on completion of run: run_id=run-uUkq7T7tyckAX4n7 workspace_name=AS3_8
2022-07-28T04:18:53.275Z [INFO]  driver.tfc: run completed: run_id=run-uUkq7T7tyckAX4n7 workspace_name=AS3_8
2022-07-28T04:18:53.275Z [INFO]  ctrl: task completed: task_name=AS3_8
2022-07-28T04:18:53.275Z [INFO]  ctrl: all tasks completed once
2022-07-28T04:18:53.275Z [INFO]  ctrl: start monitoring tasks

```
