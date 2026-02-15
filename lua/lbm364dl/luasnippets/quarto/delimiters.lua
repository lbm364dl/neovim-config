local utils = require("lbm364dl.luasnippets.quarto.utils")

return {
  s({ trig = "((", snippetType = "autosnippet", wordTrig = false }, {
    d(1, function(_, snip)
      -- Check if we are in mathzone AND NOT after a command like \text
      if utils.in_mathzone() and not utils.is_after_latex_command() then
        return sn(nil, fmta([[\left( <> \right)]], { i(1) }))
      else
        return sn(nil, fmta([[(<>)]], { i(1) }))
      end
    end),
  }),
  s({ trig = "{{", snippetType = "autosnippet", wordTrig = false }, {
    d(1, function(_, snip)
      if utils.in_mathzone() and not utils.is_after_latex_command() then
        return sn(nil, fmta([[\left\{ <> \right\}]], { i(1) }))
      else
        return sn(nil, fmta([[{<>}]], { i(1) }))
      end
    end),
  }),
  s({ trig = "[[", snippetType = "autosnippet", wordTrig = false }, {
    d(1, function(_, snip)
      if utils.in_mathzone() and not utils.is_after_latex_command() then
        return sn(nil, fmta([=[\left[ <> \right]]=], { i(1) }))
      else
        return sn(nil, fmta([=[[<>]]=], { i(1) }))
      end
    end),
  }),
  s({ trig = "[a", snippetType = "autosnippet" },
    fmta([[| <> |]], { i(1) })
  ),
  s({ trig = "[n", snippetType = "autosnippet" },
    fmta([[\| <> \|]], { i(1) })
  ),
}
