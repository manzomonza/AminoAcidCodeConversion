
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
#' @return "one" or "three"
#' @export
#'
#' @examples
oneORthree_code <- function(amino_acid_change){
  if(!is.na(amino_acid_change) & amino_acid_change != 'p.?'){
    if(stringr::str_detect(amino_acid_change, stringr::regex(pattern = '[:upper:][:digit:]'))){
      return("one")
    }else{
      return("three")
    }
  }else{
    return(NA)
  }
}


