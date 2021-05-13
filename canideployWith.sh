#!/usr/bin/env bash

if [ "$applications" = "" ]
then
  echo "ERROR: 'applications' is not specified."
  exit 1
fi

application_params=$(echo "$applications" | awk -F, '
  {
    for (i=1; i< NF+1; i++){
      gsub(/: */, " --", $i)
      print " --pacticipant " $i
    }
  }'
)

echo "Comparing applications: $applications"

eval """
docker run --rm \
 -e PACT_BROKER_BASE_URL=$pact_broker \
 -e PACT_BROKER_TOKEN=$pact_broker_token \
pactfoundation/pact-cli:latest \
broker can-i-deploy \
$application_params
"""