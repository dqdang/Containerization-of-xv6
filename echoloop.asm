
_echoloop:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;
  int ticks;

  if (argc < 3) {
   9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
  	printf(1, "usage: echoloop ticks arg1 [arg2 ...]\n");
   f:	c7 44 24 04 40 08 00 	movl   $0x840,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 56 04 00 00       	call   479 <printf>
  	exit();
  23:	e8 d4 02 00 00       	call   2fc <exit>
  }

  ticks = atoi(argv[1]);
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 04             	add    $0x4,%eax
  2e:	8b 00                	mov    (%eax),%eax
  30:	89 04 24             	mov    %eax,(%esp)
  33:	e8 33 02 00 00       	call   26b <atoi>
  38:	89 44 24 18          	mov    %eax,0x18(%esp)

  while(1){
	  for(i = 2; i < argc; i++)
  3c:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
  43:	00 
  44:	eb 48                	jmp    8e <main+0x8e>
    	printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  46:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4a:	40                   	inc    %eax
  4b:	3b 45 08             	cmp    0x8(%ebp),%eax
  4e:	7d 07                	jge    57 <main+0x57>
  50:	b8 67 08 00 00       	mov    $0x867,%eax
  55:	eb 05                	jmp    5c <main+0x5c>
  57:	b8 69 08 00 00       	mov    $0x869,%eax
  5c:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  60:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  67:	8b 55 0c             	mov    0xc(%ebp),%edx
  6a:	01 ca                	add    %ecx,%edx
  6c:	8b 12                	mov    (%edx),%edx
  6e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  72:	89 54 24 08          	mov    %edx,0x8(%esp)
  76:	c7 44 24 04 6b 08 00 	movl   $0x86b,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 ef 03 00 00       	call   479 <printf>
  }

  ticks = atoi(argv[1]);

  while(1){
	  for(i = 2; i < argc; i++)
  8a:	ff 44 24 1c          	incl   0x1c(%esp)
  8e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  92:	3b 45 08             	cmp    0x8(%ebp),%eax
  95:	7c af                	jl     46 <main+0x46>
    	printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
    sleep(ticks);
  97:	8b 44 24 18          	mov    0x18(%esp),%eax
  9b:	89 04 24             	mov    %eax,(%esp)
  9e:	e8 e9 02 00 00       	call   38c <sleep>
  }
  a3:	eb 97                	jmp    3c <main+0x3c>
  a5:	90                   	nop
  a6:	90                   	nop
  a7:	90                   	nop

000000a8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	57                   	push   %edi
  ac:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b0:	8b 55 10             	mov    0x10(%ebp),%edx
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	89 cb                	mov    %ecx,%ebx
  b8:	89 df                	mov    %ebx,%edi
  ba:	89 d1                	mov    %edx,%ecx
  bc:	fc                   	cld    
  bd:	f3 aa                	rep stos %al,%es:(%edi)
  bf:	89 ca                	mov    %ecx,%edx
  c1:	89 fb                	mov    %edi,%ebx
  c3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  c6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  c9:	5b                   	pop    %ebx
  ca:	5f                   	pop    %edi
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    

000000cd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  cd:	55                   	push   %ebp
  ce:	89 e5                	mov    %esp,%ebp
  d0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  d9:	90                   	nop
  da:	8b 45 08             	mov    0x8(%ebp),%eax
  dd:	8d 50 01             	lea    0x1(%eax),%edx
  e0:	89 55 08             	mov    %edx,0x8(%ebp)
  e3:	8b 55 0c             	mov    0xc(%ebp),%edx
  e6:	8d 4a 01             	lea    0x1(%edx),%ecx
  e9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  ec:	8a 12                	mov    (%edx),%dl
  ee:	88 10                	mov    %dl,(%eax)
  f0:	8a 00                	mov    (%eax),%al
  f2:	84 c0                	test   %al,%al
  f4:	75 e4                	jne    da <strcpy+0xd>
    ;
  return os;
  f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  f9:	c9                   	leave  
  fa:	c3                   	ret    

000000fb <strcmp>:

int
strcmp(const char *p, const char *q)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  fe:	eb 06                	jmp    106 <strcmp+0xb>
    p++, q++;
 100:	ff 45 08             	incl   0x8(%ebp)
 103:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 106:	8b 45 08             	mov    0x8(%ebp),%eax
 109:	8a 00                	mov    (%eax),%al
 10b:	84 c0                	test   %al,%al
 10d:	74 0e                	je     11d <strcmp+0x22>
 10f:	8b 45 08             	mov    0x8(%ebp),%eax
 112:	8a 10                	mov    (%eax),%dl
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	8a 00                	mov    (%eax),%al
 119:	38 c2                	cmp    %al,%dl
 11b:	74 e3                	je     100 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	8a 00                	mov    (%eax),%al
 122:	0f b6 d0             	movzbl %al,%edx
 125:	8b 45 0c             	mov    0xc(%ebp),%eax
 128:	8a 00                	mov    (%eax),%al
 12a:	0f b6 c0             	movzbl %al,%eax
 12d:	29 c2                	sub    %eax,%edx
 12f:	89 d0                	mov    %edx,%eax
}
 131:	5d                   	pop    %ebp
 132:	c3                   	ret    

00000133 <strlen>:

uint
strlen(char *s)
{
 133:	55                   	push   %ebp
 134:	89 e5                	mov    %esp,%ebp
 136:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 139:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 140:	eb 03                	jmp    145 <strlen+0x12>
 142:	ff 45 fc             	incl   -0x4(%ebp)
 145:	8b 55 fc             	mov    -0x4(%ebp),%edx
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	01 d0                	add    %edx,%eax
 14d:	8a 00                	mov    (%eax),%al
 14f:	84 c0                	test   %al,%al
 151:	75 ef                	jne    142 <strlen+0xf>
    ;
  return n;
 153:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <memset>:

void*
memset(void *dst, int c, uint n)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 15e:	8b 45 10             	mov    0x10(%ebp),%eax
 161:	89 44 24 08          	mov    %eax,0x8(%esp)
 165:	8b 45 0c             	mov    0xc(%ebp),%eax
 168:	89 44 24 04          	mov    %eax,0x4(%esp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	89 04 24             	mov    %eax,(%esp)
 172:	e8 31 ff ff ff       	call   a8 <stosb>
  return dst;
 177:	8b 45 08             	mov    0x8(%ebp),%eax
}
 17a:	c9                   	leave  
 17b:	c3                   	ret    

0000017c <strchr>:

char*
strchr(const char *s, char c)
{
 17c:	55                   	push   %ebp
 17d:	89 e5                	mov    %esp,%ebp
 17f:	83 ec 04             	sub    $0x4,%esp
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 188:	eb 12                	jmp    19c <strchr+0x20>
    if(*s == c)
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
 18d:	8a 00                	mov    (%eax),%al
 18f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 192:	75 05                	jne    199 <strchr+0x1d>
      return (char*)s;
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	eb 11                	jmp    1aa <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 199:	ff 45 08             	incl   0x8(%ebp)
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	8a 00                	mov    (%eax),%al
 1a1:	84 c0                	test   %al,%al
 1a3:	75 e5                	jne    18a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1a5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1aa:	c9                   	leave  
 1ab:	c3                   	ret    

000001ac <gets>:

char*
gets(char *buf, int max)
{
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1b9:	eb 49                	jmp    204 <gets+0x58>
    cc = read(0, &c, 1);
 1bb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1c2:	00 
 1c3:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1d1:	e8 3e 01 00 00       	call   314 <read>
 1d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1dd:	7f 02                	jg     1e1 <gets+0x35>
      break;
 1df:	eb 2c                	jmp    20d <gets+0x61>
    buf[i++] = c;
 1e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e4:	8d 50 01             	lea    0x1(%eax),%edx
 1e7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1ea:	89 c2                	mov    %eax,%edx
 1ec:	8b 45 08             	mov    0x8(%ebp),%eax
 1ef:	01 c2                	add    %eax,%edx
 1f1:	8a 45 ef             	mov    -0x11(%ebp),%al
 1f4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1f6:	8a 45 ef             	mov    -0x11(%ebp),%al
 1f9:	3c 0a                	cmp    $0xa,%al
 1fb:	74 10                	je     20d <gets+0x61>
 1fd:	8a 45 ef             	mov    -0x11(%ebp),%al
 200:	3c 0d                	cmp    $0xd,%al
 202:	74 09                	je     20d <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 204:	8b 45 f4             	mov    -0xc(%ebp),%eax
 207:	40                   	inc    %eax
 208:	3b 45 0c             	cmp    0xc(%ebp),%eax
 20b:	7c ae                	jl     1bb <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 20d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	01 d0                	add    %edx,%eax
 215:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 218:	8b 45 08             	mov    0x8(%ebp),%eax
}
 21b:	c9                   	leave  
 21c:	c3                   	ret    

0000021d <stat>:

int
stat(char *n, struct stat *st)
{
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
 220:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 223:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 22a:	00 
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
 22e:	89 04 24             	mov    %eax,(%esp)
 231:	e8 06 01 00 00       	call   33c <open>
 236:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 239:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 23d:	79 07                	jns    246 <stat+0x29>
    return -1;
 23f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 244:	eb 23                	jmp    269 <stat+0x4c>
  r = fstat(fd, st);
 246:	8b 45 0c             	mov    0xc(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 250:	89 04 24             	mov    %eax,(%esp)
 253:	e8 fc 00 00 00       	call   354 <fstat>
 258:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25e:	89 04 24             	mov    %eax,(%esp)
 261:	e8 be 00 00 00       	call   324 <close>
  return r;
 266:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 269:	c9                   	leave  
 26a:	c3                   	ret    

0000026b <atoi>:

int
atoi(const char *s)
{
 26b:	55                   	push   %ebp
 26c:	89 e5                	mov    %esp,%ebp
 26e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 271:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 278:	eb 24                	jmp    29e <atoi+0x33>
    n = n*10 + *s++ - '0';
 27a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 27d:	89 d0                	mov    %edx,%eax
 27f:	c1 e0 02             	shl    $0x2,%eax
 282:	01 d0                	add    %edx,%eax
 284:	01 c0                	add    %eax,%eax
 286:	89 c1                	mov    %eax,%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	8d 50 01             	lea    0x1(%eax),%edx
 28e:	89 55 08             	mov    %edx,0x8(%ebp)
 291:	8a 00                	mov    (%eax),%al
 293:	0f be c0             	movsbl %al,%eax
 296:	01 c8                	add    %ecx,%eax
 298:	83 e8 30             	sub    $0x30,%eax
 29b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
 2a1:	8a 00                	mov    (%eax),%al
 2a3:	3c 2f                	cmp    $0x2f,%al
 2a5:	7e 09                	jle    2b0 <atoi+0x45>
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
 2aa:	8a 00                	mov    (%eax),%al
 2ac:	3c 39                	cmp    $0x39,%al
 2ae:	7e ca                	jle    27a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    

000002b5 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c7:	eb 16                	jmp    2df <memmove+0x2a>
    *dst++ = *src++;
 2c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2cc:	8d 50 01             	lea    0x1(%eax),%edx
 2cf:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2d2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d5:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d8:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2db:	8a 12                	mov    (%edx),%dl
 2dd:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2df:	8b 45 10             	mov    0x10(%ebp),%eax
 2e2:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e5:	89 55 10             	mov    %edx,0x10(%ebp)
 2e8:	85 c0                	test   %eax,%eax
 2ea:	7f dd                	jg     2c9 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2ec:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ef:	c9                   	leave  
 2f0:	c3                   	ret    
 2f1:	90                   	nop
 2f2:	90                   	nop
 2f3:	90                   	nop

000002f4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f4:	b8 01 00 00 00       	mov    $0x1,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <exit>:
SYSCALL(exit)
 2fc:	b8 02 00 00 00       	mov    $0x2,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <wait>:
SYSCALL(wait)
 304:	b8 03 00 00 00       	mov    $0x3,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <pipe>:
SYSCALL(pipe)
 30c:	b8 04 00 00 00       	mov    $0x4,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <read>:
SYSCALL(read)
 314:	b8 05 00 00 00       	mov    $0x5,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <write>:
SYSCALL(write)
 31c:	b8 10 00 00 00       	mov    $0x10,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <close>:
SYSCALL(close)
 324:	b8 15 00 00 00       	mov    $0x15,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <kill>:
SYSCALL(kill)
 32c:	b8 06 00 00 00       	mov    $0x6,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <exec>:
SYSCALL(exec)
 334:	b8 07 00 00 00       	mov    $0x7,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <open>:
SYSCALL(open)
 33c:	b8 0f 00 00 00       	mov    $0xf,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <mknod>:
SYSCALL(mknod)
 344:	b8 11 00 00 00       	mov    $0x11,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <unlink>:
SYSCALL(unlink)
 34c:	b8 12 00 00 00       	mov    $0x12,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <fstat>:
SYSCALL(fstat)
 354:	b8 08 00 00 00       	mov    $0x8,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <link>:
SYSCALL(link)
 35c:	b8 13 00 00 00       	mov    $0x13,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <mkdir>:
SYSCALL(mkdir)
 364:	b8 14 00 00 00       	mov    $0x14,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <chdir>:
SYSCALL(chdir)
 36c:	b8 09 00 00 00       	mov    $0x9,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <dup>:
SYSCALL(dup)
 374:	b8 0a 00 00 00       	mov    $0xa,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <getpid>:
SYSCALL(getpid)
 37c:	b8 0b 00 00 00       	mov    $0xb,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <sbrk>:
SYSCALL(sbrk)
 384:	b8 0c 00 00 00       	mov    $0xc,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <sleep>:
SYSCALL(sleep)
 38c:	b8 0d 00 00 00       	mov    $0xd,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <uptime>:
SYSCALL(uptime)
 394:	b8 0e 00 00 00       	mov    $0xe,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
 39f:	83 ec 18             	sub    $0x18,%esp
 3a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3af:	00 
 3b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 3b7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ba:	89 04 24             	mov    %eax,(%esp)
 3bd:	e8 5a ff ff ff       	call   31c <write>
}
 3c2:	c9                   	leave  
 3c3:	c3                   	ret    

000003c4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	56                   	push   %esi
 3c8:	53                   	push   %ebx
 3c9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3cc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3d3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3d7:	74 17                	je     3f0 <printint+0x2c>
 3d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3dd:	79 11                	jns    3f0 <printint+0x2c>
    neg = 1;
 3df:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e9:	f7 d8                	neg    %eax
 3eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3ee:	eb 06                	jmp    3f6 <printint+0x32>
  } else {
    x = xx;
 3f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3fd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 400:	8d 41 01             	lea    0x1(%ecx),%eax
 403:	89 45 f4             	mov    %eax,-0xc(%ebp)
 406:	8b 5d 10             	mov    0x10(%ebp),%ebx
 409:	8b 45 ec             	mov    -0x14(%ebp),%eax
 40c:	ba 00 00 00 00       	mov    $0x0,%edx
 411:	f7 f3                	div    %ebx
 413:	89 d0                	mov    %edx,%eax
 415:	8a 80 bc 0a 00 00    	mov    0xabc(%eax),%al
 41b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 41f:	8b 75 10             	mov    0x10(%ebp),%esi
 422:	8b 45 ec             	mov    -0x14(%ebp),%eax
 425:	ba 00 00 00 00       	mov    $0x0,%edx
 42a:	f7 f6                	div    %esi
 42c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 42f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 433:	75 c8                	jne    3fd <printint+0x39>
  if(neg)
 435:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 439:	74 10                	je     44b <printint+0x87>
    buf[i++] = '-';
 43b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43e:	8d 50 01             	lea    0x1(%eax),%edx
 441:	89 55 f4             	mov    %edx,-0xc(%ebp)
 444:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 449:	eb 1e                	jmp    469 <printint+0xa5>
 44b:	eb 1c                	jmp    469 <printint+0xa5>
    putc(fd, buf[i]);
 44d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 450:	8b 45 f4             	mov    -0xc(%ebp),%eax
 453:	01 d0                	add    %edx,%eax
 455:	8a 00                	mov    (%eax),%al
 457:	0f be c0             	movsbl %al,%eax
 45a:	89 44 24 04          	mov    %eax,0x4(%esp)
 45e:	8b 45 08             	mov    0x8(%ebp),%eax
 461:	89 04 24             	mov    %eax,(%esp)
 464:	e8 33 ff ff ff       	call   39c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 469:	ff 4d f4             	decl   -0xc(%ebp)
 46c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 470:	79 db                	jns    44d <printint+0x89>
    putc(fd, buf[i]);
}
 472:	83 c4 30             	add    $0x30,%esp
 475:	5b                   	pop    %ebx
 476:	5e                   	pop    %esi
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    

00000479 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 47f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 486:	8d 45 0c             	lea    0xc(%ebp),%eax
 489:	83 c0 04             	add    $0x4,%eax
 48c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 48f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 496:	e9 77 01 00 00       	jmp    612 <printf+0x199>
    c = fmt[i] & 0xff;
 49b:	8b 55 0c             	mov    0xc(%ebp),%edx
 49e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4a1:	01 d0                	add    %edx,%eax
 4a3:	8a 00                	mov    (%eax),%al
 4a5:	0f be c0             	movsbl %al,%eax
 4a8:	25 ff 00 00 00       	and    $0xff,%eax
 4ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4b0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4b4:	75 2c                	jne    4e2 <printf+0x69>
      if(c == '%'){
 4b6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4ba:	75 0c                	jne    4c8 <printf+0x4f>
        state = '%';
 4bc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4c3:	e9 47 01 00 00       	jmp    60f <printf+0x196>
      } else {
        putc(fd, c);
 4c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4cb:	0f be c0             	movsbl %al,%eax
 4ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d2:	8b 45 08             	mov    0x8(%ebp),%eax
 4d5:	89 04 24             	mov    %eax,(%esp)
 4d8:	e8 bf fe ff ff       	call   39c <putc>
 4dd:	e9 2d 01 00 00       	jmp    60f <printf+0x196>
      }
    } else if(state == '%'){
 4e2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4e6:	0f 85 23 01 00 00    	jne    60f <printf+0x196>
      if(c == 'd'){
 4ec:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4f0:	75 2d                	jne    51f <printf+0xa6>
        printint(fd, *ap, 10, 1);
 4f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f5:	8b 00                	mov    (%eax),%eax
 4f7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4fe:	00 
 4ff:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 506:	00 
 507:	89 44 24 04          	mov    %eax,0x4(%esp)
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	89 04 24             	mov    %eax,(%esp)
 511:	e8 ae fe ff ff       	call   3c4 <printint>
        ap++;
 516:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 51a:	e9 e9 00 00 00       	jmp    608 <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
 51f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 523:	74 06                	je     52b <printf+0xb2>
 525:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 529:	75 2d                	jne    558 <printf+0xdf>
        printint(fd, *ap, 16, 0);
 52b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 52e:	8b 00                	mov    (%eax),%eax
 530:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 537:	00 
 538:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 53f:	00 
 540:	89 44 24 04          	mov    %eax,0x4(%esp)
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	89 04 24             	mov    %eax,(%esp)
 54a:	e8 75 fe ff ff       	call   3c4 <printint>
        ap++;
 54f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 553:	e9 b0 00 00 00       	jmp    608 <printf+0x18f>
      } else if(c == 's'){
 558:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 55c:	75 42                	jne    5a0 <printf+0x127>
        s = (char*)*ap;
 55e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 561:	8b 00                	mov    (%eax),%eax
 563:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 566:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 56a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 56e:	75 09                	jne    579 <printf+0x100>
          s = "(null)";
 570:	c7 45 f4 70 08 00 00 	movl   $0x870,-0xc(%ebp)
        while(*s != 0){
 577:	eb 1c                	jmp    595 <printf+0x11c>
 579:	eb 1a                	jmp    595 <printf+0x11c>
          putc(fd, *s);
 57b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57e:	8a 00                	mov    (%eax),%al
 580:	0f be c0             	movsbl %al,%eax
 583:	89 44 24 04          	mov    %eax,0x4(%esp)
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	89 04 24             	mov    %eax,(%esp)
 58d:	e8 0a fe ff ff       	call   39c <putc>
          s++;
 592:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 595:	8b 45 f4             	mov    -0xc(%ebp),%eax
 598:	8a 00                	mov    (%eax),%al
 59a:	84 c0                	test   %al,%al
 59c:	75 dd                	jne    57b <printf+0x102>
 59e:	eb 68                	jmp    608 <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5a0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5a4:	75 1d                	jne    5c3 <printf+0x14a>
        putc(fd, *ap);
 5a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a9:	8b 00                	mov    (%eax),%eax
 5ab:	0f be c0             	movsbl %al,%eax
 5ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	89 04 24             	mov    %eax,(%esp)
 5b8:	e8 df fd ff ff       	call   39c <putc>
        ap++;
 5bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c1:	eb 45                	jmp    608 <printf+0x18f>
      } else if(c == '%'){
 5c3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5c7:	75 17                	jne    5e0 <printf+0x167>
        putc(fd, c);
 5c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5cc:	0f be c0             	movsbl %al,%eax
 5cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	89 04 24             	mov    %eax,(%esp)
 5d9:	e8 be fd ff ff       	call   39c <putc>
 5de:	eb 28                	jmp    608 <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5e0:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5e7:	00 
 5e8:	8b 45 08             	mov    0x8(%ebp),%eax
 5eb:	89 04 24             	mov    %eax,(%esp)
 5ee:	e8 a9 fd ff ff       	call   39c <putc>
        putc(fd, c);
 5f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f6:	0f be c0             	movsbl %al,%eax
 5f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	89 04 24             	mov    %eax,(%esp)
 603:	e8 94 fd ff ff       	call   39c <putc>
      }
      state = 0;
 608:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 60f:	ff 45 f0             	incl   -0x10(%ebp)
 612:	8b 55 0c             	mov    0xc(%ebp),%edx
 615:	8b 45 f0             	mov    -0x10(%ebp),%eax
 618:	01 d0                	add    %edx,%eax
 61a:	8a 00                	mov    (%eax),%al
 61c:	84 c0                	test   %al,%al
 61e:	0f 85 77 fe ff ff    	jne    49b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 624:	c9                   	leave  
 625:	c3                   	ret    
 626:	90                   	nop
 627:	90                   	nop

00000628 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 628:	55                   	push   %ebp
 629:	89 e5                	mov    %esp,%ebp
 62b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 62e:	8b 45 08             	mov    0x8(%ebp),%eax
 631:	83 e8 08             	sub    $0x8,%eax
 634:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 637:	a1 d8 0a 00 00       	mov    0xad8,%eax
 63c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 63f:	eb 24                	jmp    665 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 641:	8b 45 fc             	mov    -0x4(%ebp),%eax
 644:	8b 00                	mov    (%eax),%eax
 646:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 649:	77 12                	ja     65d <free+0x35>
 64b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 651:	77 24                	ja     677 <free+0x4f>
 653:	8b 45 fc             	mov    -0x4(%ebp),%eax
 656:	8b 00                	mov    (%eax),%eax
 658:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 65b:	77 1a                	ja     677 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	89 45 fc             	mov    %eax,-0x4(%ebp)
 665:	8b 45 f8             	mov    -0x8(%ebp),%eax
 668:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 66b:	76 d4                	jbe    641 <free+0x19>
 66d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
 672:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 675:	76 ca                	jbe    641 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 677:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67a:	8b 40 04             	mov    0x4(%eax),%eax
 67d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 684:	8b 45 f8             	mov    -0x8(%ebp),%eax
 687:	01 c2                	add    %eax,%edx
 689:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68c:	8b 00                	mov    (%eax),%eax
 68e:	39 c2                	cmp    %eax,%edx
 690:	75 24                	jne    6b6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 692:	8b 45 f8             	mov    -0x8(%ebp),%eax
 695:	8b 50 04             	mov    0x4(%eax),%edx
 698:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69b:	8b 00                	mov    (%eax),%eax
 69d:	8b 40 04             	mov    0x4(%eax),%eax
 6a0:	01 c2                	add    %eax,%edx
 6a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ab:	8b 00                	mov    (%eax),%eax
 6ad:	8b 10                	mov    (%eax),%edx
 6af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b2:	89 10                	mov    %edx,(%eax)
 6b4:	eb 0a                	jmp    6c0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b9:	8b 10                	mov    (%eax),%edx
 6bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6be:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c3:	8b 40 04             	mov    0x4(%eax),%eax
 6c6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	01 d0                	add    %edx,%eax
 6d2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d5:	75 20                	jne    6f7 <free+0xcf>
    p->s.size += bp->s.size;
 6d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6da:	8b 50 04             	mov    0x4(%eax),%edx
 6dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e0:	8b 40 04             	mov    0x4(%eax),%eax
 6e3:	01 c2                	add    %eax,%edx
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ee:	8b 10                	mov    (%eax),%edx
 6f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f3:	89 10                	mov    %edx,(%eax)
 6f5:	eb 08                	jmp    6ff <free+0xd7>
  } else
    p->s.ptr = bp;
 6f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fa:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6fd:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 702:	a3 d8 0a 00 00       	mov    %eax,0xad8
}
 707:	c9                   	leave  
 708:	c3                   	ret    

00000709 <morecore>:

static Header*
morecore(uint nu)
{
 709:	55                   	push   %ebp
 70a:	89 e5                	mov    %esp,%ebp
 70c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 70f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 716:	77 07                	ja     71f <morecore+0x16>
    nu = 4096;
 718:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 71f:	8b 45 08             	mov    0x8(%ebp),%eax
 722:	c1 e0 03             	shl    $0x3,%eax
 725:	89 04 24             	mov    %eax,(%esp)
 728:	e8 57 fc ff ff       	call   384 <sbrk>
 72d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 730:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 734:	75 07                	jne    73d <morecore+0x34>
    return 0;
 736:	b8 00 00 00 00       	mov    $0x0,%eax
 73b:	eb 22                	jmp    75f <morecore+0x56>
  hp = (Header*)p;
 73d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 740:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 743:	8b 45 f0             	mov    -0x10(%ebp),%eax
 746:	8b 55 08             	mov    0x8(%ebp),%edx
 749:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 74c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74f:	83 c0 08             	add    $0x8,%eax
 752:	89 04 24             	mov    %eax,(%esp)
 755:	e8 ce fe ff ff       	call   628 <free>
  return freep;
 75a:	a1 d8 0a 00 00       	mov    0xad8,%eax
}
 75f:	c9                   	leave  
 760:	c3                   	ret    

00000761 <malloc>:

void*
malloc(uint nbytes)
{
 761:	55                   	push   %ebp
 762:	89 e5                	mov    %esp,%ebp
 764:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	83 c0 07             	add    $0x7,%eax
 76d:	c1 e8 03             	shr    $0x3,%eax
 770:	40                   	inc    %eax
 771:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 774:	a1 d8 0a 00 00       	mov    0xad8,%eax
 779:	89 45 f0             	mov    %eax,-0x10(%ebp)
 77c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 780:	75 23                	jne    7a5 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 782:	c7 45 f0 d0 0a 00 00 	movl   $0xad0,-0x10(%ebp)
 789:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78c:	a3 d8 0a 00 00       	mov    %eax,0xad8
 791:	a1 d8 0a 00 00       	mov    0xad8,%eax
 796:	a3 d0 0a 00 00       	mov    %eax,0xad0
    base.s.size = 0;
 79b:	c7 05 d4 0a 00 00 00 	movl   $0x0,0xad4
 7a2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a8:	8b 00                	mov    (%eax),%eax
 7aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b0:	8b 40 04             	mov    0x4(%eax),%eax
 7b3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7b6:	72 4d                	jb     805 <malloc+0xa4>
      if(p->s.size == nunits)
 7b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bb:	8b 40 04             	mov    0x4(%eax),%eax
 7be:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7c1:	75 0c                	jne    7cf <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 7c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cb:	89 10                	mov    %edx,(%eax)
 7cd:	eb 26                	jmp    7f5 <malloc+0x94>
      else {
        p->s.size -= nunits;
 7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d2:	8b 40 04             	mov    0x4(%eax),%eax
 7d5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7d8:	89 c2                	mov    %eax,%edx
 7da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e3:	8b 40 04             	mov    0x4(%eax),%eax
 7e6:	c1 e0 03             	shl    $0x3,%eax
 7e9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ef:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7f2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f8:	a3 d8 0a 00 00       	mov    %eax,0xad8
      return (void*)(p + 1);
 7fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 800:	83 c0 08             	add    $0x8,%eax
 803:	eb 38                	jmp    83d <malloc+0xdc>
    }
    if(p == freep)
 805:	a1 d8 0a 00 00       	mov    0xad8,%eax
 80a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 80d:	75 1b                	jne    82a <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 80f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 812:	89 04 24             	mov    %eax,(%esp)
 815:	e8 ef fe ff ff       	call   709 <morecore>
 81a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 81d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 821:	75 07                	jne    82a <malloc+0xc9>
        return 0;
 823:	b8 00 00 00 00       	mov    $0x0,%eax
 828:	eb 13                	jmp    83d <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 830:	8b 45 f4             	mov    -0xc(%ebp),%eax
 833:	8b 00                	mov    (%eax),%eax
 835:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 838:	e9 70 ff ff ff       	jmp    7ad <malloc+0x4c>
}
 83d:	c9                   	leave  
 83e:	c3                   	ret    
