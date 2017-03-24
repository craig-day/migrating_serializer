# Migrating Serializer [![Build Status](https://travis-ci.org/craig-day/migrating_serializer.png)](https://travis-ci.org/craig-day/migrating_serializer)

Convert YAML serialized columns to JSON by providing support for deserializing both JSON and YAML

## Install

```Bash
gem install migrating_serializer
```

## Usage

```Ruby
require 'migrating_serializer'

class User < ActiveRecord::Base
  serialize :custom_notes, MigratingSerializer
end
```

## Limitations

Because we will dump data as JSON all the time, we can only serialize things JSON expects.

The following classes are known working and tested:

- `String`
- `Array`
- `Hash`
- `Fixnum`
- `Float`
- `NilClass`
- `TrueClass`
- `FaleClass`

## Author
[Craig Day](https://github.com/craig-day)<br/>
craigday3@gmail.com<br/>
License: MIT<br/>
