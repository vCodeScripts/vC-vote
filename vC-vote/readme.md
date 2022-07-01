vCode Scripts https://github.com/vCodeScripts  & https://discord.gg/37KhvMstyx

What is This Script? This Script Allows You To Start Votings For An Election. It simplifies the whole process of voting and choosing a mayor/president in-game. 
Everytime you start a election you have to delete everything in votes.json and replace it with {} . This just clears out the table of who voted and for who. To add new candidates and change some settings you can always edit vCode.lua. This is the config of this script. 

Some Examples:

Photo: https://prnt.sc/bkNn0jwDz2i9

Video: https://streamable.com/e8y9jt

Metadata Item Photo: https://prnt.sc/s2LvRV1XQ5P

Dependencies:
qb-core
qb-inventory (If you want the votingpin item option)


Installation: If you don't want to give a Voting Pin After Someone Voted, You Can Just Drag And Drop Our Script Into Your Resources Folder.


### FOR PEOPLE WHO WANT THE META-ITEM OPTION

FIRST: Enable vCode.GiveItem in vCode.lua, you can do that by changing the option from false to true. 

Secondly, add this line of code into your items.lua (qb-core/shared/items.lua)
['votingpin'] 			 = {['name'] = 'votingpin', 			  	['label'] = 'I Voted!', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'votingpin.png', 	['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'You Voted'},

Then, Add The Image Inside The inv-img folder into your qb-inventory/html/images/ folder.

Then Head On Into the js folder in qb-inventory/html. Open the app.js file.

Once Opened, Search For FormatItemInfo. You Should find a function named FormatItemInfo. 

Paste The Below Given Code Into The Function

else if (itemData.name == "votingpin") {
            console.log('geldi')
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
            "<p><strong>Election:  </strong><span>" +
                itemData.info.election +
                "</span></p>");
}

Your Code Should Look Something Like This:  https://prnt.sc/V1P80U12F3wO

Then You Are Finished And Ready To Go, Startup Your Server And Have Fun. 


### DISCLAIMER ! DONT FORGET TO RESTART YOUR SERVER AFTER YOU ADDED THE CHANGES IN SHARED.LUA


Have Fun,

whit3 and poyraz - vCode 2022
              

