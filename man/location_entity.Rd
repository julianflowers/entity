% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/location_entity.R
\name{location_entity}
\alias{location_entity}
\title{Named Location Recognition}
\usage{
location_entity(text.var, entity.annotator = "location_annotator",
  word.annotator = word_annotator(), element.chunks = floor(2000 *
  (23.5/mean(sapply(text.var, nchar), na.rm = TRUE))))
}
\arguments{
\item{text.var}{The text string variable.}

\item{entity.annotator}{A character vector identifying an entity recognition
annotator (\code{c("person_annotator", "location_annotator", "date_annotator",
"money_annotator", "percent_annotator")}.  See \code{?annotators}.}

\item{word.annotator}{A word annotator.}

\item{element.chunks}{The number of elements to include in a chunk. Chunks are
passed through an \code{\link[base]{lapply}} and size is kept within a tolerance
because of memory allocation in the tagging process with \pkg{Java}.}
}
\value{
Returns a data.frame of named entities and frequencies.
}
\description{
A wrapper for \pkg{NLP},/\pkg{openNLP}'s named location recognition annotation.
}
\examples{
\dontrun{
data(presidential_debates_2012)

locales <- location_entity(presidential_debates_2012$dialogue)
unlist(locales)

library(dplyr)
presidential_debates_2012$locations <- location_entity(presidential_debates_2012$dialogue)

presidential_debates_2012 \%>\%
    {.[!sapply(.$locations, is.null), ]} \%>\%
    rowwise() \%>\%
    mutate(locations = paste(locations, collapse=", ")) \%>\%
    select(person, time, locations)

library(tidyr)
presidential_debates_2012 \%>\%
    {.[!sapply(.$locations, is.null), ]} \%>\%
    unnest() \%>\%
    select(person, time, locations)
}
}
\seealso{
Other variable functions: \code{\link{date_entity}},
  \code{\link{money_entity}},
  \code{\link{organization_entity}},
  \code{\link{percent_entity}}, \code{\link{person_entity}}
}
\keyword{location}
