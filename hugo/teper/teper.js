<!--
function fixe (img,alt)
 {document.write('<TR><TD><IMG src="'+img+'2.gif" alt="'+alt+'"></TR>');}

function swap (img,n)
 {eval('window.document.'+img).src = img+n+".gif";}

function bouton (url,img,alt)
{
 document.write(
 '<TR><TD><A href="'+url+'" onmouseover="swap'
+"('"+img+"','1')"
+';" onmouseout="swap'
+"('"+img+"','0')"
+';"><IMG src="'+img+'0.gif" name="'+img+'" border=0 border=0 alt="'+alt+'"></A></TR>');
}
//-->
