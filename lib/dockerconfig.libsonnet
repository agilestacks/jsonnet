local gce = {
  "asia.gcr.io": "gcr",
  "eu.gcr.io": "gcr",
  "gcr.io": "gcr",
  "staging-k8s.gcr.io": "gcr",
  "us.gcr.io": "gcr"
};

local accountId = std.extVar('AWS_ACCOUNT_ID');
local aws = if accountId != "" then {
  [accountId + ".dkr.ecr.us-west-1.amazonaws.com"]: "ecr-login",
  [accountId + ".dkr.ecr.us-west-2.amazonaws.com"]: "ecr-login",
  [accountId + ".dkr.ecr.us-east-1.amazonaws.com"]: "ecr-login",
  [accountId + ".dkr.ecr.us-east-2.amazonaws.com"]: "ecr-login",
  [accountId + ".dkr.ecr.eu-west-1.amazonaws.com"]: "ecr-login",
  [accountId + ".dkr.ecr.eu-central-1.amazonaws.com"]: "ecr-login",
} else {};

aws + gce
