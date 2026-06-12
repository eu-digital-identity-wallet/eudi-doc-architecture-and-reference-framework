-- LaTeX sectioning stops at level 5 (\subparagraph), so pandoc renders
-- level-6 headings as plain body text without an anchor, and every internal
-- link that targets one is silently dead in the PDF ("undefined reference"
-- warnings in the build log). Render them as a bold block with an explicit
-- anchor instead. Other output formats (DOCX, EPUB) are left untouched.

function Header(el)
  if not FORMAT:match('latex') or el.level <= 5 then
    return nil
  end
  local blocks = {}
  if el.identifier and el.identifier ~= '' then
    table.insert(blocks, pandoc.RawBlock('latex',
      ('\\phantomsection\\label{%s}'):format(el.identifier)))
  end
  table.insert(blocks, pandoc.Para({ pandoc.Strong(el.content) }))
  return blocks
end
