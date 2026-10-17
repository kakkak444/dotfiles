---------------
---- INPUT ----
---------------

hl.device({
	name = "elecom-trackball-mouse-deft-pro-trackball-mouse",
	sensitivity = 0,
	scroll_method = "on_button_down",
	scroll_button = 278,
	scroll_button_lock = true,
})

hl.device({
	name = "logitech-g304-1",
	sensitivity = 0,
})

hl.config({
        input = {
                kb_layout  = "us",
                kb_variant = "",
                kb_model   = "",
                kb_options = "",
                kb_rules   = "",

                numlock_by_default = true,

                follow_mouse = 1,

                sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

                touchpad = {
                        natural_scroll = false,
                },
        },
})

hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace"
})

