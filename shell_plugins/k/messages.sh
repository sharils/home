#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

messages() {
  cat <<'EOF' | bat --style=plain
Messages
Open Messages settings                                             	Command-Comma (,)
Hide Messages                                                      	Command-H
Hide everything except Messages                                    	Option-Command-H
Quit Messages                                                      	Command-Q
Start a new message                                                	Command-N
Open the Messages window                                           	Command-0
Close the Messages window                                          	Command-W
Print the conversation                                             	Command-P
Show all Messages conversations                                    	Control-Command-1
Show conversations from known senders                              	Control-Command-2
Show conversations from unknown senders                            	Control-Command-3
Show conversations with unread messages                            	Control-Command-4
Show recently deleted messages or conversations                    	Control-Command-5
Search all conversations                                           	Command-F
Go to a pinned conversation                                        	Command-[number] (press 1 through 9 for the pinned conversation you want)
Go to the first unpinned conversation                              	Option-Command-1
Open the Emoji & Symbols window                                    	Control-Command-Space
Minimize a window                                                  	Command-M
Enter full-screen view                                             	Control-Command-F

Conversations
Make the text bigger                                               	Command-Plus Sign (+)
Make the text smaller                                              	Command-Minus Sign (–)
Insert a line break or create a new paragraph in a message         	Option-Return or Shift-Return
Send a message                                                     	Return
Edit a sent message                                                	Command-E
Copy the selected text                                             	Command-C
Paste copied text                                                  	Command-V
Open the Spelling and Grammar window                               	Shift-Command-Colon (:)
Check the text field for spelling and grammar issues               	Command-Semicolon (;)
Reply to the last incoming (or selected) message in a conversation 	Command-R
Add a Tapback to the last (or selected) message in a conversation  	Command-T, then press 1 through 6 for the Tapback you want
Select the next conversation                                       	Control-Tab
Select the previous conversation                                   	Control-Shift-Tab
Open the conversation Info view                                    	Command-I
Hide or unhide alerts for a conversation                           	Option-Command-M
Mark a conversation as unread or read                              	Shift-Command-U
Open the Contact card for the conversation recipient               	Option-Command-B
Send an email to a selected person in the conversation             	Option-Command-E
Show video effects (while in a video call in Messages)             	Shift-Command-E
Show the selected image in the Quick Look window                   	Space
Delete a single message                                            	Delete (first, select the message)

https://support.apple.com/guide/messages/keyboard-shortcuts-ichtc78b3bff/mac
EOF
}

messages "$@"
