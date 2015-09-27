Config.notification =
	stack_topleft: {"dir1": "down", "dir2": "right", "push": "top"};
	stack_bottomleft: {"dir1": "right", "dir2": "up", "push": "top"};
	stack_bar_top: {"dir1": "down", "dir2": "right", "push": "top", "spacing1": 0, "spacing2": 0};
	stack_bar_bottom: {"dir1": "up", "dir2": "right", "spacing1": 0, "spacing2": 0};
	# stack_context: {"dir1": "down", "dir2": "left", "context": $("#stack-context")};
	stack_bottomright: {"dir1": "up", "dir2": "left", "firstpos1": 25, "firstpos2": 25};

	alert: (title, text)->
		new PNotify 
			text: text
			delay: 1500
			type: "alert"
			addclass: "stack-bottomright"
			stack: @stack_bottomright

	success: (title, text=null, delay=2000)->
		new PNotify 
			# text: text
			title: title
			delay: delay
			type: "success"
			# addclass: "stack-bottomright"
			# stack: @stack_bottomright
			nonblock:
				nonblock: true,
				nonblock_opacity: .2
			