MD5
================
Danielito

# MD5 check sum

In document will be comparing the provided MD5 with a new MD5 output

created for all fastq.gz files.

## Loading libraries

``` r
library(tidyverse)
```

    ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ✔ ggplot2 3.4.0          ✔ purrr   1.0.1     
    ✔ tibble  3.1.8          ✔ dplyr   1.1.0.9000
    ✔ tidyr   1.3.0          ✔ stringr 1.5.0     
    ✔ readr   2.1.3          ✔ forcats 0.5.2     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()

## Loading data

``` r
provided_md5 <- read.csv(file = "AppleIntegrity.md5", header = F,
                         sep = "=")
provided_md5
```

                                             V1                                V2
    1         MD5 (15-22_L001_R1_001.fastq.gz)   f53a0d985c9835e611fc5e7b9ecf03a3
    2         MD5 (15-22_L001_R2_001.fastq.gz)   c5eae0f28ac3e0c60ae558c03e43c163
    3         MD5 (15-22_L002_R1_001.fastq.gz)   96150869f9ce03193176a53dd584809b
    4         MD5 (15-22_L002_R2_001.fastq.gz)   b4bb807dfa5edab32d9dbebabcc1c45e
    5          MD5 (1664_L001_R1_001.fastq.gz)   ff32a5f53e321e33f124e98020715edd
    6          MD5 (1664_L001_R2_001.fastq.gz)   402be604c49c5792f51b0adcf150d398
    7          MD5 (1664_L002_R1_001.fastq.gz)   3fda4a4bb2a148b453ddca0dc00430ab
    8          MD5 (1664_L002_R2_001.fastq.gz)   df6814c3de83203f0c097032e20330dd
    9          MD5 (1947_L001_R1_001.fastq.gz)   10c0d23680fd05efd7061bb66f36aa2d
    10         MD5 (1947_L001_R2_001.fastq.gz)   f32d1ac7a92644d669d560a8357932ab
    11         MD5 (1947_L002_R1_001.fastq.gz)   12c62f451984310848b665d117724e8c
    12         MD5 (1947_L002_R2_001.fastq.gz)   7fb211f8e454ed09301e42f68d3cbc6e
    13         MD5 (c306_L001_R1_001.fastq.gz)   9a93e105d53bee61573eb4ac263c3bae
    14         MD5 (c306_L001_R2_001.fastq.gz)   190afe1526944e904b8a6be2dea31e08
    15         MD5 (c306_L002_R1_001.fastq.gz)   422f65cc7b19bcdc72205a013b8323fa
    16         MD5 (c306_L002_R2_001.fastq.gz)   056038ce48849a87210199b2b0930aa8
    17         MD5 (c450_L001_R1_001.fastq.gz)   22cc445cbde24858543b1b036faaf172
    18         MD5 (c450_L001_R2_001.fastq.gz)   074abc3125dc9a6fbaa0b3c9d1712392
    19         MD5 (c450_L002_R1_001.fastq.gz)   baeb7e4796a39c67e0202f89e0905ab9
    20         MD5 (c450_L002_R2_001.fastq.gz)   43b6e6b90f108a6e5926504d5b6ca394
    21         MD5 (c477_L001_R1_001.fastq.gz)   d06092303a976c86b7ec325ba21cb3fc
    22         MD5 (c477_L001_R2_001.fastq.gz)   9756e93d1c175a939197312b32798c16
    23         MD5 (c477_L002_R1_001.fastq.gz)   b2d6bf98c19e60dbb9e665faeeca32d3
    24         MD5 (c477_L002_R2_001.fastq.gz)   8dba2b7db16c141cbdc3a25b49e06452
    25        MD5 (DO905_L001_R1_001.fastq.gz)   201f7f48f619afe59caafa070bfe013d
    26        MD5 (DO905_L001_R2_001.fastq.gz)   fcaa1cd412fca9ff41afb4fd339e2632
    27        MD5 (DO905_L002_R1_001.fastq.gz)   73feaa65f5ba355db24fd412bafa210d
    28        MD5 (DO905_L002_R2_001.fastq.gz)   47ca6800781271f3371482f69585bac0
    29    MD5 (EverCrisp_L001_R1_001.fastq.gz)   2aad32a3587aa89ab1653ab2fa849ffc
    30    MD5 (EverCrisp_L001_R2_001.fastq.gz)   bf2f1c1d688df9840f4931c25d90c1af
    31    MD5 (EverCrisp_L002_R1_001.fastq.gz)   7eac61d32f90075ef93ab1ef720d8892
    32    MD5 (EverCrisp_L002_R2_001.fastq.gz)   dafeff59109c5e80f30d473a98a3bb41
    33     MD5 (GoldRush_L001_R1_001.fastq.gz)   3005464273e558563f7d348b2a12c4c0
    34     MD5 (GoldRush_L001_R2_001.fastq.gz)   49f65ea29088f15fa99839d3c3ae3226
    35     MD5 (GoldRush_L002_R1_001.fastq.gz)   c6d194e386205b4eb6a0b6ff7a51602c
    36     MD5 (GoldRush_L002_R2_001.fastq.gz)   c4d1d8432c9bee0d6bfc7538a5667b95
    37    MD5 (KDW28-175_L001_R1_001.fastq.gz)   a102aec6848a3d254cbd21649b8d2a2e
    38    MD5 (KDW28-175_L001_R2_001.fastq.gz)   3e8dda6097c2d074cf84c22b3b216398
    39    MD5 (KDW28-175_L002_R1_001.fastq.gz)   52a849cb22e764094cd82b3ae8ca50ff
    40    MD5 (KDW28-175_L002_R2_001.fastq.gz)   a5cc9ac36f963491ed224ae91e158c15
    41   MD5 (KGDW-17-11_L001_R1_001.fastq.gz)   8521bc4c4e87cc15fda2c00ebffc7995
    42   MD5 (KGDW-17-11_L001_R2_001.fastq.gz)   440391e18684ba0e2aeed1b17da16382
    43   MD5 (KGDW-17-11_L002_R1_001.fastq.gz)   ed75ed09b691f2891f2fae670236eb5a
    44   MD5 (KGDW-17-11_L002_R2_001.fastq.gz)   ae038db368ec22603785ed5eac43cf3f
    45   MD5 (KGDW17-199_L001_R1_001.fastq.gz)   f84b52ec11d99d6b172a0030a377de4a
    46   MD5 (KGDW17-199_L001_R2_001.fastq.gz)   5ef64f36a074a94ba2ec7987d1e15e5d
    47   MD5 (KGDW17-199_L002_R1_001.fastq.gz)   d1937adab0a02bd3c1f5ca35a81d2ea4
    48   MD5 (KGDW17-199_L002_R2_001.fastq.gz)   8f3824cc81f26629276dceca9d32e856
    49   MD5 (KGDW18-144_L001_R1_001.fastq.gz)   b397bd4f1e7d4ef92d27eca799c6613a
    50   MD5 (KGDW18-144_L001_R2_001.fastq.gz)   3a5967120d2f8aecea4f51cc8c06a171
    51   MD5 (KGDW18-144_L002_R1_001.fastq.gz)   04e76d8486e3f75366996ad2040f6100
    52   MD5 (KGDW18-144_L002_R2_001.fastq.gz)   6509b7e626062a67a2d88e3c517f26bb
    53    MD5 (LudaCrisp_L001_R1_001.fastq.gz)   d55e349db35a0d6c947c10cc7914c64c
    54    MD5 (LudaCrisp_L001_R2_001.fastq.gz)   5f0e90e197925184c94d40f9ddd10be3
    55    MD5 (LudaCrisp_L002_R1_001.fastq.gz)   e74016e663edb8952c05ced7ccee3e94
    56    MD5 (LudaCrisp_L002_R2_001.fastq.gz)   7e44e58f4449e9e5dfda8fe0d1b46ae2
    57    MD5 (MDW15-150_L001_R1_001.fastq.gz)   dade5cacfb04964e7b401deb786e34d2
    58    MD5 (MDW15-150_L001_R2_001.fastq.gz)   d37b250fbd72511dbd98dc543bbe01e5
    59    MD5 (MDW15-150_L002_R1_001.fastq.gz)   6cf3083ed7b648d2fb04e20461121d18
    60    MD5 (MDW15-150_L002_R2_001.fastq.gz)   855c94b3cec0034899aabbd2c3ae3dbb
    61    MD5 (MDW29-165_L001_R1_001.fastq.gz)   c98caeb45713023b08f8882af2f1eb27
    62    MD5 (MDW29-165_L001_R2_001.fastq.gz)   9322efe97faf7a2c24ded1ac9dddba76
    63    MD5 (MDW29-165_L002_R1_001.fastq.gz)   99abeb2b66447aad2c2115aeea78c452
    64    MD5 (MDW29-165_L002_R2_001.fastq.gz)   09a649e249113242fcdb407916088654
    65 MD5 (Mnietz-14-11_L001_R1_001.fastq.gz)   35c63dce20df88d31f65c288cf4ba237
    66 MD5 (Mnietz-14-11_L001_R2_001.fastq.gz)   814d83e402c9fea1ce93b293896c8336
    67 MD5 (Mnietz-14-11_L002_R1_001.fastq.gz)   1df58c8c3c947c629c92ca1dd2bb41c3
    68 MD5 (Mnietz-14-11_L002_R2_001.fastq.gz)   30cc6e5e4e290acab04a5129dc6b2817
    69     MD5 (Red-Gold_L001_R1_001.fastq.gz)   3528b6cdc83171d0e19095af5a03bd7e
    70     MD5 (Red-Gold_L001_R2_001.fastq.gz)   26c34a44f0915bc3df298083d042253f
    71     MD5 (Red-Gold_L002_R1_001.fastq.gz)   f49e6023a367e0da4bed13348ac7c920
    72     MD5 (Red-Gold_L002_R2_001.fastq.gz)   20162f3965551310b5074278e9f33f27
    73  MD5 (SweetZinger_L001_R1_001.fastq.gz)   74dbc1bd74423cbe138ebbb8c19c1780
    74  MD5 (SweetZinger_L001_R2_001.fastq.gz)   99372a902a955388ab43d2b77b773906
    75  MD5 (SweetZinger_L002_R1_001.fastq.gz)   3999a1d84b414eb3509b2f99ea2dd8ef
    76  MD5 (SweetZinger_L002_R2_001.fastq.gz)   c00994ad370ffe6f965957c0510e3395

### Checking all MD5 are unique ID

``` r
nrow(provided_md5)
```

    [1] 76

``` r
length(unique(provided_md5$V2))
```

    [1] 76

All MD5 are unique, we have 76 rows and 76 unique ID

``` r
names(provided_md5) <- c("Sample_old", "MD5")
provided_md5 <- provided_md5 %>% 
  mutate(MD5 =  stringi::stri_trim_both(MD5))
```

## Importing the new MD5 check sum

``` r
new_md5 <- read_csv2("new_MD5.txt", col_names = F)  %>%
  separate(col = "X1", into = c("MD5", "Sample_new"), sep = "  ") %>% 
  mutate(MD5 = stringi::stri_trim_both(MD5))
```

    ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    Rows: 76 Columns: 1
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: ";"
    chr (1): X1

    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

Now, if we join the tables using the MD5 id as unique ID, we can see
what files

have identical MD5

``` r
md5_check <- left_join(provided_md5, new_md5)
```

    Joining with `by = join_by(MD5)`

``` r
md5_check
```

                                     Sample_old                              MD5
    1         MD5 (15-22_L001_R1_001.fastq.gz)  f53a0d985c9835e611fc5e7b9ecf03a3
    2         MD5 (15-22_L001_R2_001.fastq.gz)  c5eae0f28ac3e0c60ae558c03e43c163
    3         MD5 (15-22_L002_R1_001.fastq.gz)  96150869f9ce03193176a53dd584809b
    4         MD5 (15-22_L002_R2_001.fastq.gz)  b4bb807dfa5edab32d9dbebabcc1c45e
    5          MD5 (1664_L001_R1_001.fastq.gz)  ff32a5f53e321e33f124e98020715edd
    6          MD5 (1664_L001_R2_001.fastq.gz)  402be604c49c5792f51b0adcf150d398
    7          MD5 (1664_L002_R1_001.fastq.gz)  3fda4a4bb2a148b453ddca0dc00430ab
    8          MD5 (1664_L002_R2_001.fastq.gz)  df6814c3de83203f0c097032e20330dd
    9          MD5 (1947_L001_R1_001.fastq.gz)  10c0d23680fd05efd7061bb66f36aa2d
    10         MD5 (1947_L001_R2_001.fastq.gz)  f32d1ac7a92644d669d560a8357932ab
    11         MD5 (1947_L002_R1_001.fastq.gz)  12c62f451984310848b665d117724e8c
    12         MD5 (1947_L002_R2_001.fastq.gz)  7fb211f8e454ed09301e42f68d3cbc6e
    13         MD5 (c306_L001_R1_001.fastq.gz)  9a93e105d53bee61573eb4ac263c3bae
    14         MD5 (c306_L001_R2_001.fastq.gz)  190afe1526944e904b8a6be2dea31e08
    15         MD5 (c306_L002_R1_001.fastq.gz)  422f65cc7b19bcdc72205a013b8323fa
    16         MD5 (c306_L002_R2_001.fastq.gz)  056038ce48849a87210199b2b0930aa8
    17         MD5 (c450_L001_R1_001.fastq.gz)  22cc445cbde24858543b1b036faaf172
    18         MD5 (c450_L001_R2_001.fastq.gz)  074abc3125dc9a6fbaa0b3c9d1712392
    19         MD5 (c450_L002_R1_001.fastq.gz)  baeb7e4796a39c67e0202f89e0905ab9
    20         MD5 (c450_L002_R2_001.fastq.gz)  43b6e6b90f108a6e5926504d5b6ca394
    21         MD5 (c477_L001_R1_001.fastq.gz)  d06092303a976c86b7ec325ba21cb3fc
    22         MD5 (c477_L001_R2_001.fastq.gz)  9756e93d1c175a939197312b32798c16
    23         MD5 (c477_L002_R1_001.fastq.gz)  b2d6bf98c19e60dbb9e665faeeca32d3
    24         MD5 (c477_L002_R2_001.fastq.gz)  8dba2b7db16c141cbdc3a25b49e06452
    25        MD5 (DO905_L001_R1_001.fastq.gz)  201f7f48f619afe59caafa070bfe013d
    26        MD5 (DO905_L001_R2_001.fastq.gz)  fcaa1cd412fca9ff41afb4fd339e2632
    27        MD5 (DO905_L002_R1_001.fastq.gz)  73feaa65f5ba355db24fd412bafa210d
    28        MD5 (DO905_L002_R2_001.fastq.gz)  47ca6800781271f3371482f69585bac0
    29    MD5 (EverCrisp_L001_R1_001.fastq.gz)  2aad32a3587aa89ab1653ab2fa849ffc
    30    MD5 (EverCrisp_L001_R2_001.fastq.gz)  bf2f1c1d688df9840f4931c25d90c1af
    31    MD5 (EverCrisp_L002_R1_001.fastq.gz)  7eac61d32f90075ef93ab1ef720d8892
    32    MD5 (EverCrisp_L002_R2_001.fastq.gz)  dafeff59109c5e80f30d473a98a3bb41
    33     MD5 (GoldRush_L001_R1_001.fastq.gz)  3005464273e558563f7d348b2a12c4c0
    34     MD5 (GoldRush_L001_R2_001.fastq.gz)  49f65ea29088f15fa99839d3c3ae3226
    35     MD5 (GoldRush_L002_R1_001.fastq.gz)  c6d194e386205b4eb6a0b6ff7a51602c
    36     MD5 (GoldRush_L002_R2_001.fastq.gz)  c4d1d8432c9bee0d6bfc7538a5667b95
    37    MD5 (KDW28-175_L001_R1_001.fastq.gz)  a102aec6848a3d254cbd21649b8d2a2e
    38    MD5 (KDW28-175_L001_R2_001.fastq.gz)  3e8dda6097c2d074cf84c22b3b216398
    39    MD5 (KDW28-175_L002_R1_001.fastq.gz)  52a849cb22e764094cd82b3ae8ca50ff
    40    MD5 (KDW28-175_L002_R2_001.fastq.gz)  a5cc9ac36f963491ed224ae91e158c15
    41   MD5 (KGDW-17-11_L001_R1_001.fastq.gz)  8521bc4c4e87cc15fda2c00ebffc7995
    42   MD5 (KGDW-17-11_L001_R2_001.fastq.gz)  440391e18684ba0e2aeed1b17da16382
    43   MD5 (KGDW-17-11_L002_R1_001.fastq.gz)  ed75ed09b691f2891f2fae670236eb5a
    44   MD5 (KGDW-17-11_L002_R2_001.fastq.gz)  ae038db368ec22603785ed5eac43cf3f
    45   MD5 (KGDW17-199_L001_R1_001.fastq.gz)  f84b52ec11d99d6b172a0030a377de4a
    46   MD5 (KGDW17-199_L001_R2_001.fastq.gz)  5ef64f36a074a94ba2ec7987d1e15e5d
    47   MD5 (KGDW17-199_L002_R1_001.fastq.gz)  d1937adab0a02bd3c1f5ca35a81d2ea4
    48   MD5 (KGDW17-199_L002_R2_001.fastq.gz)  8f3824cc81f26629276dceca9d32e856
    49   MD5 (KGDW18-144_L001_R1_001.fastq.gz)  b397bd4f1e7d4ef92d27eca799c6613a
    50   MD5 (KGDW18-144_L001_R2_001.fastq.gz)  3a5967120d2f8aecea4f51cc8c06a171
    51   MD5 (KGDW18-144_L002_R1_001.fastq.gz)  04e76d8486e3f75366996ad2040f6100
    52   MD5 (KGDW18-144_L002_R2_001.fastq.gz)  6509b7e626062a67a2d88e3c517f26bb
    53    MD5 (LudaCrisp_L001_R1_001.fastq.gz)  d55e349db35a0d6c947c10cc7914c64c
    54    MD5 (LudaCrisp_L001_R2_001.fastq.gz)  5f0e90e197925184c94d40f9ddd10be3
    55    MD5 (LudaCrisp_L002_R1_001.fastq.gz)  e74016e663edb8952c05ced7ccee3e94
    56    MD5 (LudaCrisp_L002_R2_001.fastq.gz)  7e44e58f4449e9e5dfda8fe0d1b46ae2
    57    MD5 (MDW15-150_L001_R1_001.fastq.gz)  dade5cacfb04964e7b401deb786e34d2
    58    MD5 (MDW15-150_L001_R2_001.fastq.gz)  d37b250fbd72511dbd98dc543bbe01e5
    59    MD5 (MDW15-150_L002_R1_001.fastq.gz)  6cf3083ed7b648d2fb04e20461121d18
    60    MD5 (MDW15-150_L002_R2_001.fastq.gz)  855c94b3cec0034899aabbd2c3ae3dbb
    61    MD5 (MDW29-165_L001_R1_001.fastq.gz)  c98caeb45713023b08f8882af2f1eb27
    62    MD5 (MDW29-165_L001_R2_001.fastq.gz)  9322efe97faf7a2c24ded1ac9dddba76
    63    MD5 (MDW29-165_L002_R1_001.fastq.gz)  99abeb2b66447aad2c2115aeea78c452
    64    MD5 (MDW29-165_L002_R2_001.fastq.gz)  09a649e249113242fcdb407916088654
    65 MD5 (Mnietz-14-11_L001_R1_001.fastq.gz)  35c63dce20df88d31f65c288cf4ba237
    66 MD5 (Mnietz-14-11_L001_R2_001.fastq.gz)  814d83e402c9fea1ce93b293896c8336
    67 MD5 (Mnietz-14-11_L002_R1_001.fastq.gz)  1df58c8c3c947c629c92ca1dd2bb41c3
    68 MD5 (Mnietz-14-11_L002_R2_001.fastq.gz)  30cc6e5e4e290acab04a5129dc6b2817
    69     MD5 (Red-Gold_L001_R1_001.fastq.gz)  3528b6cdc83171d0e19095af5a03bd7e
    70     MD5 (Red-Gold_L001_R2_001.fastq.gz)  26c34a44f0915bc3df298083d042253f
    71     MD5 (Red-Gold_L002_R1_001.fastq.gz)  f49e6023a367e0da4bed13348ac7c920
    72     MD5 (Red-Gold_L002_R2_001.fastq.gz)  20162f3965551310b5074278e9f33f27
    73  MD5 (SweetZinger_L001_R1_001.fastq.gz)  74dbc1bd74423cbe138ebbb8c19c1780
    74  MD5 (SweetZinger_L001_R2_001.fastq.gz)  99372a902a955388ab43d2b77b773906
    75  MD5 (SweetZinger_L002_R1_001.fastq.gz)  3999a1d84b414eb3509b2f99ea2dd8ef
    76  MD5 (SweetZinger_L002_R2_001.fastq.gz)  c00994ad370ffe6f965957c0510e3395
                              Sample_new
    1         15-22_L001_R1_001.fastq.gz
    2         15-22_L001_R2_001.fastq.gz
    3         15-22_L002_R1_001.fastq.gz
    4         15-22_L002_R2_001.fastq.gz
    5          1664_L001_R1_001.fastq.gz
    6          1664_L001_R2_001.fastq.gz
    7          1664_L002_R1_001.fastq.gz
    8          1664_L002_R2_001.fastq.gz
    9          1947_L001_R1_001.fastq.gz
    10         1947_L001_R2_001.fastq.gz
    11         1947_L002_R1_001.fastq.gz
    12         1947_L002_R2_001.fastq.gz
    13         c306_L001_R1_001.fastq.gz
    14         c306_L001_R2_001.fastq.gz
    15         c306_L002_R1_001.fastq.gz
    16         c306_L002_R2_001.fastq.gz
    17         c450_L001_R1_001.fastq.gz
    18         c450_L001_R2_001.fastq.gz
    19         c450_L002_R1_001.fastq.gz
    20         c450_L002_R2_001.fastq.gz
    21         c477_L001_R1_001.fastq.gz
    22         c477_L001_R2_001.fastq.gz
    23         c477_L002_R1_001.fastq.gz
    24         c477_L002_R2_001.fastq.gz
    25        DO905_L001_R1_001.fastq.gz
    26        DO905_L001_R2_001.fastq.gz
    27        DO905_L002_R1_001.fastq.gz
    28        DO905_L002_R2_001.fastq.gz
    29    EverCrisp_L001_R1_001.fastq.gz
    30    EverCrisp_L001_R2_001.fastq.gz
    31    EverCrisp_L002_R1_001.fastq.gz
    32    EverCrisp_L002_R2_001.fastq.gz
    33     GoldRush_L001_R1_001.fastq.gz
    34     GoldRush_L001_R2_001.fastq.gz
    35     GoldRush_L002_R1_001.fastq.gz
    36     GoldRush_L002_R2_001.fastq.gz
    37    KDW28-175_L001_R1_001.fastq.gz
    38    KDW28-175_L001_R2_001.fastq.gz
    39    KDW28-175_L002_R1_001.fastq.gz
    40    KDW28-175_L002_R2_001.fastq.gz
    41   KGDW-17-11_L001_R1_001.fastq.gz
    42   KGDW-17-11_L001_R2_001.fastq.gz
    43   KGDW-17-11_L002_R1_001.fastq.gz
    44   KGDW-17-11_L002_R2_001.fastq.gz
    45   KGDW17-199_L001_R1_001.fastq.gz
    46   KGDW17-199_L001_R2_001.fastq.gz
    47   KGDW17-199_L002_R1_001.fastq.gz
    48   KGDW17-199_L002_R2_001.fastq.gz
    49   KGDW18-144_L001_R1_001.fastq.gz
    50   KGDW18-144_L001_R2_001.fastq.gz
    51   KGDW18-144_L002_R1_001.fastq.gz
    52   KGDW18-144_L002_R2_001.fastq.gz
    53    LudaCrisp_L001_R1_001.fastq.gz
    54    LudaCrisp_L001_R2_001.fastq.gz
    55    LudaCrisp_L002_R1_001.fastq.gz
    56    LudaCrisp_L002_R2_001.fastq.gz
    57    MDW15-150_L001_R1_001.fastq.gz
    58    MDW15-150_L001_R2_001.fastq.gz
    59    MDW15-150_L002_R1_001.fastq.gz
    60    MDW15-150_L002_R2_001.fastq.gz
    61    MDW29-165_L001_R1_001.fastq.gz
    62    MDW29-165_L001_R2_001.fastq.gz
    63    MDW29-165_L002_R1_001.fastq.gz
    64    MDW29-165_L002_R2_001.fastq.gz
    65 Mnietz-14-11_L001_R1_001.fastq.gz
    66 Mnietz-14-11_L001_R2_001.fastq.gz
    67 Mnietz-14-11_L002_R1_001.fastq.gz
    68 Mnietz-14-11_L002_R2_001.fastq.gz
    69     Red-Gold_L001_R1_001.fastq.gz
    70     Red-Gold_L001_R2_001.fastq.gz
    71     Red-Gold_L002_R1_001.fastq.gz
    72     Red-Gold_L002_R2_001.fastq.gz
    73  SweetZinger_L001_R1_001.fastq.gz
    74  SweetZinger_L001_R2_001.fastq.gz
    75  SweetZinger_L002_R1_001.fastq.gz
    76  SweetZinger_L002_R2_001.fastq.gz

Another way that we can test if the MD5 identifiers match, is making an
string match

``` r
provided_md5$MD5 %in% new_md5$MD5
```

     [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    [16] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    [31] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    [46] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    [61] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    [76] TRUE

As we get all \`TRUE\` results, all MD5 check sum matches with the
provided MD5 list
