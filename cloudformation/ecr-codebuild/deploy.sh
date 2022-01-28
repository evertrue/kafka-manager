#!/bin/bash

echo -n "Enter ToolsAccount ProfileName for AWS Cli operations [evertruetools] > "
read ToolsAccountProfile

ToolsAccountProfile=${ToolsAccountProfile:-evertruetools}

StackName=et-kafka-manager
ECRRepositoryName=evertrue/et-kafka-manager
GitHubProjectName=kafka-manager

aws cloudformation deploy --stack-name $StackName --template-file ecr-codebuild.yaml --parameter-overrides ECRRepositoryName=$ECRRepositoryName GitHubProjectName=$GitHubProjectName --profile $ToolsAccountProfile
