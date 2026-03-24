local function matrix_nodes(args, snip)
  local rows = tonumber(snip.captures[1]) or 2
  local cols = tonumber(snip.captures[2]) or 2
  local nodes = {}

  for r = 1, rows do
    local row_nodes = {}
    for c = 1, cols do
      table.insert(row_nodes, i((r - 1) * cols + c, "")) -- placeholder
      if c < cols then
        table.insert(row_nodes, t(" & "))
      end
    end
    if r < rows then
      table.insert(row_nodes, t({ " \\\\", "" }))
    end
    vim.list_extend(nodes, row_nodes)
  end

  return sn(nil, nodes)
end

return {
  s(
    { trig = "ff", snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", { i(1), i(2) })
  ),
  s(
    { trig = ";v", snippetType = "autosnippet" },
    fmta([[\vec{<>}]], { i(1), })
  ),
  s(
    { trig = ",s", snippetType = "autosnippet" },
    {
      t("\\subset")
    }
  ),
  s(
    { trig = ",x", snippetType = "autosnippet" },
    {
      t("\\times")
    }
  ),
  s(
    { trig = ",c", snippetType = "autosnippet" },
    {
      t("\\cong")
    }
  ),
  s(
    { trig = ",r", snippetType = "autosnippet" },
    {
      t("\\rightarrow")
    }
  ),
  s(
    { trig = ",o", snippetType = "autosnippet" },
    {
      t("\\circ")
    }
  ),
  s(
    { trig = ",i", snippetType = "autosnippet" },
    {
      t("\\cap")
    }
  ),
  s(
    { trig = ",m", snippetType = "autosnippet" },
    {
      t("\\mid")
    }
  ),
  s(
    { trig = ",.", snippetType = "autosnippet" },
    {
      t("\\dots")
    }
  ),
  s(
    { trig = "mbb", snippetType = "autosnippet" },
    fmta([[\mathbb{<>}]], { i(1), })
  ),
  s(
    { trig = "mff", snippetType = "autosnippet" },
    fmta([[\mathfrak{<>}]], { i(1), })
  ),
  s(
    { trig = "tcos", snippetType = "autosnippet" },
    fmta([[\cos{<>}]], { i(1), })
  ),
  s(
    { trig = "tsin", snippetType = "autosnippet" },
    fmta([[\sin{<>}]], { i(1), })
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
  s({ trig = "mat(%d+),(%d+)", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
    \begin{pmatrix}
    <>
    \end{pmatrix}
    ]],
      {
        d(1, matrix_nodes, {}), -- matrix body generated dynamically
      }
    )
  ),
}
