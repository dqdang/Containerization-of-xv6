
_echo:     file format elf32-i386


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

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 48                	jmp    5b <main+0x5b>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	40                   	inc    %eax
  18:	3b 45 08             	cmp    0x8(%ebp),%eax
  1b:	7d 07                	jge    24 <main+0x24>
  1d:	b8 03 08 00 00       	mov    $0x803,%eax
  22:	eb 05                	jmp    29 <main+0x29>
  24:	b8 05 08 00 00       	mov    $0x805,%eax
  29:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2d:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  34:	8b 55 0c             	mov    0xc(%ebp),%edx
  37:	01 ca                	add    %ecx,%edx
  39:	8b 12                	mov    (%edx),%edx
  3b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  3f:	89 54 24 08          	mov    %edx,0x8(%esp)
  43:	c7 44 24 04 07 08 00 	movl   $0x807,0x4(%esp)
  4a:	00 
  4b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  52:	e8 e6 03 00 00       	call   43d <printf>
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  57:	ff 44 24 1c          	incl   0x1c(%esp)
  5b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5f:	3b 45 08             	cmp    0x8(%ebp),%eax
  62:	7c af                	jl     13 <main+0x13>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
  64:	e8 57 02 00 00       	call   2c0 <exit>
  69:	90                   	nop
  6a:	90                   	nop
  6b:	90                   	nop

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  9d:	90                   	nop
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	8d 50 01             	lea    0x1(%eax),%edx
  a4:	89 55 08             	mov    %edx,0x8(%ebp)
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	8d 4a 01             	lea    0x1(%edx),%ecx
  ad:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b0:	8a 12                	mov    (%edx),%dl
  b2:	88 10                	mov    %dl,(%eax)
  b4:	8a 00                	mov    (%eax),%al
  b6:	84 c0                	test   %al,%al
  b8:	75 e4                	jne    9e <strcpy+0xd>
    ;
  return os;
  ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  bd:	c9                   	leave  
  be:	c3                   	ret    

000000bf <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c2:	eb 06                	jmp    ca <strcmp+0xb>
    p++, q++;
  c4:	ff 45 08             	incl   0x8(%ebp)
  c7:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ca:	8b 45 08             	mov    0x8(%ebp),%eax
  cd:	8a 00                	mov    (%eax),%al
  cf:	84 c0                	test   %al,%al
  d1:	74 0e                	je     e1 <strcmp+0x22>
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	8a 10                	mov    (%eax),%dl
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	8a 00                	mov    (%eax),%al
  dd:	38 c2                	cmp    %al,%dl
  df:	74 e3                	je     c4 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	8a 00                	mov    (%eax),%al
  e6:	0f b6 d0             	movzbl %al,%edx
  e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  ec:	8a 00                	mov    (%eax),%al
  ee:	0f b6 c0             	movzbl %al,%eax
  f1:	29 c2                	sub    %eax,%edx
  f3:	89 d0                	mov    %edx,%eax
}
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    

000000f7 <strlen>:

uint
strlen(char *s)
{
  f7:	55                   	push   %ebp
  f8:	89 e5                	mov    %esp,%ebp
  fa:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  fd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 104:	eb 03                	jmp    109 <strlen+0x12>
 106:	ff 45 fc             	incl   -0x4(%ebp)
 109:	8b 55 fc             	mov    -0x4(%ebp),%edx
 10c:	8b 45 08             	mov    0x8(%ebp),%eax
 10f:	01 d0                	add    %edx,%eax
 111:	8a 00                	mov    (%eax),%al
 113:	84 c0                	test   %al,%al
 115:	75 ef                	jne    106 <strlen+0xf>
    ;
  return n;
 117:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 11a:	c9                   	leave  
 11b:	c3                   	ret    

0000011c <memset>:

void*
memset(void *dst, int c, uint n)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 122:	8b 45 10             	mov    0x10(%ebp),%eax
 125:	89 44 24 08          	mov    %eax,0x8(%esp)
 129:	8b 45 0c             	mov    0xc(%ebp),%eax
 12c:	89 44 24 04          	mov    %eax,0x4(%esp)
 130:	8b 45 08             	mov    0x8(%ebp),%eax
 133:	89 04 24             	mov    %eax,(%esp)
 136:	e8 31 ff ff ff       	call   6c <stosb>
  return dst;
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 13e:	c9                   	leave  
 13f:	c3                   	ret    

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	83 ec 04             	sub    $0x4,%esp
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 14c:	eb 12                	jmp    160 <strchr+0x20>
    if(*s == c)
 14e:	8b 45 08             	mov    0x8(%ebp),%eax
 151:	8a 00                	mov    (%eax),%al
 153:	3a 45 fc             	cmp    -0x4(%ebp),%al
 156:	75 05                	jne    15d <strchr+0x1d>
      return (char*)s;
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	eb 11                	jmp    16e <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 15d:	ff 45 08             	incl   0x8(%ebp)
 160:	8b 45 08             	mov    0x8(%ebp),%eax
 163:	8a 00                	mov    (%eax),%al
 165:	84 c0                	test   %al,%al
 167:	75 e5                	jne    14e <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 169:	b8 00 00 00 00       	mov    $0x0,%eax
}
 16e:	c9                   	leave  
 16f:	c3                   	ret    

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 176:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 17d:	eb 49                	jmp    1c8 <gets+0x58>
    cc = read(0, &c, 1);
 17f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 186:	00 
 187:	8d 45 ef             	lea    -0x11(%ebp),%eax
 18a:	89 44 24 04          	mov    %eax,0x4(%esp)
 18e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 195:	e8 3e 01 00 00       	call   2d8 <read>
 19a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 19d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a1:	7f 02                	jg     1a5 <gets+0x35>
      break;
 1a3:	eb 2c                	jmp    1d1 <gets+0x61>
    buf[i++] = c;
 1a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a8:	8d 50 01             	lea    0x1(%eax),%edx
 1ab:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1ae:	89 c2                	mov    %eax,%edx
 1b0:	8b 45 08             	mov    0x8(%ebp),%eax
 1b3:	01 c2                	add    %eax,%edx
 1b5:	8a 45 ef             	mov    -0x11(%ebp),%al
 1b8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ba:	8a 45 ef             	mov    -0x11(%ebp),%al
 1bd:	3c 0a                	cmp    $0xa,%al
 1bf:	74 10                	je     1d1 <gets+0x61>
 1c1:	8a 45 ef             	mov    -0x11(%ebp),%al
 1c4:	3c 0d                	cmp    $0xd,%al
 1c6:	74 09                	je     1d1 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cb:	40                   	inc    %eax
 1cc:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1cf:	7c ae                	jl     17f <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	01 d0                	add    %edx,%eax
 1d9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1dc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1df:	c9                   	leave  
 1e0:	c3                   	ret    

000001e1 <stat>:

int
stat(char *n, struct stat *st)
{
 1e1:	55                   	push   %ebp
 1e2:	89 e5                	mov    %esp,%ebp
 1e4:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1ee:	00 
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	89 04 24             	mov    %eax,(%esp)
 1f5:	e8 06 01 00 00       	call   300 <open>
 1fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 201:	79 07                	jns    20a <stat+0x29>
    return -1;
 203:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 208:	eb 23                	jmp    22d <stat+0x4c>
  r = fstat(fd, st);
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 44 24 04          	mov    %eax,0x4(%esp)
 211:	8b 45 f4             	mov    -0xc(%ebp),%eax
 214:	89 04 24             	mov    %eax,(%esp)
 217:	e8 fc 00 00 00       	call   318 <fstat>
 21c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 21f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 222:	89 04 24             	mov    %eax,(%esp)
 225:	e8 be 00 00 00       	call   2e8 <close>
  return r;
 22a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 22d:	c9                   	leave  
 22e:	c3                   	ret    

0000022f <atoi>:

int
atoi(const char *s)
{
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 235:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 23c:	eb 24                	jmp    262 <atoi+0x33>
    n = n*10 + *s++ - '0';
 23e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 241:	89 d0                	mov    %edx,%eax
 243:	c1 e0 02             	shl    $0x2,%eax
 246:	01 d0                	add    %edx,%eax
 248:	01 c0                	add    %eax,%eax
 24a:	89 c1                	mov    %eax,%ecx
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	8d 50 01             	lea    0x1(%eax),%edx
 252:	89 55 08             	mov    %edx,0x8(%ebp)
 255:	8a 00                	mov    (%eax),%al
 257:	0f be c0             	movsbl %al,%eax
 25a:	01 c8                	add    %ecx,%eax
 25c:	83 e8 30             	sub    $0x30,%eax
 25f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	8a 00                	mov    (%eax),%al
 267:	3c 2f                	cmp    $0x2f,%al
 269:	7e 09                	jle    274 <atoi+0x45>
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	8a 00                	mov    (%eax),%al
 270:	3c 39                	cmp    $0x39,%al
 272:	7e ca                	jle    23e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 274:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
 27c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
 282:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 285:	8b 45 0c             	mov    0xc(%ebp),%eax
 288:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 28b:	eb 16                	jmp    2a3 <memmove+0x2a>
    *dst++ = *src++;
 28d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 290:	8d 50 01             	lea    0x1(%eax),%edx
 293:	89 55 fc             	mov    %edx,-0x4(%ebp)
 296:	8b 55 f8             	mov    -0x8(%ebp),%edx
 299:	8d 4a 01             	lea    0x1(%edx),%ecx
 29c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 29f:	8a 12                	mov    (%edx),%dl
 2a1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a3:	8b 45 10             	mov    0x10(%ebp),%eax
 2a6:	8d 50 ff             	lea    -0x1(%eax),%edx
 2a9:	89 55 10             	mov    %edx,0x10(%ebp)
 2ac:	85 c0                	test   %eax,%eax
 2ae:	7f dd                	jg     28d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    
 2b5:	90                   	nop
 2b6:	90                   	nop
 2b7:	90                   	nop

000002b8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2b8:	b8 01 00 00 00       	mov    $0x1,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <exit>:
SYSCALL(exit)
 2c0:	b8 02 00 00 00       	mov    $0x2,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <wait>:
SYSCALL(wait)
 2c8:	b8 03 00 00 00       	mov    $0x3,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <pipe>:
SYSCALL(pipe)
 2d0:	b8 04 00 00 00       	mov    $0x4,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <read>:
SYSCALL(read)
 2d8:	b8 05 00 00 00       	mov    $0x5,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <write>:
SYSCALL(write)
 2e0:	b8 10 00 00 00       	mov    $0x10,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <close>:
SYSCALL(close)
 2e8:	b8 15 00 00 00       	mov    $0x15,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <kill>:
SYSCALL(kill)
 2f0:	b8 06 00 00 00       	mov    $0x6,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <exec>:
SYSCALL(exec)
 2f8:	b8 07 00 00 00       	mov    $0x7,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <open>:
SYSCALL(open)
 300:	b8 0f 00 00 00       	mov    $0xf,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <mknod>:
SYSCALL(mknod)
 308:	b8 11 00 00 00       	mov    $0x11,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <unlink>:
SYSCALL(unlink)
 310:	b8 12 00 00 00       	mov    $0x12,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <fstat>:
SYSCALL(fstat)
 318:	b8 08 00 00 00       	mov    $0x8,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <link>:
SYSCALL(link)
 320:	b8 13 00 00 00       	mov    $0x13,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <mkdir>:
SYSCALL(mkdir)
 328:	b8 14 00 00 00       	mov    $0x14,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <chdir>:
SYSCALL(chdir)
 330:	b8 09 00 00 00       	mov    $0x9,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <dup>:
SYSCALL(dup)
 338:	b8 0a 00 00 00       	mov    $0xa,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <getpid>:
SYSCALL(getpid)
 340:	b8 0b 00 00 00       	mov    $0xb,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <sbrk>:
SYSCALL(sbrk)
 348:	b8 0c 00 00 00       	mov    $0xc,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <sleep>:
SYSCALL(sleep)
 350:	b8 0d 00 00 00       	mov    $0xd,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <uptime>:
SYSCALL(uptime)
 358:	b8 0e 00 00 00       	mov    $0xe,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	83 ec 18             	sub    $0x18,%esp
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 36c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 373:	00 
 374:	8d 45 f4             	lea    -0xc(%ebp),%eax
 377:	89 44 24 04          	mov    %eax,0x4(%esp)
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	89 04 24             	mov    %eax,(%esp)
 381:	e8 5a ff ff ff       	call   2e0 <write>
}
 386:	c9                   	leave  
 387:	c3                   	ret    

00000388 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	56                   	push   %esi
 38c:	53                   	push   %ebx
 38d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 390:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 397:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 39b:	74 17                	je     3b4 <printint+0x2c>
 39d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3a1:	79 11                	jns    3b4 <printint+0x2c>
    neg = 1;
 3a3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ad:	f7 d8                	neg    %eax
 3af:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3b2:	eb 06                	jmp    3ba <printint+0x32>
  } else {
    x = xx;
 3b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3c1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3c4:	8d 41 01             	lea    0x1(%ecx),%eax
 3c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ca:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3d0:	ba 00 00 00 00       	mov    $0x0,%edx
 3d5:	f7 f3                	div    %ebx
 3d7:	89 d0                	mov    %edx,%eax
 3d9:	8a 80 58 0a 00 00    	mov    0xa58(%eax),%al
 3df:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3e3:	8b 75 10             	mov    0x10(%ebp),%esi
 3e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e9:	ba 00 00 00 00       	mov    $0x0,%edx
 3ee:	f7 f6                	div    %esi
 3f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3f7:	75 c8                	jne    3c1 <printint+0x39>
  if(neg)
 3f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3fd:	74 10                	je     40f <printint+0x87>
    buf[i++] = '-';
 3ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 402:	8d 50 01             	lea    0x1(%eax),%edx
 405:	89 55 f4             	mov    %edx,-0xc(%ebp)
 408:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 40d:	eb 1e                	jmp    42d <printint+0xa5>
 40f:	eb 1c                	jmp    42d <printint+0xa5>
    putc(fd, buf[i]);
 411:	8d 55 dc             	lea    -0x24(%ebp),%edx
 414:	8b 45 f4             	mov    -0xc(%ebp),%eax
 417:	01 d0                	add    %edx,%eax
 419:	8a 00                	mov    (%eax),%al
 41b:	0f be c0             	movsbl %al,%eax
 41e:	89 44 24 04          	mov    %eax,0x4(%esp)
 422:	8b 45 08             	mov    0x8(%ebp),%eax
 425:	89 04 24             	mov    %eax,(%esp)
 428:	e8 33 ff ff ff       	call   360 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 42d:	ff 4d f4             	decl   -0xc(%ebp)
 430:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 434:	79 db                	jns    411 <printint+0x89>
    putc(fd, buf[i]);
}
 436:	83 c4 30             	add    $0x30,%esp
 439:	5b                   	pop    %ebx
 43a:	5e                   	pop    %esi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    

0000043d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 443:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 44a:	8d 45 0c             	lea    0xc(%ebp),%eax
 44d:	83 c0 04             	add    $0x4,%eax
 450:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 453:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 45a:	e9 77 01 00 00       	jmp    5d6 <printf+0x199>
    c = fmt[i] & 0xff;
 45f:	8b 55 0c             	mov    0xc(%ebp),%edx
 462:	8b 45 f0             	mov    -0x10(%ebp),%eax
 465:	01 d0                	add    %edx,%eax
 467:	8a 00                	mov    (%eax),%al
 469:	0f be c0             	movsbl %al,%eax
 46c:	25 ff 00 00 00       	and    $0xff,%eax
 471:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 474:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 478:	75 2c                	jne    4a6 <printf+0x69>
      if(c == '%'){
 47a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 47e:	75 0c                	jne    48c <printf+0x4f>
        state = '%';
 480:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 487:	e9 47 01 00 00       	jmp    5d3 <printf+0x196>
      } else {
        putc(fd, c);
 48c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 48f:	0f be c0             	movsbl %al,%eax
 492:	89 44 24 04          	mov    %eax,0x4(%esp)
 496:	8b 45 08             	mov    0x8(%ebp),%eax
 499:	89 04 24             	mov    %eax,(%esp)
 49c:	e8 bf fe ff ff       	call   360 <putc>
 4a1:	e9 2d 01 00 00       	jmp    5d3 <printf+0x196>
      }
    } else if(state == '%'){
 4a6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4aa:	0f 85 23 01 00 00    	jne    5d3 <printf+0x196>
      if(c == 'd'){
 4b0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4b4:	75 2d                	jne    4e3 <printf+0xa6>
        printint(fd, *ap, 10, 1);
 4b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4b9:	8b 00                	mov    (%eax),%eax
 4bb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4c2:	00 
 4c3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4ca:	00 
 4cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cf:	8b 45 08             	mov    0x8(%ebp),%eax
 4d2:	89 04 24             	mov    %eax,(%esp)
 4d5:	e8 ae fe ff ff       	call   388 <printint>
        ap++;
 4da:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4de:	e9 e9 00 00 00       	jmp    5cc <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
 4e3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4e7:	74 06                	je     4ef <printf+0xb2>
 4e9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4ed:	75 2d                	jne    51c <printf+0xdf>
        printint(fd, *ap, 16, 0);
 4ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f2:	8b 00                	mov    (%eax),%eax
 4f4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4fb:	00 
 4fc:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 503:	00 
 504:	89 44 24 04          	mov    %eax,0x4(%esp)
 508:	8b 45 08             	mov    0x8(%ebp),%eax
 50b:	89 04 24             	mov    %eax,(%esp)
 50e:	e8 75 fe ff ff       	call   388 <printint>
        ap++;
 513:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 517:	e9 b0 00 00 00       	jmp    5cc <printf+0x18f>
      } else if(c == 's'){
 51c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 520:	75 42                	jne    564 <printf+0x127>
        s = (char*)*ap;
 522:	8b 45 e8             	mov    -0x18(%ebp),%eax
 525:	8b 00                	mov    (%eax),%eax
 527:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 52a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 52e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 532:	75 09                	jne    53d <printf+0x100>
          s = "(null)";
 534:	c7 45 f4 0c 08 00 00 	movl   $0x80c,-0xc(%ebp)
        while(*s != 0){
 53b:	eb 1c                	jmp    559 <printf+0x11c>
 53d:	eb 1a                	jmp    559 <printf+0x11c>
          putc(fd, *s);
 53f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 542:	8a 00                	mov    (%eax),%al
 544:	0f be c0             	movsbl %al,%eax
 547:	89 44 24 04          	mov    %eax,0x4(%esp)
 54b:	8b 45 08             	mov    0x8(%ebp),%eax
 54e:	89 04 24             	mov    %eax,(%esp)
 551:	e8 0a fe ff ff       	call   360 <putc>
          s++;
 556:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 559:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55c:	8a 00                	mov    (%eax),%al
 55e:	84 c0                	test   %al,%al
 560:	75 dd                	jne    53f <printf+0x102>
 562:	eb 68                	jmp    5cc <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 564:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 568:	75 1d                	jne    587 <printf+0x14a>
        putc(fd, *ap);
 56a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56d:	8b 00                	mov    (%eax),%eax
 56f:	0f be c0             	movsbl %al,%eax
 572:	89 44 24 04          	mov    %eax,0x4(%esp)
 576:	8b 45 08             	mov    0x8(%ebp),%eax
 579:	89 04 24             	mov    %eax,(%esp)
 57c:	e8 df fd ff ff       	call   360 <putc>
        ap++;
 581:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 585:	eb 45                	jmp    5cc <printf+0x18f>
      } else if(c == '%'){
 587:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 58b:	75 17                	jne    5a4 <printf+0x167>
        putc(fd, c);
 58d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 590:	0f be c0             	movsbl %al,%eax
 593:	89 44 24 04          	mov    %eax,0x4(%esp)
 597:	8b 45 08             	mov    0x8(%ebp),%eax
 59a:	89 04 24             	mov    %eax,(%esp)
 59d:	e8 be fd ff ff       	call   360 <putc>
 5a2:	eb 28                	jmp    5cc <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5a4:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5ab:	00 
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	89 04 24             	mov    %eax,(%esp)
 5b2:	e8 a9 fd ff ff       	call   360 <putc>
        putc(fd, c);
 5b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ba:	0f be c0             	movsbl %al,%eax
 5bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c1:	8b 45 08             	mov    0x8(%ebp),%eax
 5c4:	89 04 24             	mov    %eax,(%esp)
 5c7:	e8 94 fd ff ff       	call   360 <putc>
      }
      state = 0;
 5cc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d3:	ff 45 f0             	incl   -0x10(%ebp)
 5d6:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5dc:	01 d0                	add    %edx,%eax
 5de:	8a 00                	mov    (%eax),%al
 5e0:	84 c0                	test   %al,%al
 5e2:	0f 85 77 fe ff ff    	jne    45f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e8:	c9                   	leave  
 5e9:	c3                   	ret    
 5ea:	90                   	nop
 5eb:	90                   	nop

000005ec <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ec:	55                   	push   %ebp
 5ed:	89 e5                	mov    %esp,%ebp
 5ef:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5f2:	8b 45 08             	mov    0x8(%ebp),%eax
 5f5:	83 e8 08             	sub    $0x8,%eax
 5f8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fb:	a1 74 0a 00 00       	mov    0xa74,%eax
 600:	89 45 fc             	mov    %eax,-0x4(%ebp)
 603:	eb 24                	jmp    629 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 605:	8b 45 fc             	mov    -0x4(%ebp),%eax
 608:	8b 00                	mov    (%eax),%eax
 60a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60d:	77 12                	ja     621 <free+0x35>
 60f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 612:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 615:	77 24                	ja     63b <free+0x4f>
 617:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61a:	8b 00                	mov    (%eax),%eax
 61c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 61f:	77 1a                	ja     63b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	8b 45 fc             	mov    -0x4(%ebp),%eax
 624:	8b 00                	mov    (%eax),%eax
 626:	89 45 fc             	mov    %eax,-0x4(%ebp)
 629:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 62f:	76 d4                	jbe    605 <free+0x19>
 631:	8b 45 fc             	mov    -0x4(%ebp),%eax
 634:	8b 00                	mov    (%eax),%eax
 636:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 639:	76 ca                	jbe    605 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 63b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63e:	8b 40 04             	mov    0x4(%eax),%eax
 641:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 648:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64b:	01 c2                	add    %eax,%edx
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	8b 00                	mov    (%eax),%eax
 652:	39 c2                	cmp    %eax,%edx
 654:	75 24                	jne    67a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 656:	8b 45 f8             	mov    -0x8(%ebp),%eax
 659:	8b 50 04             	mov    0x4(%eax),%edx
 65c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65f:	8b 00                	mov    (%eax),%eax
 661:	8b 40 04             	mov    0x4(%eax),%eax
 664:	01 c2                	add    %eax,%edx
 666:	8b 45 f8             	mov    -0x8(%ebp),%eax
 669:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 00                	mov    (%eax),%eax
 671:	8b 10                	mov    (%eax),%edx
 673:	8b 45 f8             	mov    -0x8(%ebp),%eax
 676:	89 10                	mov    %edx,(%eax)
 678:	eb 0a                	jmp    684 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 67a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67d:	8b 10                	mov    (%eax),%edx
 67f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 682:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 40 04             	mov    0x4(%eax),%eax
 68a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 691:	8b 45 fc             	mov    -0x4(%ebp),%eax
 694:	01 d0                	add    %edx,%eax
 696:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 699:	75 20                	jne    6bb <free+0xcf>
    p->s.size += bp->s.size;
 69b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69e:	8b 50 04             	mov    0x4(%eax),%edx
 6a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a4:	8b 40 04             	mov    0x4(%eax),%eax
 6a7:	01 c2                	add    %eax,%edx
 6a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ac:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b2:	8b 10                	mov    (%eax),%edx
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	89 10                	mov    %edx,(%eax)
 6b9:	eb 08                	jmp    6c3 <free+0xd7>
  } else
    p->s.ptr = bp;
 6bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6be:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6c1:	89 10                	mov    %edx,(%eax)
  freep = p;
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	a3 74 0a 00 00       	mov    %eax,0xa74
}
 6cb:	c9                   	leave  
 6cc:	c3                   	ret    

000006cd <morecore>:

static Header*
morecore(uint nu)
{
 6cd:	55                   	push   %ebp
 6ce:	89 e5                	mov    %esp,%ebp
 6d0:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6d3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6da:	77 07                	ja     6e3 <morecore+0x16>
    nu = 4096;
 6dc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6e3:	8b 45 08             	mov    0x8(%ebp),%eax
 6e6:	c1 e0 03             	shl    $0x3,%eax
 6e9:	89 04 24             	mov    %eax,(%esp)
 6ec:	e8 57 fc ff ff       	call   348 <sbrk>
 6f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6f4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6f8:	75 07                	jne    701 <morecore+0x34>
    return 0;
 6fa:	b8 00 00 00 00       	mov    $0x0,%eax
 6ff:	eb 22                	jmp    723 <morecore+0x56>
  hp = (Header*)p;
 701:	8b 45 f4             	mov    -0xc(%ebp),%eax
 704:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 707:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70a:	8b 55 08             	mov    0x8(%ebp),%edx
 70d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 710:	8b 45 f0             	mov    -0x10(%ebp),%eax
 713:	83 c0 08             	add    $0x8,%eax
 716:	89 04 24             	mov    %eax,(%esp)
 719:	e8 ce fe ff ff       	call   5ec <free>
  return freep;
 71e:	a1 74 0a 00 00       	mov    0xa74,%eax
}
 723:	c9                   	leave  
 724:	c3                   	ret    

00000725 <malloc>:

void*
malloc(uint nbytes)
{
 725:	55                   	push   %ebp
 726:	89 e5                	mov    %esp,%ebp
 728:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 72b:	8b 45 08             	mov    0x8(%ebp),%eax
 72e:	83 c0 07             	add    $0x7,%eax
 731:	c1 e8 03             	shr    $0x3,%eax
 734:	40                   	inc    %eax
 735:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 738:	a1 74 0a 00 00       	mov    0xa74,%eax
 73d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 740:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 744:	75 23                	jne    769 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 746:	c7 45 f0 6c 0a 00 00 	movl   $0xa6c,-0x10(%ebp)
 74d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 750:	a3 74 0a 00 00       	mov    %eax,0xa74
 755:	a1 74 0a 00 00       	mov    0xa74,%eax
 75a:	a3 6c 0a 00 00       	mov    %eax,0xa6c
    base.s.size = 0;
 75f:	c7 05 70 0a 00 00 00 	movl   $0x0,0xa70
 766:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 769:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76c:	8b 00                	mov    (%eax),%eax
 76e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 771:	8b 45 f4             	mov    -0xc(%ebp),%eax
 774:	8b 40 04             	mov    0x4(%eax),%eax
 777:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 77a:	72 4d                	jb     7c9 <malloc+0xa4>
      if(p->s.size == nunits)
 77c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77f:	8b 40 04             	mov    0x4(%eax),%eax
 782:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 785:	75 0c                	jne    793 <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 787:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78a:	8b 10                	mov    (%eax),%edx
 78c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78f:	89 10                	mov    %edx,(%eax)
 791:	eb 26                	jmp    7b9 <malloc+0x94>
      else {
        p->s.size -= nunits;
 793:	8b 45 f4             	mov    -0xc(%ebp),%eax
 796:	8b 40 04             	mov    0x4(%eax),%eax
 799:	2b 45 ec             	sub    -0x14(%ebp),%eax
 79c:	89 c2                	mov    %eax,%edx
 79e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a7:	8b 40 04             	mov    0x4(%eax),%eax
 7aa:	c1 e0 03             	shl    $0x3,%eax
 7ad:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7b6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bc:	a3 74 0a 00 00       	mov    %eax,0xa74
      return (void*)(p + 1);
 7c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c4:	83 c0 08             	add    $0x8,%eax
 7c7:	eb 38                	jmp    801 <malloc+0xdc>
    }
    if(p == freep)
 7c9:	a1 74 0a 00 00       	mov    0xa74,%eax
 7ce:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7d1:	75 1b                	jne    7ee <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 7d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d6:	89 04 24             	mov    %eax,(%esp)
 7d9:	e8 ef fe ff ff       	call   6cd <morecore>
 7de:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7e5:	75 07                	jne    7ee <malloc+0xc9>
        return 0;
 7e7:	b8 00 00 00 00       	mov    $0x0,%eax
 7ec:	eb 13                	jmp    801 <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f7:	8b 00                	mov    (%eax),%eax
 7f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7fc:	e9 70 ff ff ff       	jmp    771 <malloc+0x4c>
}
 801:	c9                   	leave  
 802:	c3                   	ret    
