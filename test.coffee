bloem = require "bloem"
assert = require "assert"

max = 10000
bf = new bloem.Bloem(1024 * 8, 2)
empty = bf.bitfield.buffer.toString('utf-8')
bf.add("test#{i}") for i in [0..max]

errors = 0
falseP = 0
for i in [0..max]
    errors += 1 unless bf.has("test#{i}")

for i in [(max + 1)..(max * 2)]
    falseP += 1 if bf.has("test#{i}")

encoded = bf.bitfield.buffer.toString('utf-8')
falsePRate = (falseP/max)
console.log "Err: #{errors}, false positives, #{falseP} (#{falsePRate})"
console.log "empty size: #{empty.length} bytes, full: #{encoded.length} bytes"

#console.log encoded, "#{encoded.length}bytes"


