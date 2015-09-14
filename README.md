# PriorityQueue

A Heap implementation in crystal.

## Installation

Add it to `Projectfile`

```crystal
deps do
  github "hangyas/PriorityQueue"
end
```

## Usage

```crystal
require "PriorityQueue"

q = PriorityQueue{5, 2, 9}

q.pop #9
q.pop #5
q.pop #2

#custom priority
q = PriorityQueue(Int32).new {|a, b| a < b}
q << 5 << 2 << 9

q.pop #2
q.pop #5
q.pop #9
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/PriorityQueue/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- hangyas(https://github.com/hangyas) Krisztián Ádám - creator, maintainer
