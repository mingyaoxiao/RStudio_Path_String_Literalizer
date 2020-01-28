#' Parse selected "Windows" path to an "R-usable" one
#'
#' @return
#' @export
#' @importFrom rstudioapi getActiveDocumentContext
#' @importFrom magrittr '%>%'
#'
#' @examples
path_parse <- function() {
  getActiveDocumentContext()[['selection']][[1]][['text']] %>%
  { gsub('\\\\', '/', .) } %>%
  { gsub('//', '/', .) } %>%    # To remove double f. slashes
  { ifelse(check_for_quotes(.), insertText(.), insertText(paste0('\'', ., '\''))) }
}
### Old function:
# path_parse <- function() {
#   getActiveDocumentContext()[['selection']][[1]][['text']] %>%
#   { chartr('\\', '/', .) } %>% { insertText(paste0('\'', ., '\'')) }
# }
