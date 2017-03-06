#
# Shortcut for making post
#

import os

print("Hugo make post")
print("Provide slug:")
slug = input()

os.system("hugo new post/{}.md".format(slug))
os.system("atom content/post/{}.md".format(slug))
