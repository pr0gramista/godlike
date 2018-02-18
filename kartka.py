password = list('HASLOHEREPLZ'.lower()) # Usuwamy potwarzajace sie literki

alfa = [chr(ord('a') + a) for a in range(0, 26)] # Alfabet to początek słownika
print(alfa)

for p in password: # Usuwamy literki znajdujące się w haśle z słownika
    try:
        alfa.remove(p)
    except ValueError:
        pass

alfa = password + alfa # Dodajemy hasło na początek słownika
print(alfa)

alfa = alfa[13:26] + alfa[0:13] # Przesuwamy nasz słownik (nowy alfabet) o 13 miejsc
print(alfa)

message = 'MIKV ZYTGB FEJFN GWN BEWVA YNF VGXTWAYT YEYGW F HGKVT IZFGV JYNW RAFMCA MWG GMCTGKG'.lower()
final = ''

for c in message:
    if c == ' ':
        final += c
        continue

    v = chr(ord('a') + alfa.index(c))
    final += v

print(final)
