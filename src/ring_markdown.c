#include "ring.h"

#include "md4c-html.h"
#include "md4c.h"

// Callback for collecting HTML output
static void md_html_output(const MD_CHAR *text, MD_SIZE size, void *userdata)
{
	String *output = (String *)userdata;
	ring_string_add2(output, text, size);
}

// Parser callback handlers
static int enter_block_callback(MD_BLOCKTYPE type, void *detail, void *userdata)
{
	if (!userdata)
		return 0;
	List *list = (List *)userdata;
	ring_list_addint(list, type);
	return 0;
}

static int leave_block_callback(MD_BLOCKTYPE type, void *detail, void *userdata)
{
	return 0;
}

static int enter_span_callback(MD_SPANTYPE type, void *detail, void *userdata)
{
	return 0;
}

static int leave_span_callback(MD_SPANTYPE type, void *detail, void *userdata)
{
	return 0;
}

static int text_callback(MD_TEXTTYPE type, const MD_CHAR *text, MD_SIZE size, void *userdata)
{
	if (!userdata)
		return 0;
	List *list = (List *)userdata;
	String *str = ring_string_new(text);
	ring_string_set2(str, text, size);
	ring_list_addstring2(list, ring_string_get(str), ring_string_size(str));
	ring_string_delete(str);
	return 0;
}
RING_FUNC(ring_get_md_block_doc)
{
	RING_API_RETNUMBER(MD_BLOCK_DOC);
}

RING_FUNC(ring_get_md_block_quote)
{
	RING_API_RETNUMBER(MD_BLOCK_QUOTE);
}

RING_FUNC(ring_get_md_block_ul)
{
	RING_API_RETNUMBER(MD_BLOCK_UL);
}

RING_FUNC(ring_get_md_block_ol)
{
	RING_API_RETNUMBER(MD_BLOCK_OL);
}

RING_FUNC(ring_get_md_block_li)
{
	RING_API_RETNUMBER(MD_BLOCK_LI);
}

RING_FUNC(ring_get_md_block_hr)
{
	RING_API_RETNUMBER(MD_BLOCK_HR);
}

RING_FUNC(ring_get_md_block_h)
{
	RING_API_RETNUMBER(MD_BLOCK_H);
}

RING_FUNC(ring_get_md_block_code)
{
	RING_API_RETNUMBER(MD_BLOCK_CODE);
}

RING_FUNC(ring_get_md_block_html)
{
	RING_API_RETNUMBER(MD_BLOCK_HTML);
}

RING_FUNC(ring_get_md_block_p)
{
	RING_API_RETNUMBER(MD_BLOCK_P);
}

RING_FUNC(ring_get_md_block_table)
{
	RING_API_RETNUMBER(MD_BLOCK_TABLE);
}

RING_FUNC(ring_get_md_block_thead)
{
	RING_API_RETNUMBER(MD_BLOCK_THEAD);
}

RING_FUNC(ring_get_md_block_tbody)
{
	RING_API_RETNUMBER(MD_BLOCK_TBODY);
}

RING_FUNC(ring_get_md_block_tr)
{
	RING_API_RETNUMBER(MD_BLOCK_TR);
}

RING_FUNC(ring_get_md_block_th)
{
	RING_API_RETNUMBER(MD_BLOCK_TH);
}

RING_FUNC(ring_get_md_block_td)
{
	RING_API_RETNUMBER(MD_BLOCK_TD);
}

RING_FUNC(ring_get_md_span_em)
{
	RING_API_RETNUMBER(MD_SPAN_EM);
}

RING_FUNC(ring_get_md_span_strong)
{
	RING_API_RETNUMBER(MD_SPAN_STRONG);
}

RING_FUNC(ring_get_md_span_a)
{
	RING_API_RETNUMBER(MD_SPAN_A);
}

RING_FUNC(ring_get_md_span_img)
{
	RING_API_RETNUMBER(MD_SPAN_IMG);
}

RING_FUNC(ring_get_md_span_code)
{
	RING_API_RETNUMBER(MD_SPAN_CODE);
}

RING_FUNC(ring_get_md_span_del)
{
	RING_API_RETNUMBER(MD_SPAN_DEL);
}

RING_FUNC(ring_get_md_span_latexmath)
{
	RING_API_RETNUMBER(MD_SPAN_LATEXMATH);
}

RING_FUNC(ring_get_md_span_latexmath_display)
{
	RING_API_RETNUMBER(MD_SPAN_LATEXMATH_DISPLAY);
}

RING_FUNC(ring_get_md_span_wikilink)
{
	RING_API_RETNUMBER(MD_SPAN_WIKILINK);
}

RING_FUNC(ring_get_md_span_u)
{
	RING_API_RETNUMBER(MD_SPAN_U);
}

RING_FUNC(ring_get_md_text_normal)
{
	RING_API_RETNUMBER(MD_TEXT_NORMAL);
}

RING_FUNC(ring_get_md_text_nullchar)
{
	RING_API_RETNUMBER(MD_TEXT_NULLCHAR);
}

RING_FUNC(ring_get_md_text_br)
{
	RING_API_RETNUMBER(MD_TEXT_BR);
}

RING_FUNC(ring_get_md_text_softbr)
{
	RING_API_RETNUMBER(MD_TEXT_SOFTBR);
}

RING_FUNC(ring_get_md_text_entity)
{
	RING_API_RETNUMBER(MD_TEXT_ENTITY);
}

RING_FUNC(ring_get_md_text_code)
{
	RING_API_RETNUMBER(MD_TEXT_CODE);
}

RING_FUNC(ring_get_md_text_html)
{
	RING_API_RETNUMBER(MD_TEXT_HTML);
}

RING_FUNC(ring_get_md_text_latexmath)
{
	RING_API_RETNUMBER(MD_TEXT_LATEXMATH);
}

RING_FUNC(ring_get_md_flag_collapsewhitespace)
{
	RING_API_RETNUMBER(MD_FLAG_COLLAPSEWHITESPACE);
}

RING_FUNC(ring_get_md_flag_permissiveatxheaders)
{
	RING_API_RETNUMBER(MD_FLAG_PERMISSIVEATXHEADERS);
}

RING_FUNC(ring_get_md_flag_permissiveurlautolinks)
{
	RING_API_RETNUMBER(MD_FLAG_PERMISSIVEURLAUTOLINKS);
}

RING_FUNC(ring_get_md_flag_permissiveemailautolinks)
{
	RING_API_RETNUMBER(MD_FLAG_PERMISSIVEEMAILAUTOLINKS);
}

RING_FUNC(ring_get_md_flag_noindentedcodeblocks)
{
	RING_API_RETNUMBER(MD_FLAG_NOINDENTEDCODEBLOCKS);
}

RING_FUNC(ring_get_md_flag_nohtmlblocks)
{
	RING_API_RETNUMBER(MD_FLAG_NOHTMLBLOCKS);
}

RING_FUNC(ring_get_md_flag_nohtmlspans)
{
	RING_API_RETNUMBER(MD_FLAG_NOHTMLSPANS);
}

RING_FUNC(ring_get_md_flag_tables)
{
	RING_API_RETNUMBER(MD_FLAG_TABLES);
}

RING_FUNC(ring_get_md_flag_strikethrough)
{
	RING_API_RETNUMBER(MD_FLAG_STRIKETHROUGH);
}

RING_FUNC(ring_get_md_flag_permissivewwwautolinks)
{
	RING_API_RETNUMBER(MD_FLAG_PERMISSIVEWWWAUTOLINKS);
}

RING_FUNC(ring_get_md_flag_tasklists)
{
	RING_API_RETNUMBER(MD_FLAG_TASKLISTS);
}

RING_FUNC(ring_get_md_flag_latexmathspans)
{
	RING_API_RETNUMBER(MD_FLAG_LATEXMATHSPANS);
}

RING_FUNC(ring_get_md_flag_wikilinks)
{
	RING_API_RETNUMBER(MD_FLAG_WIKILINKS);
}

RING_FUNC(ring_get_md_flag_underline)
{
	RING_API_RETNUMBER(MD_FLAG_UNDERLINE);
}

RING_FUNC(ring_get_md_flag_hard_soft_breaks)
{
	RING_API_RETNUMBER(MD_FLAG_HARD_SOFT_BREAKS);
}

RING_FUNC(ring_get_md_flag_permissiveautolinks)
{
	RING_API_RETNUMBER(MD_FLAG_PERMISSIVEAUTOLINKS);
}

RING_FUNC(ring_get_md_flag_nohtml)
{
	RING_API_RETNUMBER(MD_FLAG_NOHTML);
}

RING_FUNC(ring_get_md_dialect_commonmark)
{
	RING_API_RETNUMBER(MD_DIALECT_COMMONMARK);
}

RING_FUNC(ring_get_md_dialect_github)
{
	RING_API_RETNUMBER(MD_DIALECT_GITHUB);
}

RING_FUNC(ring_get_md_html_flag_debug)
{
	RING_API_RETNUMBER(MD_HTML_FLAG_DEBUG);
}

RING_FUNC(ring_get_md_html_flag_verbatim_entities)
{
	RING_API_RETNUMBER(MD_HTML_FLAG_VERBATIM_ENTITIES);
}

RING_FUNC(ring_get_md_html_flag_skip_utf8_bom)
{
	RING_API_RETNUMBER(MD_HTML_FLAG_SKIP_UTF8_BOM);
}

RING_FUNC(ring_get_md_html_flag_xhtml)
{
	RING_API_RETNUMBER(MD_HTML_FLAG_XHTML);
}

RING_FUNC(ring_md_parse)
{
	if (RING_API_PARACOUNT != 2)
	{
		RING_API_ERROR(RING_API_MISS2PARA);
		return;
	}
	RING_API_IGNORECPOINTERTYPE;
	if (!RING_API_ISSTRING(1))
	{
		RING_API_ERROR(RING_API_BADPARATYPE);
		return;
	}
	if (!RING_API_ISLIST(2))
	{
		RING_API_ERROR(RING_API_BADPARATYPE);
		return;
	}

	MD_PARSER parser = {0};
	parser.enter_block = enter_block_callback;
	parser.leave_block = leave_block_callback;
	parser.enter_span = enter_span_callback;
	parser.leave_span = leave_span_callback;
	parser.text = text_callback;

	List *list = RING_API_GETLIST(2);
	RING_API_RETNUMBER(md_parse(RING_API_GETSTRING(1), strlen(RING_API_GETSTRING(1)), &parser, (void *)list));
}

RING_FUNC(ring_md_html)
{
	if (RING_API_PARACOUNT != 2)
	{
		RING_API_ERROR(RING_API_MISS2PARA);
		return;
	}
	RING_API_IGNORECPOINTERTYPE;
	if (!RING_API_ISSTRING(1))
	{
		RING_API_ERROR(RING_API_BADPARATYPE);
		return;
	}
	if (!RING_API_ISNUMBER(2))
	{
		RING_API_ERROR(RING_API_BADPARATYPE);
		return;
	}

	String *output = ring_string_new("");
	unsigned flags = RING_API_GETNUMBER(2);

	int result = md_html(RING_API_GETSTRING(1), strlen(RING_API_GETSTRING(1)), md_html_output, output, flags, 0);

	if (result == 0)
	{
		RING_API_RETSTRING2(ring_string_get(output), ring_string_size(output));
	}
	else
	{
		RING_API_RETNUMBER(result);
	}
	ring_string_delete(output);
}
RING_LIBINIT
{
	RING_API_REGISTER("md_parse", ring_md_parse);
	RING_API_REGISTER("md_html", ring_md_html);
	RING_API_REGISTER("get_md_block_doc", ring_get_md_block_doc);
	RING_API_REGISTER("get_md_block_quote", ring_get_md_block_quote);
	RING_API_REGISTER("get_md_block_ul", ring_get_md_block_ul);
	RING_API_REGISTER("get_md_block_ol", ring_get_md_block_ol);
	RING_API_REGISTER("get_md_block_li", ring_get_md_block_li);
	RING_API_REGISTER("get_md_block_hr", ring_get_md_block_hr);
	RING_API_REGISTER("get_md_block_h", ring_get_md_block_h);
	RING_API_REGISTER("get_md_block_code", ring_get_md_block_code);
	RING_API_REGISTER("get_md_block_html", ring_get_md_block_html);
	RING_API_REGISTER("get_md_block_p", ring_get_md_block_p);
	RING_API_REGISTER("get_md_block_table", ring_get_md_block_table);
	RING_API_REGISTER("get_md_block_thead", ring_get_md_block_thead);
	RING_API_REGISTER("get_md_block_tbody", ring_get_md_block_tbody);
	RING_API_REGISTER("get_md_block_tr", ring_get_md_block_tr);
	RING_API_REGISTER("get_md_block_th", ring_get_md_block_th);
	RING_API_REGISTER("get_md_block_td", ring_get_md_block_td);
	RING_API_REGISTER("get_md_span_em", ring_get_md_span_em);
	RING_API_REGISTER("get_md_span_strong", ring_get_md_span_strong);
	RING_API_REGISTER("get_md_span_a", ring_get_md_span_a);
	RING_API_REGISTER("get_md_span_img", ring_get_md_span_img);
	RING_API_REGISTER("get_md_span_code", ring_get_md_span_code);
	RING_API_REGISTER("get_md_span_del", ring_get_md_span_del);
	RING_API_REGISTER("get_md_span_latexmath", ring_get_md_span_latexmath);
	RING_API_REGISTER("get_md_span_latexmath_display", ring_get_md_span_latexmath_display);
	RING_API_REGISTER("get_md_span_wikilink", ring_get_md_span_wikilink);
	RING_API_REGISTER("get_md_span_u", ring_get_md_span_u);
	RING_API_REGISTER("get_md_text_normal", ring_get_md_text_normal);
	RING_API_REGISTER("get_md_text_nullchar", ring_get_md_text_nullchar);
	RING_API_REGISTER("get_md_text_br", ring_get_md_text_br);
	RING_API_REGISTER("get_md_text_softbr", ring_get_md_text_softbr);
	RING_API_REGISTER("get_md_text_entity", ring_get_md_text_entity);
	RING_API_REGISTER("get_md_text_code", ring_get_md_text_code);
	RING_API_REGISTER("get_md_text_html", ring_get_md_text_html);
	RING_API_REGISTER("get_md_text_latexmath", ring_get_md_text_latexmath);
	RING_API_REGISTER("get_md_flag_collapsewhitespace", ring_get_md_flag_collapsewhitespace);
	RING_API_REGISTER("get_md_flag_permissiveatxheaders", ring_get_md_flag_permissiveatxheaders);
	RING_API_REGISTER("get_md_flag_permissiveurlautolinks", ring_get_md_flag_permissiveurlautolinks);
	RING_API_REGISTER("get_md_flag_permissiveemailautolinks", ring_get_md_flag_permissiveemailautolinks);
	RING_API_REGISTER("get_md_flag_noindentedcodeblocks", ring_get_md_flag_noindentedcodeblocks);
	RING_API_REGISTER("get_md_flag_nohtmlblocks", ring_get_md_flag_nohtmlblocks);
	RING_API_REGISTER("get_md_flag_nohtmlspans", ring_get_md_flag_nohtmlspans);
	RING_API_REGISTER("get_md_flag_tables", ring_get_md_flag_tables);
	RING_API_REGISTER("get_md_flag_strikethrough", ring_get_md_flag_strikethrough);
	RING_API_REGISTER("get_md_flag_permissivewwwautolinks", ring_get_md_flag_permissivewwwautolinks);
	RING_API_REGISTER("get_md_flag_tasklists", ring_get_md_flag_tasklists);
	RING_API_REGISTER("get_md_flag_latexmathspans", ring_get_md_flag_latexmathspans);
	RING_API_REGISTER("get_md_flag_wikilinks", ring_get_md_flag_wikilinks);
	RING_API_REGISTER("get_md_flag_underline", ring_get_md_flag_underline);
	RING_API_REGISTER("get_md_flag_hard_soft_breaks", ring_get_md_flag_hard_soft_breaks);
	RING_API_REGISTER("get_md_flag_permissiveautolinks", ring_get_md_flag_permissiveautolinks);
	RING_API_REGISTER("get_md_flag_nohtml", ring_get_md_flag_nohtml);
	RING_API_REGISTER("get_md_dialect_commonmark", ring_get_md_dialect_commonmark);
	RING_API_REGISTER("get_md_dialect_github", ring_get_md_dialect_github);
	RING_API_REGISTER("get_md_html_flag_debug", ring_get_md_html_flag_debug);
	RING_API_REGISTER("get_md_html_flag_verbatim_entities", ring_get_md_html_flag_verbatim_entities);
	RING_API_REGISTER("get_md_html_flag_skip_utf8_bom", ring_get_md_html_flag_skip_utf8_bom);
	RING_API_REGISTER("get_md_html_flag_xhtml", ring_get_md_html_flag_xhtml);
}
