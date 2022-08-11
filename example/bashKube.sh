#!/usr/bin/env bash

function help
{
  printf "Usage: $0 [OPTIONS] [PROFILE]\n\n"
  printf "  OPTIONS is none(Default:-s) or any of:\n\n"
  printf " --shell | -s : bash shell (DEFAULT)\n"
  printf " --psql | -p : psql cli\n\n\n"
  printf "  PROFILE is none(Default:a2a-admin-dev) or any of:\n\n"
  printf " a2a-admin-dev : https://admin-stg.a2a.apollo-ai.io (DEFAULT)\n"
  printf " a2a-admin-test : https://admin-dev.a2a.apollo-ai.io:444\n"
  printf " a2a-admin-prd : https://admin.a2a.apollo-ai.io\n"

  exit 1
}

PROFILE="a2a-admin-dev"
SERVICE=shell

while [ $# -gt 0 ]; do
  case "$1" in
    --shell|-s)
      SERVICE=shell
      shift
      if [ $# -gt 1 ] ; then
        PROFILE=$@
      fi
      ;;
    --psql|-p)
      SERVICE=psql
      shift
      if [ $# -gt 1 ] ; then
        PROFILE=$@
      fi
      ;;
    --help|-h)
      HELP=_help
      shift
      help
      ;;
    * )
      PROFILE=$@
      shift
      ;;
  esac
done

echo "current PROFILE is "$PROFILE

## login AWS EKS and get psql_command
case $PROFILE in
  "a2a-admin-dev")
      aws eks --region ap-northeast-2 update-kubeconfig --name eks-cluster-apolloa2a-dev
      kubectl config use arn:aws:eks:ap-northeast-2:105614085552:cluster/eks-cluster-apolloa2a-dev
      PSQL="PGPASSWORD='a2a_admin!rds@password#' psql -h rds-apolloa2a-dev-aurora-postgresql.cluster-cylz6dnpe3ou.ap-northeast-2.rds.amazonaws.com -U a2a_admin -d apollo_a2a"
  ;;
  "a2a-admin-test")
      aws eks --region ap-northeast-2 update-kubeconfig --name eks-cluster-apolloa2a-dev
      kubectl config use arn:aws:eks:ap-northeast-2:105614085552:cluster/eks-cluster-apolloa2a-dev
      PSQL="PGPASSWORD='a2a_admin!rds@password#' psql -h rds-apolloa2a-test-aurora-postgresql.cluster-cylz6dnpe3ou.ap-northeast-2.rds.amazonaws.com -U a2a_admin -d apollo_a2a"
  ;;
  "a2a-admin-prd")
      aws eks --region ap-northeast-2 update-kubeconfig --name eks-cluster-apolloa2a-prd
      kubectl config use arn:aws:eks:ap-northeast-2:053961833507:cluster/eks-cluster-apolloa2a-prd
      PSQL="PGPASSWORD='a2a_admin!rds@password#' psql -h rds-apolloa2a-prd-postgresql.ctcv39cnkgmd.ap-northeast-2.rds.amazonaws.com -U a2a_admin -d apollo_a2a"
  ;;
esac

## get POD name
POD=`kubectl get pods -n $PROFILE | sed -n '/^qfeed-admin/p' | awk '{print $1}'>&1`

if [[ $POD == "" ]] ; then
    echo "You must be logged in https://sktelecomcloud.awsapps.com/start#/"
    exit 1
fi

## exec
case $SERVICE in
   "shell")
      echo "bash shell mode"
      kubectl exec --stdin --tty $POD -n $PROFILE -- /bin/bash
      ;;
   "psql")
      echo "psql mode"
      expect -c "
         set timeout 5
         spawn kubectl exec --stdin --tty $POD -n $PROFILE -- /bin/bash
         expect \"/opt/qfeed-admin$ \"
            send \"${PSQL}\n\"
         interact
      "
      ;;
esac
