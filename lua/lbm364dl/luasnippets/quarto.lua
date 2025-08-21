return {
  s(
    { trig = "tt", snippetType = "autosnippet" },
    fmta("\\texttt{<>}", { i(1) })
  ),
  s(
    { trig = "ff", snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", { i(1), i(2) })
  ),

  -- Greek letters
  s(
    { trig = ";a", snippetType = "autosnippet" },
    {
      t("\\alpha")
    }
  ),
  s(
    { trig = ";b", snippetType = "autosnippet" },
    {
      t("\\beta")
    }
  ),
  s(
    { trig = ";g", snippetType = "autosnippet" },
    {
      t("\\gamma")
    }
  ),
  s(
    { trig = ";t", snippetType = "autosnippet" },
    {
      t("\\tau")
    }
  ),
  s(
    { trig = ";f", snippetType = "autosnippet" },
    {
      t("\\phi")
    }
  ),
  s(
    { trig = ";e", snippetType = "autosnippet" },
    {
      t("\\epsilon")
    }
  ),
  s(
    { trig = ";s", snippetType = "autosnippet" },
    {
      t("\\sigma")
    }
  ),
  s(
    { trig = ";o", snippetType = "autosnippet" },
    {
      t("\\omega")
    }
  ),
  s({ trig = "env", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),
  s({ trig = "__", snippetType = "autosnippet", wordTrig = false },
    fmta([[_{<>}]], { i(1), })
  ),
  s({ trig = "uu", snippetType = "autosnippet", wordTrig = false },
    fmta([[^{<>}]], { i(1), })
  ),
  s({ trig = "mm", snippetType = "autosnippet" },
    fmta([[ $<>$ ]], { i(1), })
  ),
  s({ trig = "sq", snippetType = "autosnippet" },
    fmta([[\sqrt{<>}]], { i(1), })
  ),
  s({ trig = "nsq", snippetType = "autosnippet" },
    fmta([[\sqrt[<>]{<>}]], { i(1), i(2) })
  ),
  s({ trig = "((", snippetType = "autosnippet" },
    fmta([[(<>)]], { i(1) })
  ),
  s({ trig = "dmm", snippetType = "autosnippet" },
    fmta(
      [[
      $$ 
        <>
      $$ 
    ]],
      {
        i(1),
      }
    )
  ),
  s({ trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
    fmta(
      [[\href{<>}{<>}]],
      {
        i(1, "url"),
        i(2, "display name"),
      }
    )
  ),

}
