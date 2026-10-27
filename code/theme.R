# Plot colours and font names are read from the supplied design tokens.
draw_workshop_series <- function(d, path) {
  tok <- yaml::read_yaml("design-tokens.yml")
  palette <- tok$color$palette
  family <- function(x) gsub("['\"]", "", trimws(strsplit(x, ",", fixed = TRUE)[[1]][1]))
  sans <- family(tok$typography$headings$family)
  mono <- family(tok$typography$monospace$family)
  systemfonts::register_font(sans, plain = "styles/fonts/Jost-Regular.ttf")
  systemfonts::register_font(mono, plain = "styles/fonts/JetBrainsMono-Regular.ttf")
  svglite::svglite(path, width = 8, height = 6.4, bg = palette$surface)
  on.exit(dev.off())
  par(mfrow = c(2, 1), mar = c(2.6, 4.2, 2.9, 1), family = mono,
      col.axis = palette$ink, col = palette[["data-1"]], fg = palette$ink,
      cex.axis = .8, las = 1)
  x <- seq_len(nrow(d))
  ticks <- which(substr(d$month, 6, 7) == "01")
  for (i in 1:2) {
    y <- if (i == 1) d$hicp_yoy_pct else d$expectations_balance
    title <- if (i == 1) "Ostvarena inflacija · HICP, godišnja promjena (%)" else
      "Očekivanja cijena · anketni saldo (bodovi), NSA"
    plot(x, y, type = "n", xlab = "", ylab = "", xaxt = "n", bty = "n")
    abline(h = pretty(range(y)), col = palette[["rule-soft"]], lwd = .6)
    if (min(y) <= 0 && max(y) >= 0) abline(h = 0, col = palette[["ink-faint"]], lty = 3)
    lines(x, y, col = palette[[paste0("data-", i)]], lwd = 1.8, lty = i)
    axis(1, at = ticks, labels = substr(d$month[ticks], 1, 4), tck = -.02)
    mtext(title, side = 3, line = 1.1, adj = 0, family = sans, cex = .95, col = palette$ink)
  }
  dev.off()
  on.exit(NULL)
  # SVG used through <img> does not inherit page fonts. Embed licensed font
  # data so the exported figure also remains portable and works offline.
  faces <- c(sans, mono)
  paths <- c("styles/fonts/Jost-Regular.ttf", "styles/fonts/JetBrainsMono-Regular.ttf")
  css <- vapply(seq_along(faces), function(i) sprintf(
    "@font-face{font-family:'%s';src:url(data:font/ttf;base64,%s) format('truetype');}",
    faces[i], base64enc::base64encode(paths[i])), character(1))
  svg <- readLines(path, encoding = "UTF-8", warn = FALSE)
  at <- grep("<defs>", svg, fixed = TRUE)[1]
  svg <- append(svg, c("<style type='text/css'><![CDATA[", css, "]]></style>"), after = at)
  writeLines(enc2utf8(svg), path, useBytes = TRUE)
}
