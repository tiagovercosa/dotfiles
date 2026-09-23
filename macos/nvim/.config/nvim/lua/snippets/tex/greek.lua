-- Greek letters: ;a -> \alpha, ;b -> \beta, ... (mnemonic by sound/shape,
-- since there are more Greek letters than spare Latin ones to map 1:1)
local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node

local u = require("utils.snippets")

-- Snippets (expand with <Tab>), autosnippets (expand as soon as typed)
return {},
{
  s({ trig = ";a", dscr = "alpha",   condition = u.in_mathzone }, t("\\alpha")),
  s({ trig = ";b", dscr = "beta",    condition = u.in_mathzone }, t("\\beta")),
  s({ trig = ";g", dscr = "gamma",   condition = u.in_mathzone }, t("\\gamma")),
  s({ trig = ";d", dscr = "delta",   condition = u.in_mathzone }, t("\\delta")),
  s({ trig = ";e", dscr = "epsilon", condition = u.in_mathzone }, t("\\epsilon")),
  s({ trig = ";z", dscr = "zeta",    condition = u.in_mathzone }, t("\\zeta")),
  s({ trig = ";h", dscr = "eta",     condition = u.in_mathzone }, t("\\eta")),
  s({ trig = ";j", dscr = "theta",   condition = u.in_mathzone }, t("\\theta")),
  s({ trig = ";i", dscr = "iota",    condition = u.in_mathzone }, t("\\iota")),
  s({ trig = ";k", dscr = "kappa",   condition = u.in_mathzone }, t("\\kappa")),
  s({ trig = ";l", dscr = "lambda",  condition = u.in_mathzone }, t("\\lambda")),
  s({ trig = ";m", dscr = "mu",      condition = u.in_mathzone }, t("\\mu")),
  s({ trig = ";n", dscr = "nu",      condition = u.in_mathzone }, t("\\nu")),
  s({ trig = ";x", dscr = "xi",      condition = u.in_mathzone }, t("\\xi")),
  s({ trig = ";o", dscr = "omicron", condition = u.in_mathzone }, t("\\omicron")),
  s({ trig = ";p", dscr = "pi",      condition = u.in_mathzone }, t("\\pi")),
  s({ trig = ";r", dscr = "rho",     condition = u.in_mathzone }, t("\\rho")),
  s({ trig = ";s", dscr = "sigma",   condition = u.in_mathzone }, t("\\sigma")),
  s({ trig = ";t", dscr = "tau",     condition = u.in_mathzone }, t("\\tau")),
  s({ trig = ";u", dscr = "upsilon", condition = u.in_mathzone }, t("\\upsilon")),
  s({ trig = ";f", dscr = "phi",     condition = u.in_mathzone }, t("\\phi")),
  s({ trig = ";c", dscr = "chi",     condition = u.in_mathzone }, t("\\chi")),
  s({ trig = ";y", dscr = "psi",     condition = u.in_mathzone }, t("\\psi")),
  s({ trig = ";w", dscr = "omega",   condition = u.in_mathzone }, t("\\omega")),

  -- Uppercase: only the letters whose capital actually differs from its
  -- Latin look-alike get a \Xxx command in LaTeX (e.g. capital alpha is
  -- just "A", so \Alpha doesn't exist -- no snippet for those).
  s({ trig = ";G", dscr = "Gamma",   condition = u.in_mathzone }, t("\\Gamma")),
  s({ trig = ";D", dscr = "Delta",   condition = u.in_mathzone }, t("\\Delta")),
  s({ trig = ";T", dscr = "Theta",   condition = u.in_mathzone }, t("\\Theta")),
  s({ trig = ";L", dscr = "Lambda",  condition = u.in_mathzone }, t("\\Lambda")),
  s({ trig = ";X", dscr = "Xi",      condition = u.in_mathzone }, t("\\Xi")),
  s({ trig = ";P", dscr = "Pi",      condition = u.in_mathzone }, t("\\Pi")),
  s({ trig = ";S", dscr = "Sigma",   condition = u.in_mathzone }, t("\\Sigma")),
  s({ trig = ";U", dscr = "Upsilon", condition = u.in_mathzone }, t("\\Upsilon")),
  s({ trig = ";F", dscr = "Phi",     condition = u.in_mathzone }, t("\\Phi")),
  s({ trig = ";Y", dscr = "Psi",     condition = u.in_mathzone }, t("\\Psi")),
  s({ trig = ";W", dscr = "Omega",   condition = u.in_mathzone }, t("\\Omega")),

  -- Variants. Keyed like the lowercase table above (f -> phi, p -> pi), so
  -- ";vp" is freed up for varpi instead of colliding with varphi as a
  -- prefix (an autosnippet fires the moment its trigger is matched, so
  -- ";vp" would always fire before ";vpi" could ever be typed).
  s({ trig = ";ve", dscr = "varepsilon", condition = u.in_mathzone }, t("\\varepsilon")),
  s({ trig = ";vt", dscr = "vartheta",   condition = u.in_mathzone }, t("\\vartheta")),
  s({ trig = ";vf", dscr = "varphi",     condition = u.in_mathzone }, t("\\varphi")),
  s({ trig = ";vp", dscr = "varpi",      condition = u.in_mathzone }, t("\\varpi")),
  s({ trig = ";vr", dscr = "varrho",     condition = u.in_mathzone }, t("\\varrho")),
  s({ trig = ";vs", dscr = "varsigma",   condition = u.in_mathzone }, t("\\varsigma")),
  s({ trig = ";vk", dscr = "varkappa",   condition = u.in_mathzone }, t("\\varkappa")),
}
