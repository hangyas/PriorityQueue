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

#custom order
q = PriorityQueue(Int32).new {|a, b| a < b}
q << 5 << 2 << 9

q.pop #2
q.pop #5
q.pop #9
```
