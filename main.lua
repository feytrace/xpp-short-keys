function initUi()
	--
	--	tool shortcuts, refer to 
	--	https://github.com/xournalpp/xournalpp/src/core/plugin/ActionBackwardCompatibilityLayer.cpp
	--	for the action names, menu is arbitrary(?)
	--
    app.registerUi({
        ["menu"] = "pen tool",
        ["callback"] = "pen",
        ["accelerator"] = "b"
    });
    app.registerUi({
        ["menu"] = "eraser tool",
        ["callback"] = "eraser",
        ["accelerator"] = "e"
    });
        app.registerUi({
        ["menu"] = "rectangular select tool",
        ["callback"] = "rect_sel",
        ["accelerator"] = "r"
    });
    app.registerUi({
        ["menu"] = "hand tool",
        ["callback"] = "hand",
        ["accelerator"] = "x"
    });
	-- 
	--	page management
	--
	app.registerUi({
        ["menu"] = "new page",
        ["callback"] = "new_page",
        ["accelerator"] = "n"
    });
	app.registerUi({
        ["menu"] = "duplicate page",
        ["callback"] = "dupl_page",
        ["accelerator"] = "m"
    });
	app.registerUi({
        ["menu"] = "previous page",
        ["callback"] = "prev_page",
        ["accelerator"] = "j"
    });
	app.registerUi({
        ["menu"] = "next page",
        ["callback"] = "next_page",
        ["accelerator"] = "k"
    });
	app.registerUi({
        ["menu"] = "delete page",
        ["callback"] = "del_page",
        ["accelerator"] = "q"
    });
	--
	--	size management
	--
	app.registerUi({
        ["menu"] = "size down",
        ["callback"] = "size_down",
        ["accelerator"] = "i"
    });
	app.registerUi({
        ["menu"] = "size up",
        ["callback"] = "size_up",
        ["accelerator"] = "o"
    });
	--
	--	export management
	--
	app.registerUi({
		["menu"] = "export as pdf",
		["callback"] = "export_pdf",
		["accelerator"] = "p"
	})
end
--
--	tool shortcut functions
--
function pen()
    app.uiAction({ ["action"] = "ACTION_TOOL_PEN" })
end

function eraser()
    app.uiAction({ ["action"] = "ACTION_TOOL_ERASER" })
end

function rect_sel()
    app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_RECT" })
end

function hand()
    app.uiAction({ ["action"] = "ACTION_TOOL_HAND" })
end
--
--	page management functions
--
function new_page()
	app.uiAction({ ["action"] = "ACTION_NEW_PAGE_AFTER" })
end

function dupl_page()
	app.uiAction({ ["action"] = "ACTION_DUPLICATE_PAGE" })
end

function prev_page()
	app.uiAction({ ["action"] = "ACTION_GOTO_BACK" })
end

function next_page()
	app.uiAction({ ["action"] = "ACTION_GOTO_NEXT" })
end

function del_page()
	app.uiAction({ ["action"] = "ACTION_DELETE_PAGE" })
end
--
--	size management functions
--
_G['current_size'] = 1
_G['size_array'] = {"ACTION_SIZE_VERY_FINE", "ACTION_SIZE_FINE", "ACTION_SIZE_MEDIUM", "ACTION_SIZE_THICK", "ACTION_SIZE_VERY_THICK"}

function size_down()
	if current_size == 1 then
		current_size = 1
	else
		current_size = current_size - 1
	end
	
	app.uiAction({ ["action"] = size_array[current_size] })
end

function size_up()
	if current_size == 5 then
		current_size = 5
	else
		current_size = current_size + 1
	end

	app.uiAction({ ["action"] = size_array[current_size] })
end
--
--	export management
--
function export_pdf()
	app.uiAction({ ["action"] = "ACTION_EXPORT_AS_PDF" })
end
