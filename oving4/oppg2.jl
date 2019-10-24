function countingsortlength(A)
    output = Array{String, 1}(undef, 256)

    count = fill(0, 256)

    ans = Array{String, 1}(undef, size(A))

    for i in A
        count[length(i) + 1] += 1
    end 

    for i = 2:256
        count[i] += count[i-1]
    end

    for i in size(A, 1):-1:1
        output[count[length(A[i]) + 1]] = A[i]
        count[length(A[i]) + 1] -= 1
    end

    
    for i = 1:size(A, 1)
        ans[i] = output[i]
    end

    return ans

end



###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere! 

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test countingsortlength(["ccc", "bb", "a"]) == ["a", "bb", "ccc"]
    @test countingsortlength(["aaa", "bb", "c"]) == ["c", "bb", "aaa"]
    @test countingsortlength(["bb", "a", ""]) == ["", "a", "bb"] # Testen her sjekker om du kan sortere også med emtpy string
    @test countingsortlength(["bbbb", "aa", "aaaa", "ccc"]) == ["aa", "ccc", "bbbb", "aaaa"] # Fra oppgaven
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")