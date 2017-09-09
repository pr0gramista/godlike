f = open('cheatengine-i386.exe', 'r+b')

print('Loading')
content = f.read()
print(type(content))
print(type(content[0]))
content = bytearray(content)
print(type(content))
print(type(content[0]))
f.close()
print('Processing')

# Cheat Engine
find = [0x43, 0x68, 0x65, 0x61, 0x74, 0x20, 0x45, 0x6E, 0x67, 0x69, 0x6E, 0x65]
# Libre Office
replacement = [0x4C, 0x69, 0x62, 0x72, 0x65, 0x20, 0x4F, 0x66, 0x66, 0x69, 0x63, 0x65]

replaced = 0

for i in range(len(content)):
    bad = False
    for x in range(len(find)):
        if content[i + x] != find[x]:
            bad = True
            break

    # We found it, let's replace it
    if bad == False:
        for x in range(len(replacement)):
            content[i + x] = replacement[x]
            replaced = replaced + 1

print('Replaced {} bytes'.format(replaced))

print('Saving')
f = open('workfile.exe', 'wb')
f.write(content)
f.flush()
f.close()
