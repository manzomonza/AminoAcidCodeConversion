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
               list(three = "p.Asp1028IlefsTer19", one = "p.D1028IfsTer19"))


for(i in seq_along(aa_test)){
  test_that("Amino acid changes one to three", {
    expect_equal(amino_code_conversion_one_to_three(aa_test[[i]]$one), aa_test[[i]]$three)
  })
}


# aminochanges = readr::read_tsv("./tests/amino_acid_changes.tsv")
# aminochanges$code_type = unlist(lapply(aminochanges$protein, oneORthree_code))
# aminochanges$three_letter = unlist(lapply(aminochanges$protein, amino_code_conversion_one_to_three))
# aminochanges$three_letter = ifelse(aminochanges$code_type == "three", aminochanges$protein, aminochanges$three_letter)
# aminochanges$one_letter = unlist(lapply(aminochanges$protein, amino_acid_conversion_three_to_one))
# aminochanges$one_letter = ifelse(aminochanges$code_type == "one", aminochanges$protein, aminochanges$one_letter)
# readr::write_tsv(aminochanges,"./tests/amino_acid_changes_2.tsv")

# aminochanges = readr::read_tsv("./tests/amino_acid_changes_2.tsv")
#
# for(i in 1:nrow(aminochanges)){
#   test_that("Amino acid changes one to three", {
#     expect_equal(amino_code_conversion_one_to_three(aminochanges$one_letter[i]), aminochanges$three_letter[i])
#   })
# }




