static const char norm_fg[] = "#FDF6E3";
static const char norm_bg[] = "#002B36";
static const char norm_border[] = "#af8700";

static const char sel_fg[] = "#FDF6E3";
static const char sel_bg[] = "#859900";
static const char sel_border[] = "#FDF6E3";

static const char urg_fg[] = "#FDF6E3";
static const char urg_bg[] = "#DC322F";
static const char urg_border[] = "#DC322F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
