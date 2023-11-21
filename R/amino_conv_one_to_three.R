#' Change amino acid one letter code to three letter code
#'
#' @param protein_change_string
#'
#' @return
#' @export
#'
#' @examples Changes p.Y772_A775dup to --> p.Tyr772_Ala775dup
amino_code_conversion_one_to_three = function(protein_change_string){
  if(protein_change_string != "p.?" & !is.na(protein_change_string)){
    if(oneORthree_code(protein_change_string) == "one"){
    # Identify positions of all upper case letters
    # 'Ter' needs to be encoded as '*' in single amino acid code:
    protein_change_string = gsub("Ter", "*", protein_change_string)
    # Locate positions of all upper-case letters (to use for substitution)
    upper_pos_vec = stringr::str_locate_all(protein_change_string, pattern = "[:upper:]|\\*")
    # Generate a vector with all characters split
    split_vec = stringr::str_split_1(protein_change_string, pattern = "")
    # Remove all upper case character and split the vector
    no_upper = stringr::str_split_1(protein_change_string, pattern = "[:upper:]|\\*")

    # Generate vector of substitutions and interleave result
    substitute_list = c()
    upper_pos_vec = upper_pos_vec[[1]]
    for(i in 1:nrow(upper_pos_vec)){
      upper_pos = upper_pos_vec[i,1]
      substitute_list[i] = aminocode[[split_vec[upper_pos]]]
    }
    substitute_list = c(substitute_list,'')
    one_to_three = paste0(c(rbind(no_upper, substitute_list)), collapse = '')
    return(one_to_three)
  }else{
    return(protein_change_string)
  }
  }else{
    return(NA)
  }
}



#' ###### Change three to one letter code
#'
#' @param protein_change_string
#'
#' @return
#' @export
#'
#' @examples
amino_code_conversion_three_to_one <- function(protein_change_string){
  amino_acid_change_parse = protein_change_string
  if(!is.na(protein_change_string) & !grepl("p\\.\\?", protein_change_string) ){
    if(oneORthree_code(protein_change_string) == "three"){
      for(i in seq_along(aminocode)){
        amino_acid_change_parse <- gsub(aminocode[i], names(aminocode)[i], amino_acid_change_parse, ignore.case = FALSE)
      }
      if(!grepl("p.", amino_acid_change_parse)){
        amino_acid_change_parse <- paste0("p.", amino_acid_change_parse)
      }
      return(amino_acid_change_parse)
    }else{
      return(protein_change_string)
    }
  }else{
    return(NA)
  }
}

