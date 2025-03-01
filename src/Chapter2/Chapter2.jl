using Plots
using LaTeXStrings
using LinearAlgebra

"""
    Chap2_norm_of_signal(
	; 
	f::Function = x -> x^2, 
	N::Int64 = 20, 
	interval::Tuple{Float64, Float64} = (-5.0, 5.0), 
	func_string::String = "x^2", 
	p_range::Int64=20
	)

TBW
"""
function Chap2_norm_of_signal(
	; 
	f::Function = x -> x^2, 
	N::Int64 = 25, 
	interval::Tuple{Float64, Float64} = (-5.0, 5.0), 
	func_string::String = "x^2", 
	p_range::Int64=20
	)

	x = collect(range(interval[1], interval[2], length=N));
	y = f.(x)

	pow = collect(range(1, p_range, p_range))
	y_norm = [norm(y,i) for i = 1:p_range]
	y_norm = y_norm

	func_plot = plot(
		x,
		y,
		label = L"f(x) = %$func_string",
		xlabel = "x"
	)

	bars = plot(
		pow,
		y_norm,
		label = "Norm values",
		xlabel = "p-norm",
		seriestype = :bar,
	)

	p = plot(
		func_plot,
		bars,
		suptitle = "Function",
		layout = (1,2),
		lw = 3
	)

	return p
 
end

"""
    Chap2_raised_power_signal(
	; 
	f::Function = x -> x^2, 
	N::Int64 = 20, 
	interval::Tuple{Float64, Float64} = (-5.0, 5.0), 
	func_string::String = "x^2", 
	pow::Int64=20, 
	normalize::Bool = true
	)

TBW
"""
function Chap2_raised_power_signal(
	; 
	f::Function = x -> x^2, 
	N::Int64 = 20, 
	interval::Tuple{Float64, Float64} = (-5.0, 5.0), 
	func_string::String = "x^2", 
	pow::Int64=20, 
	normalize::Bool = true
	)

	x = collect(range(interval[1], interval[2], N))
	y = f.(x)
	if normalize
		y_max = maximum(y)
		y = y/y_max
	end

	p = plot(
		x, y, 
		xlabel = "x",
		ylabel = "y",
		lw = 3,
		legend = true,
		label = L"f(x) = %$func_string",
		legendfontsize = 18
		)

	for i = 2:pow
		y_raised = abs.(y).^i
		if normalize
			y_raised_max = maximum(y_raised)
			y_raised = y_raised/y_raised_max 
		end
		plot!(p,
			x,
			y_raised,
			lw = 3,
			label = false,
			color = "black"
			)
	end

	return p
end 