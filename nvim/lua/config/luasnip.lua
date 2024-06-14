local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local br = function() return t({"", ""}) end

ls.add_snippets("typescript", {
  -- import { $! } from '$2'
  s("imp", {
    t("import "),
    i(1),
    t(" from '"),
    i(2),
    t("'"),
    i(0),
  }),
  -- import $! from '$2'
  s("impn", {
    t("import { "),
    i(1),
    t(" } from '"),
    i(2),
    t("'"),
    i(0),
  }),
  s("ho", {
    t("const "),
    i(1),
    t(" = () => {"),
    br(),
    t("  return {"),
    br(),
    i(0),
    br(),
    t("  }"),
    br(),
    t("}"),
    br(),
    br(),
    t("export default "),
    f(function(args) return args[1] end, {1}),
  }),
  -- useState
  s("uses", {
    t("const ["),
    i(1),
    t(", set"),
    f(function(args)
      return args[1][1]:gsub("^%l", string.upper)
    end, { 1 }),
    t("] = useState<"),
    i(3),
    t(">("),
    i(2),
    t(")"),
    i(0),
  }),
})

ls.add_snippets("typescriptreact", {
  -- import { $! } from '$2'
  s("imp", {
    t("import "),
    i(1),
    t(" from '"),
    i(2),
    t("'"),
    i(0),
  }),
  -- import $! from '$2'
  s("impn", {
    t("import { "),
    i(1),
    t(" } from '"),
    i(2),
    t("'"),
    i(0),
  }),
  -- useState
  s("uses", {
    t("const ["),
    i(1),
    t(", set"),
    f(function(args)
      return args[1][1]:gsub("^%l", string.upper)
    end, { 1 }),
    t("] = useState<"),
    i(3),
    t(">("),
    i(2),
    t(")"),
    i(0),
  }),
  s("de", {
    t("import type { ReactElement } from 'react'"),
    br(),
    br(),
    t("const "),
    i(1),
    t(" = (): ReactElement | null => {"),
    br(),
    br(),
    t("  return ("),
    br(),
    t("    "),
    i(0),
    br(),
    t("  )"),
    br(),
    t("}"),
    br(),
    br(),
    t("export default "),
    f(function(args) return args[1] end, {1}),
  }),
})
