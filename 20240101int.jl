### A Pluto.jl notebook ###
# v0.19.32

#> [frontmatter]
#> title = "integer problems"
#> tags = ["math "]
#> description = "math"
#> 
#>     [[frontmatter.author]]
#>     name = "Dan SHimizu"

using Markdown
using InteractiveUtils

# ╔═╡ b7bca3e6-a85b-11ee-105c-8f2ca85906f8
begin
	using PlutoUI
	TableOfContents(title="もくじ 📚")
end

# ╔═╡ 0c042e10-f055-4ef8-bba3-f3182eea747b
md"""
# 整数問題をJuliaを用いて解く

## はじめに

これは2023年12月に私の勤務校で行われた中学3年生の数学の冬期講習会の問題を`julia`の`pluto.jl`パッケージで構成したものです。分野は整数となります。Juliaのコードについては，ChatGPT4の提案をベースにしています。

今回使用した[Julia Math Code Helper
](https://chat.openai.com/g/g-pDU1QRKy5-julia-math-code-helper)は私が作成したMyGPTです。



これらのページを`**.jl`のファイル形式でダウンロードして，ローカルの`julia`で実行できます。

+ [juliaのインストール](https://julialang.org/downloads/)

+ [pluto.jlの説明](https://zenn.dev/hctaw_srp/articles/ab26550eea5f8c)



__清水　団　[@dannchu](https://twitter.com/dannchu)__


"""

# ╔═╡ 0661a124-a1c3-4234-a619-1dfb2e9cff74
md"""
## Day 1

(1) $x^2-3xy+2y^2=12$ を満たす自然数 $x$ ， $y$ の組をすべて求めよ。

(2) $x^2-3xy+3y^2=13$ を満たす自然数 $x$ ， $y$ の組をすべて求めよ。

"""

# ╔═╡ acbf3f5e-3a8e-42bc-8ff5-8bec35ca514c
let
 	[(x,y) for x = 1:100, y=1:100 if x^2 - 3x*y + 2y^2 == 12]
end

# ╔═╡ 5fb7e083-f1bf-4e13-b436-6369c0dfb977
let
	[(x,y) for x = 1:100, y=1:100 if x^2 - 3x*y + 3y^2 == 13]
end

# ╔═╡ c07386a2-c54e-4281-8ec6-31676697cd34
md"""

**コメント**

 $x$ ， $y$ を1~100の範囲で調べた。この範囲で大丈夫という保証はないので，その部分を考える必要がある。
"""

# ╔═╡ 3f3990ac-a9a6-499b-ae27-f5acbee7ee4e
md"""
## Day 2

(1) $\dfrac1p+\dfrac1q+\dfrac1r=\dfrac43$ を満たす自然数 $p,\,q,\,r$（ $p\leqq q\leqq r$ ）の組をすべて求めよ。

(2) $a+b+c+d+e=abcde$ を満たす自然数 $a$ ， $b$ ， $c$ ， $d$ ， $e$ の組は何組あるか。

"""

# ╔═╡ d6c96cb7-e91e-4774-b2e1-b3c39e081660
let
	[(p,q,r) for p = 1:100, q = 1:100 , r = 1:100 if 1//p + 1//q + 1//r == 4//3 && p ≤ q ≤ r]
end

# ╔═╡ d4a01288-f146-4ba8-b939-37df52ed7830
let
	[(a,b,c,d,e) for a = 1:10, b = 1:10 , c = 1:10 , d = 1:10 , e = 1:10 if a+b+c+d+e == a*b*c*d*e] |> length
end

# ╔═╡ 9aea1fb6-e773-47b8-8d7c-09724155ab81
md"""

**コメント**

これも求める数の範囲を限定して考えている。この範囲で大丈夫という保証はないので，その部分を考える必要がある。
"""

# ╔═╡ c398b8b1-e0df-4916-9448-0ea3a24feb5d
md"""

## Day 3
　 $p^2+q^2=r^2$ （$p$，$q$，$r$は自然数）となる $p$，$q$，$r$ について，

(1) $pqr$は3の倍数であることを証明せよ。

(2) $pqr$は4の倍数であることを証明せよ。

(3) $pqr$は5の倍数であることを証明せよ。


"""

# ╔═╡ 56b4ca7b-a53b-49ef-b1ea-a2a247afa3fa
let
	function is_multiple_of_60(m, n)
	    if m > n
	        p = m^2 - n^2
	        q = 2 * m * n
	        r = m^2 + n^2
	        product = p * q * r
	        return product % 60 == 0
	    else
	        return "m must be greater than n"
	    end
	end

	for m = 1:10, n = 1:m-1
			p = m^2 - n^2
	    	q = 2 * m * n
	    	r = m^2 + n^2
			println("(p,q,r)=(", p,",",q,",",r,")," ,is_multiple_of_60(m, n))
	end
end

# ╔═╡ ff3a423a-3794-4640-b840-f6d3f6e4f9a4
md"""

**コメント**

ピタゴラス数を生成してチェックした。
"""

# ╔═╡ b5e7dfeb-7358-45b4-832e-37278ca2d55c
md"""

## Day 4
　
 3つの2進法の数がある。
    

- 　$10011111101111110001$

- 　$111111...11$（1が$2n$個並んでいる。)

- 　$101010...10$（10が$n$個並んでいる。）


    
(1) この3つの数を2で割った余りを求めよ。

(2) この3つの数を3で割った余りを求めよ。



"""

# ╔═╡ e53140d7-f096-4a08-9d34-a3bb5a1d6ede
let
	binary_string = "10011111101111110001"
	decimal_number = parse(Int64, binary_string, base = 2)
	decimal_number % 2,decimal_number % 3
end

# ╔═╡ 63324b4f-c300-4c31-9526-b1a795403313
let
	function mod_three_of_binary_ones(n)
    	number = 2^(2*n) - 1
    	return number % 2
	end
	A = Int[]
	for i = 1:10
		push!(A,mod_three_of_binary_ones(i))
	end
	A
end

		

# ╔═╡ 09a8b952-b517-4959-bdcd-5263b128b1e9
let
	function mod_three_of_binary_ones(n)
    	number = 2^(2*n) - 1
    	return number % 3
	end
	A = Int[]
	for i = 1:10
		push!(A,mod_three_of_binary_ones(i))
	end
	A
end

# ╔═╡ e48b05a2-e132-4d15-a644-bd6f237ea47d
let
	function sum_alternating_binary(n)
		number = (1 - 4^n) ÷ -3
    	return number % 2
	end
	A = Int[]
	for i = 1:10
		push!(A,sum_alternating_binary(i))
	end
	A
end


# ╔═╡ d4aecacc-5526-4de8-ba25-63078b00a834
let
	function sum_alternating_binary(n)
		number = (1 - 4^n) ÷ -3
    	return number % 3
	end
	A = Int[]
	for i = 1:10
		push!(A,sum_alternating_binary(i))
	end
	A
end

# ╔═╡ bd0e3b54-a9d2-4007-9fad-67a170ac1c14
md"""

**コメント**

(2)(3)で周期などが見えますね。
"""

# ╔═╡ b25b7883-7355-4dce-9737-9dae5eec34c6
md"""

## Day 5

　$n$を100以下の自然数とします。
    
(1) 　$5n-2$と$3n+1$が互いに素となるような$n$は何個ですか？

(2) 　$n^5+5$と$n^3+3$が互いに素となるような$n$は何個ですか？


"""

# ╔═╡ e246bcb0-6730-4df5-92e4-70357114b4ab
let

function count_coprime_pairs(n_max)
    count = 0
    for n in 1:n_max
        if gcd(5*n - 2, 3*n + 1) == 1
            count += 1
        end
    end
    return count
end

# 例として、nが1から100までの範囲でこの条件を満たすnの個数を求めます
n_max = 100
count_coprime_pairs(n_max)
end


# ╔═╡ 70bbd580-0343-4ca9-9286-7807e0bc91e3
let

function count_coprime_pairs(n_max)
    count = 0
    for n in 1:n_max
        if gcd(n^5 + 5, n^3 + 3) == 1
            count += 1
        end
    end
    return count
end

# 例として、nが1から100までの範囲でこの条件を満たすnの個数を求めます
n_max = 100
count_coprime_pairs(n_max)
end

# ╔═╡ d39f0b85-1701-4200-bdf1-1574ad9c3340
md"""

**コメント**

範囲が決まっている問題は得意だよね。
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.54"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "3c61004d0ad425a97856dfe604920e9ff261614a"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "793501dcd3fa7ce8d375a2c878dca2296232686e"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.2.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.2"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "bd7c69c7f7173097e7b5e1be07cee2b8b7447f51"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.54"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "03b4c25b43cb84cee5c90aa9b5ea0a78fd848d2f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00805cd429dcb4870060ff49ef443486c262e38e"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╠═b7bca3e6-a85b-11ee-105c-8f2ca85906f8
# ╟─0c042e10-f055-4ef8-bba3-f3182eea747b
# ╟─0661a124-a1c3-4234-a619-1dfb2e9cff74
# ╠═acbf3f5e-3a8e-42bc-8ff5-8bec35ca514c
# ╠═5fb7e083-f1bf-4e13-b436-6369c0dfb977
# ╟─c07386a2-c54e-4281-8ec6-31676697cd34
# ╟─3f3990ac-a9a6-499b-ae27-f5acbee7ee4e
# ╠═d6c96cb7-e91e-4774-b2e1-b3c39e081660
# ╠═d4a01288-f146-4ba8-b939-37df52ed7830
# ╟─9aea1fb6-e773-47b8-8d7c-09724155ab81
# ╟─c398b8b1-e0df-4916-9448-0ea3a24feb5d
# ╠═56b4ca7b-a53b-49ef-b1ea-a2a247afa3fa
# ╟─ff3a423a-3794-4640-b840-f6d3f6e4f9a4
# ╟─b5e7dfeb-7358-45b4-832e-37278ca2d55c
# ╠═e53140d7-f096-4a08-9d34-a3bb5a1d6ede
# ╠═63324b4f-c300-4c31-9526-b1a795403313
# ╠═09a8b952-b517-4959-bdcd-5263b128b1e9
# ╠═e48b05a2-e132-4d15-a644-bd6f237ea47d
# ╠═d4aecacc-5526-4de8-ba25-63078b00a834
# ╟─bd0e3b54-a9d2-4007-9fad-67a170ac1c14
# ╟─b25b7883-7355-4dce-9737-9dae5eec34c6
# ╠═e246bcb0-6730-4df5-92e4-70357114b4ab
# ╠═70bbd580-0343-4ca9-9286-7807e0bc91e3
# ╟─d39f0b85-1701-4200-bdf1-1574ad9c3340
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
