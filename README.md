### Preparation

```
terraform init

export FASTLY_API_KEY="blarp"

terraform plan -out plan.out
```


### To Test
Run this to see tests pass
```
terraform show -json plan.out | falco terraform test -I tests
```
<img width="362" alt="Screenshot 2024-05-13 at 21 49 06" src="https://github.com/jamesw201/falco-issue/assets/4550757/413f429e-e8a4-4eb1-8ce2-5f409110e1ab">


Now uncomment line 5 of tests/default.test.vcl and comment line 6, rerun 
```
terraform plan -out plan.out
terraform show -json plan.out | falco terraform test -I tests
```

<img width="616" alt="Screenshot 2024-05-13 at 21 47 56" src="https://github.com/jamesw201/falco-issue/assets/4550757/5671ed9d-e4dd-4d4f-b701-5ace6a72f708">


