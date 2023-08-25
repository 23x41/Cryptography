Hack.sh will take a secret message in the form of

hack.sh plain.txt 21

and iterate n number of cycles through base 16,32,64 and hex

and save that encryption order in a key.txt file which

Dehack will use to decrypt and reverse the message secret.txt

usage:


dehack.sh secret.txt


encode&decode Programs take arguement of n times to be encoded/decoded in base64

example usage: ./encode.sh 42 plaintext.msg > secret.txt

./decode.sh 42 secret.txt > cracked.msg

┌──(q㉿QILIN-2341)-[~]
└─$ ./decode.sh 4 secret.txt && wc -m secret.txt && cat secret.txt                
this is a secret message
102 secret.txt
V2tWa2IyTkhUalZSYmtKcVpWVktiMU5WYUU5aVJtdDZVMjE0YTFFd1NqQlhiR2hQWld4c1dGcEhl
RVJhZWpBNVEyYzlQUW89Cg==
                                                                                                                
┌──(q㉿QILIN-2341)-[~]
└─$ ./decode.sh 2 secret.txt > secret1.txt && wc -m secret1.txt && cat secret1.txt
53 secret1.txt
ZEdocGN5QnBjeUJoSUhObFkzSmxkQ0J0WlhOellXZGxDZz09Cg==
                                                                                                                
┌──(q㉿QILIN-2341)-[~]
└─$ ./encode.sh 2 plaintext.msg > secret.txt && wc -m secret.txt && cat secret.txt
53 secret.txt
ZEdocGN5QnBjeUJoSUhObFkzSmxkQ0J0WlhOellXZGxDZz09Cg==

