# Hash #dig
h = { top: { deepper: { too_deep: 12 } } }
puts h.dig(:top, :deepper, :too_deep)
puts h.dig(:top, :midle, :deep)
