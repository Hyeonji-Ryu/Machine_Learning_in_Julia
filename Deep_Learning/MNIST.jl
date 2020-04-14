# MNIST 패키지에서 데이터 가져오기

Pkg.add("MNIST")
using MLDatasets
train_x, train_y = MNIST.traindata()
test_x,  test_y  = MNIST.testdata()


# train_y를 정답 레이블로 변경하는 함수

function making_one_hot_label(x, y)
    temp = x + 1
    temp_matrix = zeros(Int8, 1, y)
    temp_matrix[temp] = 1
    return(temp_matrix)
end

function making_one_hot_labels(y_train)
    t = making_one_hot_label.(y_train, 10)
    return (reduce(vcat, t))
end

# 데이터 전처리하기

train_x = reshape(train_x,784, 60000)
train_x=train_x'
t = making_one_hot_labels(train_y)
typeof(t), size(t)
