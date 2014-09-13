function num_digits(n::Int64)
    int(floor(log10(n))) + 1
end

function fast_palin_check(n::Int64)
    mod(n, 10) == div(n, 10 ^ (num_digits(n) - 1))
end

function full_palin_check(n::Int64)
    nd = num_digits(n)
    digits = [mod(div(n, 10 ^ i), 10) for i in [0:nd - 1]]

    for i in [0:fld(nd, 2)]
        if digits[i + 1] != digits[nd - i]
            return false
        end
    end

    return true
end

function square_sum(from, to)
    acc = 0
    for i in from:to
        acc += i ^ 2
    end
    return acc
end

#=
function is_solution(n::Int64)
    max_range = int(floor(sqrt(n) - 1.0))
    ns = range(1, max_range)
    hi = length(ns)
    lo = hi - 1

    while true
        s = square_sum(lo, hi)
        if s == n
            return true
        elseif s > n
            hi -= 1
            lo = hi -1 
        elseif s < n
            if lo == 1
                return false
            else
                lo -= 1
            end
        end
    end
end

acc = 0
for i in [10:100000000]
    if fast_palin_check(i) && full_palin_check(i) && is_solution(i)
        acc += i
    end
end

# Note we skipped 5 = 2 ^ 2 + 1 ^ 2
println(acc + 5)
=#

max_range = int(floor(sqrt(10 ^ 8 / 2)))
solutions = Set{Int64}()

for i in 1:max_range
    for j in i+1:max_range
        s = square_sum(i, j)
        if s < 10 ^ 8 && fast_palin_check(s) && full_palin_check(s)
            push!(solutions, s)
        end
    end
end

println(sum(solutions))

