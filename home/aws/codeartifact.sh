#!/usr/bin/env sh

export AWS_DEFAULT_REGION=eu-central-1
export AWS_CODEARTIFACT_DOMAIN=blueid
export AWS_CODEARTIFACT_DOMAIN_OWNER=964010022385
export AWS_CODEARTIFACT_PROFILE=$AWS_PROFILE
export AWS_CODEARTIFACT_USER=aws
export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain "$AWS_CODEARTIFACT_DOMAIN" --domain-owner "$AWS_CODEARTIFACT_DOMAIN_OWNER" --query authorizationToken --output text`
if [ -z "$CODEARTIFACT_AUTH_TOKEN" ]
then
  echo Unauthorized
  exit 1
else
  echo $CODEARTIFACT_AUTH_TOKEN
fi
