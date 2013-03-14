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

# output
#
# False positive #1 at item: 339, error rate (0.0029498525073746312)
# False positive #2 at item: 344, error rate (0.005813953488372093)
# False positive #3 at item: 487, error rate (0.006160164271047228)
# False positive #4 at item: 654, error rate (0.0061162079510703364)
# False positive #5 at item: 657, error rate (0.0076103500761035)
# False positive #6 at item: 709, error rate (0.00846262341325811)
# Test took: 46ms
# Filter size: 2048 bytes

