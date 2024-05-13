terraform init

export FASTLY_API_KEY="blarp"

terraform plan -out plan.out

terraform show -json plan.out | falco terraform test -I tests
