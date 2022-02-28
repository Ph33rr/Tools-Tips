
## ABOUT 

This tool 


## install :
 
 
```bash
wget https://raw.githubusercontent.com/Ph33rr/Tools-Tips/main/xss/wordxss.sh
chmod 755 wordxss.sh
./wordxss.sh -h
```


## USE :

```bash
./wordxss.sh -m > events.txt
./wordxss.sh -m | anytool
```
```bash
fuzz -w events.txt -u 'https://www.example.com/"><svg FUZZ=a>' -fc 403 -c
```
```bash
fuzz -w elemnts.txt -u 'https://www.example.com/"><FUZZ onerror=a>' -fc 403 -c
```


### NOTE :

[MDN Documentation](https://developer.mozilla.org/en-US/docs/Web/Events)

[MDN Documentation](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)
