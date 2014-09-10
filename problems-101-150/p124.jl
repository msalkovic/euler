function create_sieve!(dim)
    sieve = zeros(Int64, dim)
    sieve[1] = 1 # One is not prime.

    n = 2
    while true
        for i in range(n + n, n, int(floor(dim / n - 1)))
            sieve[i] = n
        end

        next = -1
        for i in [(n + 1):dim]
            if sieve[i] == 0
                next = i
                break
            end
        end

        if next == -1
            return sieve
        else
            n = next
        end
    end
end

function prime_factors(sieve, n)
    if sieve[n] == 0 || n == 1
        return [n]
    else
        factors = Int64[]
        while n != 1
            if sieve[n] == 0
                push!(factors, n)
                return factors
            else
                push!(factors, sieve[n])
                n /= sieve[n]
            end
        end
    end
end

function radical(sieve, n)
    prod(Set{Int32}(prime_factors(sieve, n)))
end

function create_radicals!(sieve, dim)
    [radical(sieve, i) for i in [1:dim]]
end

s = create_sieve!(100000)
rads = [(radical(s, i), i) for i in [1:100000]]
sort!(rads)
println(rads[10000][end])

