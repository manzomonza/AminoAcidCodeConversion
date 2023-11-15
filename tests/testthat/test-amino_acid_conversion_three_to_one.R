aa_test = list(list(three = "p.Ala123", one = "p.A123"),
               list(three = "p.Ala123dup", one = "p.A123dup"),
               list(three = "p.Ser779delinsLeuProArgPro", one = "p.S779delinsLPRP"),
               list(three = "p.Gln993HisfsTer110", one = "p.Q993Hfs*110"),
               list(three = "p.Glu746_Thr751delinsSer", one = "p.E746_T751delinsS"),
               list(three = "p.Ser45_Ser47delinsCys", one = "p.S45_S47delinsC"),
               list(three = "p.Ala123dup", one = "p.A123dup"),
               list(three = "p.Cys634_Arg635insHisGluLeuCys", one = "p.C634_R635insHELC"),
               list(three = "p.Arg76_Cys77insTrpProAsnThrPheIleIleArg", one = "p.R76_C77insWPNTFIIR"),
               list(three = "p.Tyr772_Ala775dup", one = "p.Y772_A775dup"),
               list(three = "p.Ala1023IlefsTer19", one = "p.A1023Ifs*19"),
               list(three = "p.Asp1028IlefsTer19", one = "p.D1028Ifs*19"))

for(i in seq_along(aa_test)){
  test_that("Amino acid changes three to one", {
    expect_equal(amino_acid_conversion_three_to_one(aa_test[[i]]$three), aa_test[[i]]$one)
  })
}


