function countingsortletters(A, position)
    output = Array{String, 1}(undef, 256)

    #count = Array{Int, 1}(undef, 256)
    count = fill(0, 256)

    ans = Array{String, 1}(undef, size(A))

    for i in A
        count[chartodigit(i[position])] += 1
    end 

    for i = 2:26
        count[i] += count[i-1]
    end

    for i in size(A, 1):-1:1
        output[count[chartodigit(A[i][position])]] = A[i]
        count[chartodigit(A[i][position])] -= 1
    end

    
    for i = 1:size(A, 1)
        ans[i] = output[i]
    end

    return ans

end


function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.

    return character - '`'
end

#countingsortletters(["aa", "bb", "cc"], 1)
println(countingsortletters(["ab", "ba", "aa", "bb"], 2))


#=

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test countingsortletters(["aa", "bb", "cc"], 1) == ["aa", "bb", "cc"]
    @test countingsortletters(["cc", "bb", "aa"], 2) == ["aa", "bb", "cc"]
    @test countingsortletters(["ac", "bb", "ca"], 2) == ["ca", "bb", "ac"]
    @test countingsortletters(["ccc", "cba", "ca", "ab", "abc"], 2) == ["ca", "cba", "ab", "abc", "ccc"]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")

=#