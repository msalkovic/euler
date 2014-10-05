#=
Since x + y, x - y, etc. have to be perfect squares, we can write:

x + y = a^2
x - y = b^2
x + z = c^2
x - z = d^2
y + z = e^2
y - z = f^2

and derive:

a^2 + b^2 = c^2 + d^2 = 2x
a^2 - b^2 = e^2 + f^2 = 2y
c^2 - d^2 = e^2 - f^2 = 2z

First part of the program passes through a number of squares
pairwise, calculates sum and difference of each pair, and maps
the sum (difference) to the pair that created it.

Second part loops through given maps and checks when all three
equations above are satisified.
=#

squares = [1:1000] .^ 2
square_sums = Dict{Int64,Array}()
square_diffs = Dict{Int64,Array}()

for i in [1:length(squares)]
    for j in [1:i - 1]
        sqi = squares[i]
        sqj = squares[j]
        s = sqi + sqj
        d = sqi - sqj

        if !(s % 2 == 0 && d % 2 ==0)
            continue
        end

        if haskey(square_sums, s)
            push!(square_sums[s], (sqi, sqj))
        else
            square_sums[s] = [(sqi, sqj)]
        end

        if haskey(square_diffs, d)
            push!(square_diffs[d], (sqi, sqj))
        else
            square_diffs[d] = [(sqi, sqj)]
        end
    end
end

for sum_key in keys(square_sums)
    pairs = square_sums[sum_key]
    for i in [1:length(pairs)]
        for j in [1:i - 1]
            aa, bb = pairs[i]
            cc, dd = pairs[j]
            if haskey(square_sums, aa - bb) && haskey(square_diffs, cc - dd)
                ee_ff_sums = square_sums[aa - bb]
                ee_ff_diffs = square_diffs[cc - dd]
                for p in ee_ff_sums
                    if p in ee_ff_diffs
                        x = div(aa + bb, 2)
                        y = div(aa - bb, 2)
                        z = div(cc - dd, 2)
                        sol = x + y + z
                        println("$x, $y, $z, $sol")
                    end
                end
            end
        end
    end
end

