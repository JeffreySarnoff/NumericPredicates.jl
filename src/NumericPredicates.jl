module NumericPredicates

import Base: IEEEFloat,
             iszero, isone,
             isinteger, iseven, isodd,
             isreal, isfinite, isinf, isnan, issubnormal

export negone, two, half,
       isnegone, istwo, ishalf,
       ispos, isneg, isnonneg, isnonpos,
       isfloat, isrational, iscomplex, iscomplexint, iscomplexfloat,
       isfractional, ismixed, isextended, nextint, prevint,
 
 using IEEEFloats
 
function nextint(x::T) where {T<:Union{Signed,Unsigned}}
     x === typemax(T) && throw(ErrorException("OverflowError($x)"))
     x += one(T)
     return x
end

function prevint(x::T) where {T<:Union{Signed,Unsigned}}
     x === typemin(T) && throw(ErrorException("UnderflowError($x)"))
     x -= one(T)
     return x
end

function nextint(x::T) where {T<:IEEEFloat}
     x = floor(x)
     x === floatintmax(T) && throw(ErrorException("OverflowError($x)"))
     x += one(T)
     return x
end

function prevint(x::T) where {T<:IEEEFloat}
     x = ceil(x)
     x === floatintmin(T) && throw(ErrorException("UnderflowError($x)"))
     x -= one(T)
     return x
end

function nextint(x::T) where {T<:Real}
     x = floor(x)
     z = x + one(T)
     z === x && throw(ErrorException("OverflowError($x)"))
     return z
end

function prevint(x::T) where {T<:Real}
     x = ceil(x)
     z = x - one(T)
     z === x && throw(ErrorException("UnderflowError($x)"))
     return z
end

isfractional(x::T) where {T<:Union{Signed,Unsigned}} = false
isfractional(x::T) where {T<:Real} = -one(T) < x < one(T)
ismixed(x::T) where {T<:Union{Signed,Unsigned}} = false
ismixed(x::T) where {T<:AbstractFloat} = abs(x) > one(T) && !isinteger(x)


     


end # module NumericPredicates
