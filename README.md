[![Build Status](https://travis-ci.org/Soliah/chef-timezone.svg)](https://travis-ci.org/Soliah/chef-timezone)

# chef-timezone

Set timezone using `tzdata`.

## Requirements

Only tested to be working on the following Ubuntu and Debian versions below, but may work on earlier versions too.

- Ubuntu 14.04
- Ubuntu 12.04
- Debian 8.2
- Debian 8.1
- Debian 8.0

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
