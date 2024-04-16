#' Water point exchange data.
#'
#' Data from the Water Point Data Exchange (WPDX) database.
#'
#' @format: A tibble with 10 columns and 790,375 rows.
#' \describe{
#'   \item{row_id}{ A sentence without commas but a capital letter and a period at the end.}
#'   \item{source}{ Submitter of the data.}
#'   \item{lat_deg}{ Latitude in decimal degrees.}
#'   \item{lon_deg}{ Longitude in decimal degrees.}
#'   \item{report_date}{ Date of the report.}
#'   \item{status_id}{ Status of the data.}
#'   \item{water_source}{ Source of water.}
#'   \item{water_tech}{  Technology used for water.}
#'   \item{country_name}{ Name of the country.}
#'   \item{adm1}{ Name of the first administrative division.}
#' }
#'
"whdxdata"
