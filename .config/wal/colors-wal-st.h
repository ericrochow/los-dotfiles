const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#002B36", /* black   */
  [1] = "#DC322F", /* red     */
  [2] = "#859900", /* green   */
  [3] = "#B58900", /* yellow  */
  [4] = "#268BD2", /* blue    */
  [5] = "#6C71C4", /* magenta */
  [6] = "#2AA198", /* cyan    */
  [7] = "#93A1A1", /* white   */

  /* 8 bright colors */
  [8]  = "#af8700",  /* black   */
  [9]  = "#DC322F",  /* red     */
  [10] = "#859900", /* green   */
  [11] = "#B58900", /* yellow  */
  [12] = "#268BD2", /* blue    */
  [13] = "#6C71C4", /* magenta */
  [14] = "#2AA198", /* cyan    */
  [15] = "#FDF6E3", /* white   */

  /* special colors */
  [256] = "#002B36", /* background */
  [257] = "#93A1A1", /* foreground */
  [258] = "#268bd2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
