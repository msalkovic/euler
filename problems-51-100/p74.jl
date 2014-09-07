function factorial(n)
    if n == 0 || n == 1
        return 1
    end

    n * factorial(n - 1)
end

function digit_factorial_sum(n)
    if n == 0
        return 0
    end

    factorial(mod(n, 10)) + digit_factorial_sum(div(n, 10))
end

function digit_factorial_chain(n)
    chain = [n]
    while true
        sum = digit_factorial_sum(chain[end])
        if in(sum, chain)
            return chain
        else
            push!(chain, sum)
        end
    end
end

solution = length(filter(x -> length(x) == 60,
                         map(digit_factorial_chain, [2:1000000])))
println(solution)


