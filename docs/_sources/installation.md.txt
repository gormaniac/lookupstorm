# Installation

Install this package in Synapse by running the following Storm command:
```
pkg.load --raw https://raw.githubusercontent.com/gormaniac/lookupstorm/main/lookup-storm.json
```

Or, build and install this package locally (assumes you're in the root dir of the project):
```bash
python3 -m synapse.tools.genpkg --no-docs --push "<Cortex Telepath URL>" lookup-storm.yaml
```

A shortcut for the above using the makefile:
```bash
make build && make push CORTEX="<Cortex Telepath URL>"
```
