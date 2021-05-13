# pact-canideploywith-action

Checks if multiple applications are compatible, based either on _version_ (`version:`), or _latest tag_ (`latest:`).

The format is a comma-seperated list of:

```
<application name>:version <version number>
```
or
```
<application name>:latest <tag>
```

## Example
```yml
# (This just saves defining these multiple times for different pact jobs)
env:
  pact_broker: ${{ secrets.PACT_BROKER }}
  pact_broker_token: ${{ secrets.PACT_BROKER_TOKEN }}

jobs:
  pact-can-i-deploy-version:
    runs-on: ubuntu-latest
    steps:
      - uses: roycdiscovery/pact-canideploywith-action@v1.0
        env:
          applications: "provider-app:version 2.0,consumer-app-A:version 1.8,consumer-app-B:version 1.0"

  pact-can-i-deploy-upstream:
    runs-on: ubuntu-latest
    steps:
      - uses: roycdiscovery/pact-canideploywith-action@v1.0
        env:
          applications: "provider-app:latest test,consumer-app-A:latest prod"
```