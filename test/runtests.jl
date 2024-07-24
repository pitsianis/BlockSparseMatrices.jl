using BlockSparseMatrices
using Test
using SparseArrays

@testset "CSC->BSC and spmv" begin
    for i = 2:8
        n = prod(1:i)
        A = sprand(n, n, 0.1 / n)
        for j in 1:i
            @test sum(abs2, SparseMatrixCSC(SparseMatrixBSC(A, j, i)) - A) == 0
            v = rand(size(A, 2))
            @test SparseMatrixBSC(A, j, i) * v == A * v
        end
    end
end