% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_model.fit_model_bh_intra_location.R
\name{check_model.fit_model_bh_intra_location}
\alias{check_model.fit_model_bh_intra_location}
\title{Check if the Hierarchical Bayesian intra location model went well}
\usage{
\method{check_model}{fit_model_bh_intra_location}(x)
}
\arguments{
\item{x}{outputs from \code{\link{model_bh_intra_location}}}
}
\value{
It returns a list with the following elements:

\itemize{
 \item MCMC : a data fame resulting from the concatenation of the two MCMC for each parameter (See details for more information).
 \item MCMC_conv_not_ok : a data fame resulting from the concatenation of the two MCMC for each parameter for environment where  some parameters did not converge for mu and beta
 \item data_env_with_no_controls : data frame with environnement with no controls
 \item data_env_whose_param_did_not_converge : a list with data frame with environments where some parameters did not converge for mu and beta.
 \item data_ggplot a list containing information for ggplot:
 \itemize{
  \item sigma_j
  \item mu_ij
  \item beta_jk
  \item sigma_j_2
  \item epsilon_ijk
 }
}
}
\description{
\code{check_model.fit_model_bh_intra_location} computes tests to assess if the model went well. 
It is important to run this step before going ahead with the analysis otherwise you may make mistakes in the interpretation of the results.
}
\details{
S3 method.
The different test apply to the model are explained in the book \href{https://priviere.github.io/PPBstats_book/intro-agro.html#section-bayes}{here}.
Note that all environments where at least one parameter do not converge are not taken into account in the MCMC outputs.
}
\seealso{
\itemize{
\item \code{\link{check_model}}
\item \code{\link{plot.check_model_bh_intra_location}}
\item \code{\link{mean_comparisons}}
\item \code{\link{mean_comparisons.check_model_bh_intra_location}}
}
}
\author{
Pierre Riviere
}
