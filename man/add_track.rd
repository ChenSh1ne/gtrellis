\name{add_track}
\alias{add_track}
\title{
Add self-defined graphics track by track
}
\description{
Add self-defined graphics track by track
}
\usage{
add_track(gr = NULL, category = NULL, track = current_track() + 1,
    clip = TRUE, panel_fun = function(gr) NULL, panel.fun = NULL,
    use_raster = FALSE,
    raster_device = c("png", "jpeg", "tiff", "CairoPNG", "CairoJPEG", "CairoTIFF"),
    raster_quality = 1,
    raster_device_param = list())
}
\arguments{

  \item{gr}{genomic regions. It should be a data frame in BED format or a \code{GRanges} object.}
  \item{category}{subset of categories (e.g. chromosomes) that users want to add graphics.  The value can be a vector which contains more than one category. By default it is all available categories.}
  \item{track}{which track the graphics will be added to. By default it is the next track. The value should only be a scalar.}
  \item{clip}{whether graphics are restricted inside the cell.}
  \item{panel_fun}{self-defined panel function to add graphics in each 'cell'. THe argument \code{gr} in \code{panel_fun}  only contains data for the current category which is a subset of the main \code{gr}. The function can also contains no argument if nothing needs to be passed in.}
  \item{panel.fun}{deprecated}
  \item{use_raster}{whether render the each panel as a raster image. It helps to reduce file size when the file size is huge.}
  \item{raster_device}{graphic device which is used to generate the raster image}
  \item{raster_quality}{a value set to larger than 1 will improve the quality of the raster image. A temporary image with \code{raster_quality}*\code{raster_quality} times the original size of panel is generated first and then fit into the panel by \code{\link[grid]{grid.raster}}.}
  \item{raster_device_param}{a list of further parameters for the selected graphic device}

}
\details{
Initialization of the Trellis layout and adding graphics are two independent steps.
Once the layout initialization finished, each cell will be an independent plotting region.
As same as \code{panel_fun} in \code{\link[circlize]{circlize-package}}, the self-defined function \code{panel_fun}
will be applied on every cell in the specified track (by default it is the 'current' track).

When adding graphics in each cell, \code{\link{get_cell_meta_data}} can return several meta data for the current cell.

Since this package is implemented by the \code{grid} graphic system, \code{grid}-family functions
(such as \code{\link[grid]{grid.points}}, \code{\link[grid]{grid.rect}}, ...) should be used to add graphics. The usage
of \code{grid} functions is quite similar as the traditional graphic functions. 
Followings are several examples:

  \preformatted{
    grid.points(x, y)
    grid.lines(x, y)
    grid.rect(x, y, width, height)  }

Graphical parameters are usually passed by \code{\link[grid]{gpar}}:

  \preformatted{
    grid.points(x, y, gp = gpar(col = "red")
    grid.rect(x, y, width, height, gp = gpar(fill = "black", col = "red"))  }

\code{grid} system also support a large number of coordinate measurement systems by defining proper \code{\link[grid]{unit}} object 
which provides high flexibility to place graphics on the plotting regions.

  \preformatted{
    grid.points(x, y, default.units = "npc")
    grid.rect(x, y, width = unit(1, "cm"))  }

You can refer to the documentations and vignettes of \code{\link[grid]{grid-package}} to get a overview.
}
\value{
No value is returned.
}
\seealso{
There are several functions which draw specific graphics and are implemented by \code{\link{add_track}}:

\itemize{
  \item \code{\link{add_points_track}}
  \item \code{\link{add_segments_track}}
  \item \code{\link{add_lines_track}}
  \item \code{\link{add_rect_track}}
  \item \code{\link{add_heatmap_track}}
}
}
\author{
Zuguang Gu <z.gu@dkfz.de>
}
\examples{
# There is no example
NULL
}
