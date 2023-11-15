library(usethis)
library(testthat)

one_three_tests = list(
  list(amino = "p.Ala123", code = 'three'),
  list(amino = "p.A123", code = 'one'),
  list(amino = "p.Ala123dup", code = 'three'),
  list(amino = "p.A123dup", code = 'one'),
  list(amino = "p.Ser779delinsLeuProArgPro", code = 'three'),
  list(amino = "p.S779delinsLPRP", code = 'one'),
  list(amino = "p.Gln993HisfsTer110", code = 'three'),
  list(amino = "p.Q993Hfs*110", code = 'one'),
  list(amino = "p.Glu746_Thr751delinsSer", code = 'three'),
  list( amino = "p.E746_T751delinsS", code = 'one'),
  list(amino = "p.Ser45_Ser47delinsCys", code = 'three'),
  list(amino = "p.S45_S47delinsC", code = 'one'),
  list(amino = "p.Ala123dup",code = 'three'),
  list(amino = "p.A123dup", code = 'one'),
  list(amino = "p.Cys634_Arg635insHisGluLeuCys",code = 'three'),
  list(amino = "p.C634_R635insHELC", code = 'one'),
  list(amino = "p.Arg76_Cys77insTrpProAsnThrPheIleIleArg",code = 'three'),
  list(amino = "p.R76_C77insWPNTFIIR", code = 'one'),
  list(amino = "p.Tyr772_Ala775dup",code = 'three'),
  list(amino = "p.Y772_A775dup", code = 'one'),
  list(amino = "p.Ala1023IlefsTer19",code = 'three'),
  list(amino = "p.A1023Ifs*19", code = 'one'),
  list(amino = "p.Asp1028IlefsTer19",code = 'three'),
  list(amino = "p.?", code = NA),
  list(amino = NA, code = NA))


for(i in seq_along(one_three_tests)){
  test_that("oneORthree decides correctly", {
    expect_equal(oneORthree_code(one_three_tests[[i]]$amino), one_three_tests[[i]]$code)
  })
}


test_that("oneORthree decides correctly", {
  expect_equal(oneORthree_code("E123P"), "one")
})

test_that("oneORthree decides correctly", {
  expect_equal(oneORthree_code("Glu123Phe"), "three")
})
