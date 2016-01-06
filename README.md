[![Build Status](https://travis-ci.org/Soliah/chef-timezone.svg)](https://travis-ci.org/Soliah/chef-timezone)

# chef-timezone

Set timezone using `tzdata`.

## Requirements

Only tested on Ubuntu 14.04, but should work on earlier versions.

## Attributes

### timezone::default

Key                    | Type   | Default |Description
:----------------------|--------|---------|-------------------------------------------------
`["timezone"]["zone"]` | String | `UTC`   | The timezone to set. Eg. `Australia/Sydney`. This value will be used as your `/etc/timezone` and the corresponding zoneinfo file will be symlinked to your `/etc/localtime`.

## Usage

Just include `timezone` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[timezone]"
  ]
}
```
