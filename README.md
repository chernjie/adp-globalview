
# ADP GlobalView paycheck analyzer

Simple tool to download your PayCheck into a flat CSV file so you can use it on a Pivot Table

### Setup

1. create a new git directory `git init`
2. include this lib as submodule
```shell
git submodule add git@github.com:chernjie/adp-globalview.git lib
```
3. install dependencies
```shell
brew install jq node
npm install --global json2csv
```

## Usage

1. Go to your ADP GlobalView > `myPay`
2. Open "network" console and search for "overview"
3. Right click on "overview" > "Copy" > "Copy response"
4. Save the response into a file "overview.json"
5. Flatten overview.json into `data/overview.csv`
```shell
mkdir -p data
jq -f lib/jq/overview.jq overview.json | json2csv --output data/overview.csv
```

![Screenshot of network console](./screenshot.png)
