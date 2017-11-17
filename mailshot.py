"""Use mailgun to send mail.

Create file mail.html as a content for the mail.
Create file mailgun-key with just key inside it.
"""
import requests

subject = input("Subject: ")
to = input("To: ")

with open("mailgun-key", encoding='utf-8') as f:
    key = f.read()

with open('mail.html', encoding='utf-8') as f:
    mail = f.read()

print("Key is {}".format(key))
print("Subject is {}".format(subject))
print("To: {}".format(to))
print("Mail:\n{}".format(mail))

test = input("All good? (y/N)\n")
if test == 'y' or test == 'Y':
    r = requests.post(
        "https://api.mailgun.net/v3/pr0gramista.pl/messages",
        auth=("api", key),
        data={
            "subject": subject,
            "to": to,
            "from": "Bartosz Wiśniewski <kontakt@pr0gramista.pl>",
            "text": mail
        }
    )
    print(r.text)