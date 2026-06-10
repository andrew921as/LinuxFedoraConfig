function stOb --description "Start Onedrive for Obsidian"
	rclone mount Onedrive: ~/Onedrive --daemon
end
