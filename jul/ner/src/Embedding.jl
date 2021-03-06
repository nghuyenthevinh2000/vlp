#=
    Build an embedding layer for NLP.
    phuonglh@gmail.com
    November 12, 2019
=#

using Flux

# Each embedding layer contains a matrix of all word vectors, 
# each column is the vector of the corresponding word index.
struct Embedding
    W
end

# Fine-tuned embedding layer
Embedding(W::Array{Float32,2}) = Embedding(params(W))
# Random embeddings layer
Embedding(vocabSize::Int, outputSize::Int) = Embedding(param(randn(outputSize, vocabSize)))

# overload call, so the object can be used as a function
# x is a word index or an array of word indices (1 <= x < vocabSize)
(f::Embedding)(x) = f.W[:, x]