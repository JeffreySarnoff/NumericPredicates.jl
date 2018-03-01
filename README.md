# NumericPredicates.jl
more is__(this) and paired not__(this)__

# Introduction

```julia
using NumericPredicates

inta =  1
intb = -2

floata = 0.25
floatb = -2.0
floatc = 3.75

isinteger.((inta, intb)) == (true, true)
isinteger.((floata, floatb, floatc)) == (false, true, false)

isfractional.((inta, intb)) == (false, false)
ismixed.((inta, intb)) == (false, false)

isfractional.((floata, floatb, floatc)) == (true, false, false)
ismixed.((floata, floatb, floatc)) == (false, false, true)
```
