# ListLastPerfExperiment

A benchmark comparing between different implementations of `List.last/1`.

## Benchmark Results 9/19/2020 (add list_last_inline)

```
> env MIX_ENV=prod mix compile --force
Compiling 1 file (.ex)
Generated list_last_perf_experiment app
[20:23:39] elbow-jason@DESKTOP-CDAKR89 /home/elbow-jason/Workspace/elixirs/list_last_perf_experiment  
> env MIX_ENV=prod iex -S mix
Erlang/OTP 23 [erts-11.0.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Interactive Elixir (1.11.0-rc.0) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> ListLastPerfExperiment.bench 
Operating System: Linux
CPU Information: Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz
Number of Available Cores: 8
Available memory: 15.95 GB
Elixir 1.11.0-rc.0
Erlang 23.0.4

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
parallel: 1
inputs: 100k, 10k, 1h, 1k, eight, empty, five, one
Estimated total run time: 7.47 min

Benchmarking enum_reverse_hd with input 100k...
Benchmarking enum_reverse_hd with input 10k...
Benchmarking enum_reverse_hd with input 1h...
Benchmarking enum_reverse_hd with input 1k...
Benchmarking enum_reverse_hd with input eight...
Benchmarking enum_reverse_hd with input empty...
Benchmarking enum_reverse_hd with input five...
Benchmarking enum_reverse_hd with input one...
Benchmarking list_last8 with input 100k...
Benchmarking list_last8 with input 10k...
Benchmarking list_last8 with input 1h...
Benchmarking list_last8 with input 1k...
Benchmarking list_last8 with input eight...
Benchmarking list_last8 with input empty...
Benchmarking list_last8 with input five...
Benchmarking list_last8 with input one...
Benchmarking list_last_inline with input 100k...
Benchmarking list_last_inline with input 10k...
Benchmarking list_last_inline with input 1h...
Benchmarking list_last_inline with input 1k...
Benchmarking list_last_inline with input eight...
Benchmarking list_last_inline with input empty...
Benchmarking list_last_inline with input five...
Benchmarking list_last_inline with input one...
Benchmarking list_last_orig with input 100k...
Benchmarking list_last_orig with input 10k...
Benchmarking list_last_orig with input 1h...
Benchmarking list_last_orig with input 1k...
Benchmarking list_last_orig with input eight...
Benchmarking list_last_orig with input empty...
Benchmarking list_last_orig with input five...
Benchmarking list_last_orig with input one...

##### With input 100k #####
Name                       ips        average  deviation         median         99th %
list_last8              3.28 K      304.45 μs    ±21.71%      287.50 μs      509.12 μs
list_last_inline        3.05 K      327.44 μs    ±29.87%      296.50 μs      686.55 μs
enum_reverse_hd         2.75 K      363.35 μs    ±64.32%      238.40 μs      972.85 μs
list_last_orig          2.00 K      499.66 μs    ±18.10%      472.40 μs      756.32 μs

Comparison: 
list_last8              3.28 K
list_last_inline        3.05 K - 1.08x slower +22.99 μs
enum_reverse_hd         2.75 K - 1.19x slower +58.90 μs
list_last_orig          2.00 K - 1.64x slower +195.21 μs

Memory usage statistics:

Name                Memory usage
list_last8                   0 B
list_last_inline             0 B - 1.00x memory usage +0 B
enum_reverse_hd         945280 B - ∞ x memory usage +945280 B
list_last_orig               0 B - 1.00x memory usage +0 B

**All measurements for memory usage were the same**

##### With input 10k #####
Name                       ips        average  deviation         median         99th %
enum_reverse_hd        32.39 K       30.88 μs    ±58.34%       23.80 μs       92.30 μs
list_last_inline       29.20 K       34.25 μs    ±29.33%       31.40 μs       75.80 μs
list_last8             27.60 K       36.24 μs    ±24.78%       33.60 μs       76.90 μs
list_last_orig         19.95 K       50.13 μs    ±23.22%       46.30 μs      102.30 μs

Comparison: 
enum_reverse_hd        32.39 K
list_last_inline       29.20 K - 1.11x slower +3.37 μs
list_last8             27.60 K - 1.17x slower +5.36 μs
list_last_orig         19.95 K - 1.62x slower +19.25 μs

Memory usage statistics:

Name                Memory usage
enum_reverse_hd          69296 B
list_last_inline             0 B - 0.00x memory usage -69296 B
list_last8                   0 B - 0.00x memory usage -69296 B
list_last_orig               0 B - 0.00x memory usage -69296 B

**All measurements for memory usage were the same**

##### With input 1h #####
Name                       ips        average  deviation         median         99th %
list_last8              2.38 M      420.85 ns  ±6461.57%         300 ns        1600 ns
list_last_inline        2.06 M      485.90 ns  ±5683.92%         300 ns        2700 ns
enum_reverse_hd         1.81 M      552.66 ns ±10365.30%         200 ns        4500 ns
list_last_orig          1.65 M      604.75 ns   ±739.80%         400 ns        3000 ns

Comparison: 
list_last8              2.38 M
list_last_inline        2.06 M - 1.15x slower +65.05 ns
enum_reverse_hd         1.81 M - 1.31x slower +131.82 ns
list_last_orig          1.65 M - 1.44x slower +183.90 ns

Memory usage statistics:

Name                Memory usage
list_last8                   0 B
list_last_inline             0 B - 1.00x memory usage +0 B
enum_reverse_hd           1184 B - ∞ x memory usage +1184 B
list_last_orig               0 B - 1.00x memory usage +0 B

**All measurements for memory usage were the same**

##### With input 1k #####
Name                       ips        average  deviation         median         99th %
enum_reverse_hd       249.51 K        4.01 μs   ±576.67%        3.30 μs       18.80 μs
list_last8            240.01 K        4.17 μs   ±488.97%        3.70 μs       18.20 μs
list_last_inline      221.46 K        4.52 μs   ±385.36%        3.80 μs       18.70 μs
list_last_orig        190.76 K        5.24 μs   ±129.43%        4.40 μs       19.50 μs

Comparison: 
enum_reverse_hd       249.51 K
list_last8            240.01 K - 1.04x slower +0.159 μs
list_last_inline      221.46 K - 1.13x slower +0.51 μs
list_last_orig        190.76 K - 1.31x slower +1.23 μs

Memory usage statistics:

Name                Memory usage
enum_reverse_hd           4464 B
list_last8                   0 B - 0.00x memory usage -4464 B
list_last_inline             0 B - 0.00x memory usage -4464 B
list_last_orig               0 B - 0.00x memory usage -4464 B

**All measurements for memory usage were the same**

##### With input eight #####
Name                       ips        average  deviation         median         99th %
list_last_inline        6.68 M      149.68 ns ±16724.88%           0 ns         800 ns
list_last_orig          5.95 M      168.12 ns ±16902.48%           0 ns        1200 ns
list_last8              5.15 M      194.25 ns ±13139.03%         100 ns        1400 ns
enum_reverse_hd         4.44 M      225.36 ns ±13317.57%           0 ns         900 ns

Comparison: 
list_last_inline        6.68 M
list_last_orig          5.95 M - 1.12x slower +18.45 ns
list_last8              5.15 M - 1.30x slower +44.58 ns
enum_reverse_hd         4.44 M - 1.51x slower +75.69 ns

Memory usage statistics:

Name                Memory usage
list_last_inline             0 B
list_last_orig               0 B - 1.00x memory usage +0 B
list_last8                   0 B - 1.00x memory usage +0 B
enum_reverse_hd            128 B - ∞ x memory usage +128 B

**All measurements for memory usage were the same**

##### With input empty #####
Name                       ips        average  deviation         median         99th %
enum_reverse_hd         7.72 M      129.47 ns ±19409.34%           0 ns         700 ns
list_last8              7.38 M      135.45 ns ±19355.67%           0 ns         700 ns
list_last_orig          7.33 M      136.48 ns ±18681.42%           0 ns         700 ns
list_last_inline        7.30 M      136.93 ns ±19725.65%           0 ns         800 ns

Comparison: 
enum_reverse_hd         7.72 M
list_last8              7.38 M - 1.05x slower +5.98 ns
list_last_orig          7.33 M - 1.05x slower +7.01 ns
list_last_inline        7.30 M - 1.06x slower +7.46 ns

Memory usage statistics:

Name                Memory usage
enum_reverse_hd              0 B
list_last8                   0 B - 1.00x memory usage +0 B
list_last_orig               0 B - 1.00x memory usage +0 B
list_last_inline             0 B - 1.00x memory usage +0 B

**All measurements for memory usage were the same**

##### With input five #####
Name                       ips        average  deviation         median         99th %
list_last_inline        6.93 M      144.40 ns ±18109.81%           0 ns         800 ns
list_last_orig          6.44 M      155.35 ns ±16693.82%           0 ns         800 ns
enum_reverse_hd         6.42 M      155.85 ns  ±8805.94%           0 ns         900 ns
list_last8              6.27 M      159.51 ns ±20419.90%           0 ns         900 ns

Comparison: 
list_last_inline        6.93 M
list_last_orig          6.44 M - 1.08x slower +10.95 ns
enum_reverse_hd         6.42 M - 1.08x slower +11.46 ns
list_last8              6.27 M - 1.10x slower +15.11 ns

Memory usage statistics:

Name                Memory usage
list_last_inline             0 B
list_last_orig               0 B - 1.00x memory usage +0 B
enum_reverse_hd             80 B - ∞ x memory usage +80 B
list_last8                   0 B - 1.00x memory usage +0 B

**All measurements for memory usage were the same**

##### With input one #####
Name                       ips        average  deviation         median         99th %
list_last_orig          7.94 M      125.91 ns ±20541.78%           0 ns         700 ns
list_last_inline        7.35 M      136.10 ns ±19181.80%           0 ns         700 ns
list_last8              7.14 M      140.12 ns ±18593.44%           0 ns         800 ns
enum_reverse_hd         7.09 M      140.99 ns ±17614.63%           0 ns         800 ns

Comparison: 
list_last_orig          7.94 M
list_last_inline        7.35 M - 1.08x slower +10.19 ns
list_last8              7.14 M - 1.11x slower +14.21 ns
enum_reverse_hd         7.09 M - 1.12x slower +15.07 ns

Memory usage statistics:

Name                Memory usage
list_last_orig               0 B
list_last_inline             0 B - 1.00x memory usage +0 B
list_last8                   0 B - 1.00x memory usage +0 B
enum_reverse_hd              0 B - 1.00x memory usage +0 B

**All measurements for memory usage were the same**
:ok
iex(2)> 
```