return {
  s(
    { trig = "callout", snippetType = "autosnippet" },
    fmta(
      [[
    ::: {.callout-<>}
    ## <>
    <>
    :::
    ]],
      {
        i(1), -- callout type
        i(2), -- callout title
        i(3), -- callout body
      }
    )
  ),
  s(
    { trig = "cb", snippetType = "autosnippet" },
    fmta(
      [[
    ```{<>}
    <>
    ```
    ]],
      {
        i(1), -- language
        i(2), -- code
      }
    )
  ),
  s(
    { trig = "tt", snippetType = "autosnippet" },
    fmta("\\texttt{<>}", { i(1) })
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
