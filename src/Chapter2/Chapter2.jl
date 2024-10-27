module Chapter2

using Plots

export my_data, my_plot

function my_data(n)
    data = randn(n)
    return data
end
function my_plot(data)
    plt = plot(data, label="My data"; linewidth=1)
    return plt
end

end