% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mean_comparisons.check_model_spatial.R
\name{mean_comparisons.check_model_spatial}
\alias{mean_comparisons.check_model_spatial}
\title{Get mean comparisons from \code{\link{check_model.fit_model_spatial}} object}
\usage{
\method{mean_comparisons}{check_model_spatial}(x, alpha = 0.05,
  p.adj = "none", ...)
}
\arguments{
\item{x}{outputs from \code{\link{check_model.fit_model_spatial}}}

\item{alpha}{level of type one error. 0.05 (5\%) by default}

\item{p.adj}{For all except type = 2. 
NULL for no adjustement of the type one error. 
p.adj can "holm", "hochberg", "bonferroni", "BH", "BY" or "fdr"
p-adj = "none" is t-student.
See p.adjust() for more details.}

\item{...}{further arguments passed to or from other methods#'}
}
\value{
A list of two elements : 
  \itemize{
   \item info : a list with variable and data
   \item data_ggplot_LSDbarplot_germplasm
  }
}
\description{
\code{mean_comparisons} performs mean comparisons from object coming from \code{\link{check_model.fit_model_spatial}}
}
\details{
S3 method.
See in the book for more details : https://priviere.github.io/PPBstats_book/intro-agro.html#section-freq
}
\seealso{
\itemize{
 \item \code{\link{mean_comparisons}}
 \item \code{\link{plot.PPBstats}}
 \item \code{\link{plot.mean_comparisons_model_spatial}}
}
}
\author{
Pierre Riviere
}
