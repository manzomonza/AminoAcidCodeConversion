
aminocode  <- c("Ala", "Arg", "Asn", "Asp", "Cys", "Gln", "Glu", "Gly", "His", "Ile", "Leu", "Lys", "Met", "Phe", "Pro", "Ser", "Thr",
                "Trp", "Tyr", "Val", "Sec", "Pyl", "Asx", "Xle", "Glx", "Xaa")

names(aminocode) <- c("A", "R", "N", "D", "C", "Q", "E", "G", "H", "I", "L", "K", "M", "F", "P", "S", "T",
                      "W", "Y", "V", "U", "O", "B", "J", "Z","X")

aminocode['*']  <- "Ter"
aminocode['dup']  <- "dup"

#' Single or three letter code
#'
#' @param amino_acid_change
#'
#' @return
#' @export
#'
#' @examples
oneORthree_code <- function(amino_acid_change){
  if(amino_acid_change != 'p.?'){
    if(stringr::str_detect(amino_acid_change, stringr::regex(pattern = '[:upper:][:digit:]'))){
      return("one")
    }else{
      return("three")
    }
  }else{
    return(NA)
  }
}






#' ###### Change one letter to three letter code
#'
#' @param amino_acid_change_entry
#'
#' @return
#' @export
#'
#' @examples
amino_acid_conversion_one_to_three <- function(amino_acid_change_entry){
  if(!is.na(amino_acid_change_entry) & !grepl("p\\.\\?", amino_acid_change_entry) ){
    ## Pattern equals e.g. P45 (only one upper case followed by digit)
    if(oneORthree_code(amino_acid_change_entry) == "one"){
      amino_acid_change_parse = complex_one_to_three(amino_acid_change_entry)
      return(amino_acid_change_parse)
    }else{
      return(amino_acid_change_entry)
    }
    }else{
    return(NA)
  }
}



#' ####### Simple One To Three AA amino acid switch, used in aa_parser_singleletter
#'
#' @param trimmed_string
#'
#' @return
#' @export
#'
#' @examples
one_three_aa_precision <- function(trimmed_string){
  lett = stringr::str_extract_all(trimmed_string, stringr::regex(pattern = '[[A-Z]]'))[[1]]
  position = stringr::str_extract(trimmed_string, stringr::regex(pattern = '\\d+'))
  lett = sapply(lett, function(x) aminocode[x])

  if(grepl("\\*", trimmed_string)){
    three_letter_code = paste0("p.", lett[1], position, "*")
  }else if(is.na(lett[2])){
    three_letter_code = paste0("p.", lett[1], position)
  }
  else{
    three_letter_code = paste0("p.", lett[1], position, lett[2])
  }
  return(three_letter_code)
}

