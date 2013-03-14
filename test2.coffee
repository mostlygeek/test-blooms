bloem = require "bloem"
assert = require "assert"

# bloom filter, test w/ different sizes
kb = 2
bf = new bloem.Bloem(kb * 1024 * 8, 1)

i = 0
f = 0 # false positive count
s = Date.now()
while true
    i = i + 1
    item = "item-#{Math.random()}"

    if bf.has(item)
        f = f + 1
        console.log "False positive ##{f} at item: #{i}, error rate (#{f/i})"

    if f > 5
        break

    bf.add(item)

console.log "Test took: #{Date.now() - s}ms"
console.log "Filter size: #{bf.bitfield.buffer.toString('utf-8').length} bytes"
