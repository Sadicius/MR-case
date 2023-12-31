
fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"
client_scripts {
	'config.lua',
	'client/main.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
 -- '@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server_config.lua',
	'server/main.lua',
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/font/*.ttf',
	'html/font/*.otf',
	'html/css/*.css',
	'html/sounds/*.mp3',
	'html/images/src/*.jpg',
	'html/images/src/*.png',
	'html/images/items/*.jpg',
	'html/images/items/*.png',
	'html/js/*.js',
}

escrow_ignore {
	'config.lua',
	'server_config.lua',
	'client/main.lua',
	'server/main.lua',
}  


lua54 'on'
dependency '/assetpacks'