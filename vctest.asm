
_vctest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int fd, id;

  if (argc < 3) {
   9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(1, "usage: vctest <vc> <cmd> [<arg> ...]\n");
   f:	c7 44 24 04 50 0e 00 	movl   $0xe50,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 66 0a 00 00       	call   a89 <printf>
    exit();
  23:	e8 84 08 00 00       	call   8ac <exit>
  }

  fd = open(argv[1], O_RDWR);
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 04             	add    $0x4,%eax
  2e:	8b 00                	mov    (%eax),%eax
  30:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  37:	00 
  38:	89 04 24             	mov    %eax,(%esp)
  3b:	e8 ac 08 00 00       	call   8ec <open>
  40:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  printf(1, "fd = %d\n", fd);
  44:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  48:	89 44 24 08          	mov    %eax,0x8(%esp)
  4c:	c7 44 24 04 76 0e 00 	movl   $0xe76,0x4(%esp)
  53:	00 
  54:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5b:	e8 29 0a 00 00       	call   a89 <printf>

  /* fork a child and exec argv[1] */
  id = fork();
  60:	e8 3f 08 00 00       	call   8a4 <fork>
  65:	89 44 24 18          	mov    %eax,0x18(%esp)

  if (id == 0){
  69:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  6e:	75 67                	jne    d7 <main+0xd7>
    close(0);
  70:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  77:	e8 58 08 00 00       	call   8d4 <close>
    close(1);
  7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  83:	e8 4c 08 00 00       	call   8d4 <close>
    close(2);
  88:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  8f:	e8 40 08 00 00       	call   8d4 <close>
    dup(fd);
  94:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  98:	89 04 24             	mov    %eax,(%esp)
  9b:	e8 84 08 00 00       	call   924 <dup>
    dup(fd);
  a0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  a4:	89 04 24             	mov    %eax,(%esp)
  a7:	e8 78 08 00 00       	call   924 <dup>
    dup(fd);
  ac:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b0:	89 04 24             	mov    %eax,(%esp)
  b3:	e8 6c 08 00 00       	call   924 <dup>
    exec(argv[2], &argv[2]);
  b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  bb:	8d 50 08             	lea    0x8(%eax),%edx
  be:	8b 45 0c             	mov    0xc(%ebp),%eax
  c1:	83 c0 08             	add    $0x8,%eax
  c4:	8b 00                	mov    (%eax),%eax
  c6:	89 54 24 04          	mov    %edx,0x4(%esp)
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 12 08 00 00       	call   8e4 <exec>
    exit();
  d2:	e8 d5 07 00 00       	call   8ac <exit>
  }

  printf(1, "%s started on vc0\n", argv[1]);
  d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  da:	83 c0 04             	add    $0x4,%eax
  dd:	8b 00                	mov    (%eax),%eax
  df:	89 44 24 08          	mov    %eax,0x8(%esp)
  e3:	c7 44 24 04 7f 0e 00 	movl   $0xe7f,0x4(%esp)
  ea:	00 
  eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f2:	e8 92 09 00 00       	call   a89 <printf>

  exit();
  f7:	e8 b0 07 00 00       	call   8ac <exit>

000000fc <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	57                   	push   %edi
 100:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 101:	8b 4d 08             	mov    0x8(%ebp),%ecx
 104:	8b 55 10             	mov    0x10(%ebp),%edx
 107:	8b 45 0c             	mov    0xc(%ebp),%eax
 10a:	89 cb                	mov    %ecx,%ebx
 10c:	89 df                	mov    %ebx,%edi
 10e:	89 d1                	mov    %edx,%ecx
 110:	fc                   	cld    
 111:	f3 aa                	rep stos %al,%es:(%edi)
 113:	89 ca                	mov    %ecx,%edx
 115:	89 fb                	mov    %edi,%ebx
 117:	89 5d 08             	mov    %ebx,0x8(%ebp)
 11a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 11d:	5b                   	pop    %ebx
 11e:	5f                   	pop    %edi
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    

00000121 <strcpy>:
    20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
    30, 31, 32, 33, 34, 35};

char*
strcpy(char *s, char *t)
{
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
 124:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 127:	8b 45 08             	mov    0x8(%ebp),%eax
 12a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 12d:	90                   	nop
 12e:	8b 45 08             	mov    0x8(%ebp),%eax
 131:	8d 50 01             	lea    0x1(%eax),%edx
 134:	89 55 08             	mov    %edx,0x8(%ebp)
 137:	8b 55 0c             	mov    0xc(%ebp),%edx
 13a:	8d 4a 01             	lea    0x1(%edx),%ecx
 13d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 140:	8a 12                	mov    (%edx),%dl
 142:	88 10                	mov    %dl,(%eax)
 144:	8a 00                	mov    (%eax),%al
 146:	84 c0                	test   %al,%al
 148:	75 e4                	jne    12e <strcpy+0xd>
    ;
  return os;
 14a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14d:	c9                   	leave  
 14e:	c3                   	ret    

0000014f <copy>:

int 
copy(char *inputfile, char *outputfile, int used_disk, int max_disk)
{
 14f:	55                   	push   %ebp
 150:	89 e5                	mov    %esp,%ebp
 152:	83 ec 58             	sub    $0x58,%esp
  int fd1, fd2, count, bytes = 0, max;
 155:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  char buffer[32];
      
  if((fd1 = open(inputfile, O_RDONLY)) < 0)
 15c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 163:	00 
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	89 04 24             	mov    %eax,(%esp)
 16a:	e8 7d 07 00 00       	call   8ec <open>
 16f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 172:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 176:	79 20                	jns    198 <copy+0x49>
  {
      printf(1, "Cannot open inputfile: %s\n", inputfile);
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	89 44 24 08          	mov    %eax,0x8(%esp)
 17f:	c7 44 24 04 92 0e 00 	movl   $0xe92,0x4(%esp)
 186:	00 
 187:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18e:	e8 f6 08 00 00       	call   a89 <printf>
      exit();
 193:	e8 14 07 00 00       	call   8ac <exit>
  }
  if((fd2 = open(outputfile, O_CREATE | O_WRONLY)) < 0)
 198:	c7 44 24 04 01 02 00 	movl   $0x201,0x4(%esp)
 19f:	00 
 1a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a3:	89 04 24             	mov    %eax,(%esp)
 1a6:	e8 41 07 00 00       	call   8ec <open>
 1ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
 1ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 1b2:	79 20                	jns    1d4 <copy+0x85>
  {
      printf(1, "Cannot open outputfile: %s\n", outputfile);
 1b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b7:	89 44 24 08          	mov    %eax,0x8(%esp)
 1bb:	c7 44 24 04 ad 0e 00 	movl   $0xead,0x4(%esp)
 1c2:	00 
 1c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ca:	e8 ba 08 00 00       	call   a89 <printf>
      exit();
 1cf:	e8 d8 06 00 00       	call   8ac <exit>
  }

  while((count = read(fd1, buffer, 32)) > 0)
 1d4:	eb 3b                	jmp    211 <copy+0xc2>
  {
      max = used_disk+=count;
 1d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 1d9:	01 45 10             	add    %eax,0x10(%ebp)
 1dc:	8b 45 10             	mov    0x10(%ebp),%eax
 1df:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(max > max_disk)
 1e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 1e5:	3b 45 14             	cmp    0x14(%ebp),%eax
 1e8:	7e 07                	jle    1f1 <copy+0xa2>
      {
        return -1;
 1ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1ef:	eb 5c                	jmp    24d <copy+0xfe>
      }
      bytes = bytes + count;
 1f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 1f4:	01 45 f4             	add    %eax,-0xc(%ebp)
      write(fd2, buffer, 32);
 1f7:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
 1fe:	00 
 1ff:	8d 45 c4             	lea    -0x3c(%ebp),%eax
 202:	89 44 24 04          	mov    %eax,0x4(%esp)
 206:	8b 45 ec             	mov    -0x14(%ebp),%eax
 209:	89 04 24             	mov    %eax,(%esp)
 20c:	e8 bb 06 00 00       	call   8cc <write>
  {
      printf(1, "Cannot open outputfile: %s\n", outputfile);
      exit();
  }

  while((count = read(fd1, buffer, 32)) > 0)
 211:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
 218:	00 
 219:	8d 45 c4             	lea    -0x3c(%ebp),%eax
 21c:	89 44 24 04          	mov    %eax,0x4(%esp)
 220:	8b 45 f0             	mov    -0x10(%ebp),%eax
 223:	89 04 24             	mov    %eax,(%esp)
 226:	e8 99 06 00 00       	call   8c4 <read>
 22b:	89 45 e8             	mov    %eax,-0x18(%ebp)
 22e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 232:	7f a2                	jg     1d6 <copy+0x87>
      }
      bytes = bytes + count;
      write(fd2, buffer, 32);
  }

  close(fd1);
 234:	8b 45 f0             	mov    -0x10(%ebp),%eax
 237:	89 04 24             	mov    %eax,(%esp)
 23a:	e8 95 06 00 00       	call   8d4 <close>
  close(fd2);
 23f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 8a 06 00 00       	call   8d4 <close>
  return(bytes);
 24a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 252:	eb 06                	jmp    25a <strcmp+0xb>
    p++, q++;
 254:	ff 45 08             	incl   0x8(%ebp)
 257:	ff 45 0c             	incl   0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	8a 00                	mov    (%eax),%al
 25f:	84 c0                	test   %al,%al
 261:	74 0e                	je     271 <strcmp+0x22>
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	8a 10                	mov    (%eax),%dl
 268:	8b 45 0c             	mov    0xc(%ebp),%eax
 26b:	8a 00                	mov    (%eax),%al
 26d:	38 c2                	cmp    %al,%dl
 26f:	74 e3                	je     254 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	8a 00                	mov    (%eax),%al
 276:	0f b6 d0             	movzbl %al,%edx
 279:	8b 45 0c             	mov    0xc(%ebp),%eax
 27c:	8a 00                	mov    (%eax),%al
 27e:	0f b6 c0             	movzbl %al,%eax
 281:	29 c2                	sub    %eax,%edx
 283:	89 d0                	mov    %edx,%eax
}
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    

00000287 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
 28a:	eb 09                	jmp    295 <strncmp+0xe>
    n--, p++, q++;
 28c:	ff 4d 10             	decl   0x10(%ebp)
 28f:	ff 45 08             	incl   0x8(%ebp)
 292:	ff 45 0c             	incl   0xc(%ebp)
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
 295:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 299:	74 17                	je     2b2 <strncmp+0x2b>
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	8a 00                	mov    (%eax),%al
 2a0:	84 c0                	test   %al,%al
 2a2:	74 0e                	je     2b2 <strncmp+0x2b>
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8a 10                	mov    (%eax),%dl
 2a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ac:	8a 00                	mov    (%eax),%al
 2ae:	38 c2                	cmp    %al,%dl
 2b0:	74 da                	je     28c <strncmp+0x5>
    n--, p++, q++;
  if(n == 0)
 2b2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2b6:	75 07                	jne    2bf <strncmp+0x38>
    return 0;
 2b8:	b8 00 00 00 00       	mov    $0x0,%eax
 2bd:	eb 14                	jmp    2d3 <strncmp+0x4c>
  return (uchar)*p - (uchar)*q;
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	8a 00                	mov    (%eax),%al
 2c4:	0f b6 d0             	movzbl %al,%edx
 2c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ca:	8a 00                	mov    (%eax),%al
 2cc:	0f b6 c0             	movzbl %al,%eax
 2cf:	29 c2                	sub    %eax,%edx
 2d1:	89 d0                	mov    %edx,%eax
}
 2d3:	5d                   	pop    %ebp
 2d4:	c3                   	ret    

000002d5 <strlen>:

uint
strlen(const char *s)
{
 2d5:	55                   	push   %ebp
 2d6:	89 e5                	mov    %esp,%ebp
 2d8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 2db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2e2:	eb 03                	jmp    2e7 <strlen+0x12>
 2e4:	ff 45 fc             	incl   -0x4(%ebp)
 2e7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
 2ed:	01 d0                	add    %edx,%eax
 2ef:	8a 00                	mov    (%eax),%al
 2f1:	84 c0                	test   %al,%al
 2f3:	75 ef                	jne    2e4 <strlen+0xf>
    ;
  return n;
 2f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2f8:	c9                   	leave  
 2f9:	c3                   	ret    

000002fa <memset>:

void*
memset(void *dst, int c, uint n)
{
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 300:	8b 45 10             	mov    0x10(%ebp),%eax
 303:	89 44 24 08          	mov    %eax,0x8(%esp)
 307:	8b 45 0c             	mov    0xc(%ebp),%eax
 30a:	89 44 24 04          	mov    %eax,0x4(%esp)
 30e:	8b 45 08             	mov    0x8(%ebp),%eax
 311:	89 04 24             	mov    %eax,(%esp)
 314:	e8 e3 fd ff ff       	call   fc <stosb>
  return dst;
 319:	8b 45 08             	mov    0x8(%ebp),%eax
}
 31c:	c9                   	leave  
 31d:	c3                   	ret    

0000031e <strchr>:

char*
strchr(const char *s, char c)
{
 31e:	55                   	push   %ebp
 31f:	89 e5                	mov    %esp,%ebp
 321:	83 ec 04             	sub    $0x4,%esp
 324:	8b 45 0c             	mov    0xc(%ebp),%eax
 327:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 32a:	eb 12                	jmp    33e <strchr+0x20>
    if(*s == c)
 32c:	8b 45 08             	mov    0x8(%ebp),%eax
 32f:	8a 00                	mov    (%eax),%al
 331:	3a 45 fc             	cmp    -0x4(%ebp),%al
 334:	75 05                	jne    33b <strchr+0x1d>
      return (char*)s;
 336:	8b 45 08             	mov    0x8(%ebp),%eax
 339:	eb 11                	jmp    34c <strchr+0x2e>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 33b:	ff 45 08             	incl   0x8(%ebp)
 33e:	8b 45 08             	mov    0x8(%ebp),%eax
 341:	8a 00                	mov    (%eax),%al
 343:	84 c0                	test   %al,%al
 345:	75 e5                	jne    32c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 347:	b8 00 00 00 00       	mov    $0x0,%eax
}
 34c:	c9                   	leave  
 34d:	c3                   	ret    

0000034e <strcat>:

char *
strcat(char *dest, const char *src)
{
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
 351:	83 ec 10             	sub    $0x10,%esp
    int i,j;
    for (i = 0; dest[i] != '\0'; i++)
 354:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 35b:	eb 03                	jmp    360 <strcat+0x12>
 35d:	ff 45 fc             	incl   -0x4(%ebp)
 360:	8b 55 fc             	mov    -0x4(%ebp),%edx
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	01 d0                	add    %edx,%eax
 368:	8a 00                	mov    (%eax),%al
 36a:	84 c0                	test   %al,%al
 36c:	75 ef                	jne    35d <strcat+0xf>
        ;
    for (j = 0; src[j] != '\0'; j++)
 36e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 375:	eb 1e                	jmp    395 <strcat+0x47>
        dest[i+j] = src[j];
 377:	8b 45 f8             	mov    -0x8(%ebp),%eax
 37a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 37d:	01 d0                	add    %edx,%eax
 37f:	89 c2                	mov    %eax,%edx
 381:	8b 45 08             	mov    0x8(%ebp),%eax
 384:	01 c2                	add    %eax,%edx
 386:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 389:	8b 45 0c             	mov    0xc(%ebp),%eax
 38c:	01 c8                	add    %ecx,%eax
 38e:	8a 00                	mov    (%eax),%al
 390:	88 02                	mov    %al,(%edx)
strcat(char *dest, const char *src)
{
    int i,j;
    for (i = 0; dest[i] != '\0'; i++)
        ;
    for (j = 0; src[j] != '\0'; j++)
 392:	ff 45 f8             	incl   -0x8(%ebp)
 395:	8b 55 f8             	mov    -0x8(%ebp),%edx
 398:	8b 45 0c             	mov    0xc(%ebp),%eax
 39b:	01 d0                	add    %edx,%eax
 39d:	8a 00                	mov    (%eax),%al
 39f:	84 c0                	test   %al,%al
 3a1:	75 d4                	jne    377 <strcat+0x29>
        dest[i+j] = src[j];
    dest[i+j] = '\0';
 3a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3a6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3a9:	01 d0                	add    %edx,%eax
 3ab:	89 c2                	mov    %eax,%edx
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
 3b0:	01 d0                	add    %edx,%eax
 3b2:	c6 00 00             	movb   $0x0,(%eax)
    return dest;
 3b5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <strstr>:

int 
strstr(char* s, char* sub)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	83 ec 14             	sub    $0x14,%esp
    int i, j;

    for(i = 0; s[i] != '\0'; i++)
 3c0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3c7:	eb 7c                	jmp    445 <strstr+0x8b>
    {
        if(s[i] == sub[0])
 3c9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	01 d0                	add    %edx,%eax
 3d1:	8a 10                	mov    (%eax),%dl
 3d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d6:	8a 00                	mov    (%eax),%al
 3d8:	38 c2                	cmp    %al,%dl
 3da:	75 66                	jne    442 <strstr+0x88>
        {
            if(strlen(sub) == 1)
 3dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3df:	89 04 24             	mov    %eax,(%esp)
 3e2:	e8 ee fe ff ff       	call   2d5 <strlen>
 3e7:	83 f8 01             	cmp    $0x1,%eax
 3ea:	75 05                	jne    3f1 <strstr+0x37>
            {  
                return i;
 3ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ef:	eb 6b                	jmp    45c <strstr+0xa2>
            }
            for(j = 1; sub[j] != '\0'; j++)
 3f1:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
 3f8:	eb 3a                	jmp    434 <strstr+0x7a>
            {
                if(s[i + j] == sub[j])
 3fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3fd:	8b 55 fc             	mov    -0x4(%ebp),%edx
 400:	01 d0                	add    %edx,%eax
 402:	89 c2                	mov    %eax,%edx
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	01 d0                	add    %edx,%eax
 409:	8a 10                	mov    (%eax),%dl
 40b:	8b 4d f8             	mov    -0x8(%ebp),%ecx
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	01 c8                	add    %ecx,%eax
 413:	8a 00                	mov    (%eax),%al
 415:	38 c2                	cmp    %al,%dl
 417:	75 16                	jne    42f <strstr+0x75>
                {
                    if(sub[j + 1] == '\0')
 419:	8b 45 f8             	mov    -0x8(%ebp),%eax
 41c:	8d 50 01             	lea    0x1(%eax),%edx
 41f:	8b 45 0c             	mov    0xc(%ebp),%eax
 422:	01 d0                	add    %edx,%eax
 424:	8a 00                	mov    (%eax),%al
 426:	84 c0                	test   %al,%al
 428:	75 07                	jne    431 <strstr+0x77>
                    {
                        return i;
 42a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 42d:	eb 2d                	jmp    45c <strstr+0xa2>
                    }
                }
                else
                {
                    break;
 42f:	eb 11                	jmp    442 <strstr+0x88>
        {
            if(strlen(sub) == 1)
            {  
                return i;
            }
            for(j = 1; sub[j] != '\0'; j++)
 431:	ff 45 f8             	incl   -0x8(%ebp)
 434:	8b 55 f8             	mov    -0x8(%ebp),%edx
 437:	8b 45 0c             	mov    0xc(%ebp),%eax
 43a:	01 d0                	add    %edx,%eax
 43c:	8a 00                	mov    (%eax),%al
 43e:	84 c0                	test   %al,%al
 440:	75 b8                	jne    3fa <strstr+0x40>
int 
strstr(char* s, char* sub)
{
    int i, j;

    for(i = 0; s[i] != '\0'; i++)
 442:	ff 45 fc             	incl   -0x4(%ebp)
 445:	8b 55 fc             	mov    -0x4(%ebp),%edx
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	01 d0                	add    %edx,%eax
 44d:	8a 00                	mov    (%eax),%al
 44f:	84 c0                	test   %al,%al
 451:	0f 85 72 ff ff ff    	jne    3c9 <strstr+0xf>
                    break;
                }
            }
        }
     }
     return -1;
 457:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 45c:	c9                   	leave  
 45d:	c3                   	ret    

0000045e <strtok>:

char *
strtok(char *s, const char *delim)
{
 45e:	55                   	push   %ebp
 45f:	89 e5                	mov    %esp,%ebp
 461:	53                   	push   %ebx
 462:	83 ec 14             	sub    $0x14,%esp
    static char *lasts;
    register int ch;

    if (s == 0)
 465:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 469:	75 08                	jne    473 <strtok+0x15>
  s = lasts;
 46b:	a1 c4 12 00 00       	mov    0x12c4,%eax
 470:	89 45 08             	mov    %eax,0x8(%ebp)
    do {
  if ((ch = *s++) == '\0')
 473:	8b 45 08             	mov    0x8(%ebp),%eax
 476:	8d 50 01             	lea    0x1(%eax),%edx
 479:	89 55 08             	mov    %edx,0x8(%ebp)
 47c:	8a 00                	mov    (%eax),%al
 47e:	0f be d8             	movsbl %al,%ebx
 481:	85 db                	test   %ebx,%ebx
 483:	75 07                	jne    48c <strtok+0x2e>
      return 0;
 485:	b8 00 00 00 00       	mov    $0x0,%eax
 48a:	eb 58                	jmp    4e4 <strtok+0x86>
    } while (strchr(delim, ch));
 48c:	88 d8                	mov    %bl,%al
 48e:	0f be c0             	movsbl %al,%eax
 491:	89 44 24 04          	mov    %eax,0x4(%esp)
 495:	8b 45 0c             	mov    0xc(%ebp),%eax
 498:	89 04 24             	mov    %eax,(%esp)
 49b:	e8 7e fe ff ff       	call   31e <strchr>
 4a0:	85 c0                	test   %eax,%eax
 4a2:	75 cf                	jne    473 <strtok+0x15>
    --s;
 4a4:	ff 4d 08             	decl   0x8(%ebp)
    lasts = s + strcspn(s, delim);
 4a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ae:	8b 45 08             	mov    0x8(%ebp),%eax
 4b1:	89 04 24             	mov    %eax,(%esp)
 4b4:	e8 31 00 00 00       	call   4ea <strcspn>
 4b9:	89 c2                	mov    %eax,%edx
 4bb:	8b 45 08             	mov    0x8(%ebp),%eax
 4be:	01 d0                	add    %edx,%eax
 4c0:	a3 c4 12 00 00       	mov    %eax,0x12c4
    if (*lasts != 0)
 4c5:	a1 c4 12 00 00       	mov    0x12c4,%eax
 4ca:	8a 00                	mov    (%eax),%al
 4cc:	84 c0                	test   %al,%al
 4ce:	74 11                	je     4e1 <strtok+0x83>
  *lasts++ = 0;
 4d0:	a1 c4 12 00 00       	mov    0x12c4,%eax
 4d5:	8d 50 01             	lea    0x1(%eax),%edx
 4d8:	89 15 c4 12 00 00    	mov    %edx,0x12c4
 4de:	c6 00 00             	movb   $0x0,(%eax)
    return s;
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e4:	83 c4 14             	add    $0x14,%esp
 4e7:	5b                   	pop    %ebx
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    

000004ea <strcspn>:

int
strcspn(const char *s1, const char *s2)
{
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
 4ed:	83 ec 18             	sub    $0x18,%esp
    int ret=0;
 4f0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while(*s1)
 4f7:	eb 26                	jmp    51f <strcspn+0x35>
        if(strchr(s2,*s1))
 4f9:	8b 45 08             	mov    0x8(%ebp),%eax
 4fc:	8a 00                	mov    (%eax),%al
 4fe:	0f be c0             	movsbl %al,%eax
 501:	89 44 24 04          	mov    %eax,0x4(%esp)
 505:	8b 45 0c             	mov    0xc(%ebp),%eax
 508:	89 04 24             	mov    %eax,(%esp)
 50b:	e8 0e fe ff ff       	call   31e <strchr>
 510:	85 c0                	test   %eax,%eax
 512:	74 05                	je     519 <strcspn+0x2f>
            return ret;
 514:	8b 45 fc             	mov    -0x4(%ebp),%eax
 517:	eb 12                	jmp    52b <strcspn+0x41>
        else
            s1++,ret++;
 519:	ff 45 08             	incl   0x8(%ebp)
 51c:	ff 45 fc             	incl   -0x4(%ebp)

int
strcspn(const char *s1, const char *s2)
{
    int ret=0;
    while(*s1)
 51f:	8b 45 08             	mov    0x8(%ebp),%eax
 522:	8a 00                	mov    (%eax),%al
 524:	84 c0                	test   %al,%al
 526:	75 d1                	jne    4f9 <strcspn+0xf>
        if(strchr(s2,*s1))
            return ret;
        else
            s1++,ret++;
    return ret;
 528:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 52b:	c9                   	leave  
 52c:	c3                   	ret    

0000052d <isspace>:

int
isspace(unsigned char c)
{
 52d:	55                   	push   %ebp
 52e:	89 e5                	mov    %esp,%ebp
 530:	83 ec 04             	sub    $0x4,%esp
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	88 45 fc             	mov    %al,-0x4(%ebp)
    return c == '\n' || c == ' ' || c == '\f' ||
    c == '\r' || c == '\t' || c == '\v';
 539:	80 7d fc 0a          	cmpb   $0xa,-0x4(%ebp)
 53d:	74 1e                	je     55d <isspace+0x30>
}

int
isspace(unsigned char c)
{
    return c == '\n' || c == ' ' || c == '\f' ||
 53f:	80 7d fc 20          	cmpb   $0x20,-0x4(%ebp)
 543:	74 18                	je     55d <isspace+0x30>
 545:	80 7d fc 0c          	cmpb   $0xc,-0x4(%ebp)
 549:	74 12                	je     55d <isspace+0x30>
 54b:	80 7d fc 0d          	cmpb   $0xd,-0x4(%ebp)
 54f:	74 0c                	je     55d <isspace+0x30>
    c == '\r' || c == '\t' || c == '\v';
 551:	80 7d fc 09          	cmpb   $0x9,-0x4(%ebp)
 555:	74 06                	je     55d <isspace+0x30>
 557:	80 7d fc 0b          	cmpb   $0xb,-0x4(%ebp)
 55b:	75 07                	jne    564 <isspace+0x37>
 55d:	b8 01 00 00 00       	mov    $0x1,%eax
 562:	eb 05                	jmp    569 <isspace+0x3c>
 564:	b8 00 00 00 00       	mov    $0x0,%eax
}
 569:	c9                   	leave  
 56a:	c3                   	ret    

0000056b <strtoul>:

uint
strtoul(char *string, char **endPtr, int base)
{
 56b:	55                   	push   %ebp
 56c:	89 e5                	mov    %esp,%ebp
 56e:	57                   	push   %edi
 56f:	56                   	push   %esi
 570:	53                   	push   %ebx
 571:	83 ec 14             	sub    $0x14,%esp
    register char *p;
    register unsigned long int result = 0;
 574:	bf 00 00 00 00       	mov    $0x0,%edi
    register unsigned digit;
    int anyDigits = 0;
 579:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

    /*
     * Skip any leading blanks.
     */

    p = string;
 580:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (isspace(*p)) {
 583:	eb 01                	jmp    586 <strtoul+0x1b>
  p += 1;
 585:	43                   	inc    %ebx
    /*
     * Skip any leading blanks.
     */

    p = string;
    while (isspace(*p)) {
 586:	8a 03                	mov    (%ebx),%al
 588:	0f b6 c0             	movzbl %al,%eax
 58b:	89 04 24             	mov    %eax,(%esp)
 58e:	e8 9a ff ff ff       	call   52d <isspace>
 593:	85 c0                	test   %eax,%eax
 595:	75 ee                	jne    585 <strtoul+0x1a>
    /*
     * If no base was provided, pick one from the leading characters
     * of the string.
     */
    
    if (base == 0)
 597:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 59b:	75 30                	jne    5cd <strtoul+0x62>
    {
  if (*p == '0') {
 59d:	8a 03                	mov    (%ebx),%al
 59f:	3c 30                	cmp    $0x30,%al
 5a1:	75 21                	jne    5c4 <strtoul+0x59>
      p += 1;
 5a3:	43                   	inc    %ebx
      if (*p == 'x') {
 5a4:	8a 03                	mov    (%ebx),%al
 5a6:	3c 78                	cmp    $0x78,%al
 5a8:	75 0a                	jne    5b4 <strtoul+0x49>
    p += 1;
 5aa:	43                   	inc    %ebx
    base = 16;
 5ab:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 5b2:	eb 31                	jmp    5e5 <strtoul+0x7a>
    /*
     * Must set anyDigits here, otherwise "0" produces a
     * "no digits" error.
     */

    anyDigits = 1;
 5b4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    base = 8;
 5bb:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 5c2:	eb 21                	jmp    5e5 <strtoul+0x7a>
      }
  }
  else base = 10;
 5c4:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)
 5cb:	eb 18                	jmp    5e5 <strtoul+0x7a>
    } else if (base == 16) {
 5cd:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 5d1:	75 12                	jne    5e5 <strtoul+0x7a>

  /*
   * Skip a leading "0x" from hex numbers.
   */

  if ((p[0] == '0') && (p[1] == 'x')) {
 5d3:	8a 03                	mov    (%ebx),%al
 5d5:	3c 30                	cmp    $0x30,%al
 5d7:	75 0c                	jne    5e5 <strtoul+0x7a>
 5d9:	8d 43 01             	lea    0x1(%ebx),%eax
 5dc:	8a 00                	mov    (%eax),%al
 5de:	3c 78                	cmp    $0x78,%al
 5e0:	75 03                	jne    5e5 <strtoul+0x7a>
      p += 2;
 5e2:	83 c3 02             	add    $0x2,%ebx
    /*
     * Sorry this code is so messy, but speed seems important.  Do
     * different things for base 8, 10, 16, and other.
     */

    if (base == 8) {
 5e5:	83 7d 10 08          	cmpl   $0x8,0x10(%ebp)
 5e9:	75 29                	jne    614 <strtoul+0xa9>
  for ( ; ; p += 1) {
      digit = *p - '0';
 5eb:	8a 03                	mov    (%ebx),%al
 5ed:	0f be c0             	movsbl %al,%eax
 5f0:	83 e8 30             	sub    $0x30,%eax
 5f3:	89 c6                	mov    %eax,%esi
      if (digit > 7) {
 5f5:	83 fe 07             	cmp    $0x7,%esi
 5f8:	76 06                	jbe    600 <strtoul+0x95>
    break;
 5fa:	90                   	nop
 5fb:	e9 b6 00 00 00       	jmp    6b6 <strtoul+0x14b>
      }
      result = (result << 3) + digit;
 600:	8d 04 fd 00 00 00 00 	lea    0x0(,%edi,8),%eax
 607:	8d 3c 30             	lea    (%eax,%esi,1),%edi
      anyDigits = 1;
 60a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
     * Sorry this code is so messy, but speed seems important.  Do
     * different things for base 8, 10, 16, and other.
     */

    if (base == 8) {
  for ( ; ; p += 1) {
 611:	43                   	inc    %ebx
      if (digit > 7) {
    break;
      }
      result = (result << 3) + digit;
      anyDigits = 1;
  }
 612:	eb d7                	jmp    5eb <strtoul+0x80>
    } else if (base == 10) {
 614:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
 618:	75 2b                	jne    645 <strtoul+0xda>
  for ( ; ; p += 1) {
      digit = *p - '0';
 61a:	8a 03                	mov    (%ebx),%al
 61c:	0f be c0             	movsbl %al,%eax
 61f:	83 e8 30             	sub    $0x30,%eax
 622:	89 c6                	mov    %eax,%esi
      if (digit > 9) {
 624:	83 fe 09             	cmp    $0x9,%esi
 627:	76 06                	jbe    62f <strtoul+0xc4>
    break;
 629:	90                   	nop
 62a:	e9 87 00 00 00       	jmp    6b6 <strtoul+0x14b>
      }
      result = (10*result) + digit;
 62f:	89 f8                	mov    %edi,%eax
 631:	c1 e0 02             	shl    $0x2,%eax
 634:	01 f8                	add    %edi,%eax
 636:	01 c0                	add    %eax,%eax
 638:	8d 3c 30             	lea    (%eax,%esi,1),%edi
      anyDigits = 1;
 63b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
      }
      result = (result << 3) + digit;
      anyDigits = 1;
  }
    } else if (base == 10) {
  for ( ; ; p += 1) {
 642:	43                   	inc    %ebx
      if (digit > 9) {
    break;
      }
      result = (10*result) + digit;
      anyDigits = 1;
  }
 643:	eb d5                	jmp    61a <strtoul+0xaf>
    } else if (base == 16) {
 645:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 649:	75 35                	jne    680 <strtoul+0x115>
  for ( ; ; p += 1) {
      digit = *p - '0';
 64b:	8a 03                	mov    (%ebx),%al
 64d:	0f be c0             	movsbl %al,%eax
 650:	83 e8 30             	sub    $0x30,%eax
 653:	89 c6                	mov    %eax,%esi
      if (digit > ('z' - '0')) {
 655:	83 fe 4a             	cmp    $0x4a,%esi
 658:	76 02                	jbe    65c <strtoul+0xf1>
    break;
 65a:	eb 22                	jmp    67e <strtoul+0x113>
      }
      digit = cvtIn[digit];
 65c:	8a 86 60 12 00 00    	mov    0x1260(%esi),%al
 662:	0f be f0             	movsbl %al,%esi
      if (digit > 15) {
 665:	83 fe 0f             	cmp    $0xf,%esi
 668:	76 02                	jbe    66c <strtoul+0x101>
    break;
 66a:	eb 12                	jmp    67e <strtoul+0x113>
      }
      result = (result << 4) + digit;
 66c:	89 f8                	mov    %edi,%eax
 66e:	c1 e0 04             	shl    $0x4,%eax
 671:	8d 3c 30             	lea    (%eax,%esi,1),%edi
      anyDigits = 1;
 674:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
      }
      result = (10*result) + digit;
      anyDigits = 1;
  }
    } else if (base == 16) {
  for ( ; ; p += 1) {
 67b:	43                   	inc    %ebx
      if (digit > 15) {
    break;
      }
      result = (result << 4) + digit;
      anyDigits = 1;
  }
 67c:	eb cd                	jmp    64b <strtoul+0xe0>
 67e:	eb 36                	jmp    6b6 <strtoul+0x14b>
    } else {
  for ( ; ; p += 1) {
      digit = *p - '0';
 680:	8a 03                	mov    (%ebx),%al
 682:	0f be c0             	movsbl %al,%eax
 685:	83 e8 30             	sub    $0x30,%eax
 688:	89 c6                	mov    %eax,%esi
      if (digit > ('z' - '0')) {
 68a:	83 fe 4a             	cmp    $0x4a,%esi
 68d:	76 02                	jbe    691 <strtoul+0x126>
    break;
 68f:	eb 25                	jmp    6b6 <strtoul+0x14b>
      }
      digit = cvtIn[digit];
 691:	8a 86 60 12 00 00    	mov    0x1260(%esi),%al
 697:	0f be f0             	movsbl %al,%esi
      if (digit >= base) {
 69a:	8b 45 10             	mov    0x10(%ebp),%eax
 69d:	39 f0                	cmp    %esi,%eax
 69f:	77 02                	ja     6a3 <strtoul+0x138>
    break;
 6a1:	eb 13                	jmp    6b6 <strtoul+0x14b>
      }
      result = result*base + digit;
 6a3:	8b 45 10             	mov    0x10(%ebp),%eax
 6a6:	0f af c7             	imul   %edi,%eax
 6a9:	8d 3c 30             	lea    (%eax,%esi,1),%edi
      anyDigits = 1;
 6ac:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
      }
      result = (result << 4) + digit;
      anyDigits = 1;
  }
    } else {
  for ( ; ; p += 1) {
 6b3:	43                   	inc    %ebx
      if (digit >= base) {
    break;
      }
      result = result*base + digit;
      anyDigits = 1;
  }
 6b4:	eb ca                	jmp    680 <strtoul+0x115>

    /*
     * See if there were any digits at all.
     */

    if (!anyDigits) {
 6b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6ba:	75 03                	jne    6bf <strtoul+0x154>
  p = string;
 6bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
    }

    if (endPtr != 0) {
 6bf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6c3:	74 05                	je     6ca <strtoul+0x15f>
  *endPtr = p;
 6c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c8:	89 18                	mov    %ebx,(%eax)
    }

    return result;
 6ca:	89 f8                	mov    %edi,%eax
}
 6cc:	83 c4 14             	add    $0x14,%esp
 6cf:	5b                   	pop    %ebx
 6d0:	5e                   	pop    %esi
 6d1:	5f                   	pop    %edi
 6d2:	5d                   	pop    %ebp
 6d3:	c3                   	ret    

000006d4 <strtol>:

int
strtol(char *string, char **endPtr, int base)
{
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	53                   	push   %ebx
 6d8:	83 ec 1c             	sub    $0x1c,%esp

    /*
     * Skip any leading blanks.
     */

    p = string;
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
    while (isspace(*p)) {
 6de:	eb 01                	jmp    6e1 <strtol+0xd>
      p += 1;
 6e0:	43                   	inc    %ebx
    /*
     * Skip any leading blanks.
     */

    p = string;
    while (isspace(*p)) {
 6e1:	8a 03                	mov    (%ebx),%al
 6e3:	0f b6 c0             	movzbl %al,%eax
 6e6:	89 04 24             	mov    %eax,(%esp)
 6e9:	e8 3f fe ff ff       	call   52d <isspace>
 6ee:	85 c0                	test   %eax,%eax
 6f0:	75 ee                	jne    6e0 <strtol+0xc>

    /*
     * Check for a sign.
     */

    if (*p == '-') {
 6f2:	8a 03                	mov    (%ebx),%al
 6f4:	3c 2d                	cmp    $0x2d,%al
 6f6:	75 1e                	jne    716 <strtol+0x42>
  p += 1;
 6f8:	43                   	inc    %ebx
  result = -(strtoul(p, endPtr, base));
 6f9:	8b 45 10             	mov    0x10(%ebp),%eax
 6fc:	89 44 24 08          	mov    %eax,0x8(%esp)
 700:	8b 45 0c             	mov    0xc(%ebp),%eax
 703:	89 44 24 04          	mov    %eax,0x4(%esp)
 707:	89 1c 24             	mov    %ebx,(%esp)
 70a:	e8 5c fe ff ff       	call   56b <strtoul>
 70f:	f7 d8                	neg    %eax
 711:	89 45 f8             	mov    %eax,-0x8(%ebp)
 714:	eb 20                	jmp    736 <strtol+0x62>
    } else {
  if (*p == '+') {
 716:	8a 03                	mov    (%ebx),%al
 718:	3c 2b                	cmp    $0x2b,%al
 71a:	75 01                	jne    71d <strtol+0x49>
      p += 1;
 71c:	43                   	inc    %ebx
  }
  result = strtoul(p, endPtr, base);
 71d:	8b 45 10             	mov    0x10(%ebp),%eax
 720:	89 44 24 08          	mov    %eax,0x8(%esp)
 724:	8b 45 0c             	mov    0xc(%ebp),%eax
 727:	89 44 24 04          	mov    %eax,0x4(%esp)
 72b:	89 1c 24             	mov    %ebx,(%esp)
 72e:	e8 38 fe ff ff       	call   56b <strtoul>
 733:	89 45 f8             	mov    %eax,-0x8(%ebp)
    }
    if ((result == 0) && (endPtr != 0) && (*endPtr == p)) {
 736:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
 73a:	75 17                	jne    753 <strtol+0x7f>
 73c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 740:	74 11                	je     753 <strtol+0x7f>
 742:	8b 45 0c             	mov    0xc(%ebp),%eax
 745:	8b 00                	mov    (%eax),%eax
 747:	39 d8                	cmp    %ebx,%eax
 749:	75 08                	jne    753 <strtol+0x7f>
  *endPtr = string;
 74b:	8b 45 0c             	mov    0xc(%ebp),%eax
 74e:	8b 55 08             	mov    0x8(%ebp),%edx
 751:	89 10                	mov    %edx,(%eax)
    }
    return result;
 753:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 756:	83 c4 1c             	add    $0x1c,%esp
 759:	5b                   	pop    %ebx
 75a:	5d                   	pop    %ebp
 75b:	c3                   	ret    

0000075c <gets>:

char*
gets(char *buf, int max)
{
 75c:	55                   	push   %ebp
 75d:	89 e5                	mov    %esp,%ebp
 75f:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 762:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 769:	eb 49                	jmp    7b4 <gets+0x58>
    cc = read(0, &c, 1);
 76b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 772:	00 
 773:	8d 45 ef             	lea    -0x11(%ebp),%eax
 776:	89 44 24 04          	mov    %eax,0x4(%esp)
 77a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 781:	e8 3e 01 00 00       	call   8c4 <read>
 786:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 789:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 78d:	7f 02                	jg     791 <gets+0x35>
      break;
 78f:	eb 2c                	jmp    7bd <gets+0x61>
    buf[i++] = c;
 791:	8b 45 f4             	mov    -0xc(%ebp),%eax
 794:	8d 50 01             	lea    0x1(%eax),%edx
 797:	89 55 f4             	mov    %edx,-0xc(%ebp)
 79a:	89 c2                	mov    %eax,%edx
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	01 c2                	add    %eax,%edx
 7a1:	8a 45 ef             	mov    -0x11(%ebp),%al
 7a4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 7a6:	8a 45 ef             	mov    -0x11(%ebp),%al
 7a9:	3c 0a                	cmp    $0xa,%al
 7ab:	74 10                	je     7bd <gets+0x61>
 7ad:	8a 45 ef             	mov    -0x11(%ebp),%al
 7b0:	3c 0d                	cmp    $0xd,%al
 7b2:	74 09                	je     7bd <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 7b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b7:	40                   	inc    %eax
 7b8:	3b 45 0c             	cmp    0xc(%ebp),%eax
 7bb:	7c ae                	jl     76b <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 7bd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7c0:	8b 45 08             	mov    0x8(%ebp),%eax
 7c3:	01 d0                	add    %edx,%eax
 7c5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 7c8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 7cb:	c9                   	leave  
 7cc:	c3                   	ret    

000007cd <stat>:

int
stat(char *n, struct stat *st)
{
 7cd:	55                   	push   %ebp
 7ce:	89 e5                	mov    %esp,%ebp
 7d0:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 7d3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 7da:	00 
 7db:	8b 45 08             	mov    0x8(%ebp),%eax
 7de:	89 04 24             	mov    %eax,(%esp)
 7e1:	e8 06 01 00 00       	call   8ec <open>
 7e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 7e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7ed:	79 07                	jns    7f6 <stat+0x29>
    return -1;
 7ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 7f4:	eb 23                	jmp    819 <stat+0x4c>
  r = fstat(fd, st);
 7f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 7f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 800:	89 04 24             	mov    %eax,(%esp)
 803:	e8 fc 00 00 00       	call   904 <fstat>
 808:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 80b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80e:	89 04 24             	mov    %eax,(%esp)
 811:	e8 be 00 00 00       	call   8d4 <close>
  return r;
 816:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 819:	c9                   	leave  
 81a:	c3                   	ret    

0000081b <atoi>:

int
atoi(const char *s)
{
 81b:	55                   	push   %ebp
 81c:	89 e5                	mov    %esp,%ebp
 81e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 821:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 828:	eb 24                	jmp    84e <atoi+0x33>
    n = n*10 + *s++ - '0';
 82a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 82d:	89 d0                	mov    %edx,%eax
 82f:	c1 e0 02             	shl    $0x2,%eax
 832:	01 d0                	add    %edx,%eax
 834:	01 c0                	add    %eax,%eax
 836:	89 c1                	mov    %eax,%ecx
 838:	8b 45 08             	mov    0x8(%ebp),%eax
 83b:	8d 50 01             	lea    0x1(%eax),%edx
 83e:	89 55 08             	mov    %edx,0x8(%ebp)
 841:	8a 00                	mov    (%eax),%al
 843:	0f be c0             	movsbl %al,%eax
 846:	01 c8                	add    %ecx,%eax
 848:	83 e8 30             	sub    $0x30,%eax
 84b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 84e:	8b 45 08             	mov    0x8(%ebp),%eax
 851:	8a 00                	mov    (%eax),%al
 853:	3c 2f                	cmp    $0x2f,%al
 855:	7e 09                	jle    860 <atoi+0x45>
 857:	8b 45 08             	mov    0x8(%ebp),%eax
 85a:	8a 00                	mov    (%eax),%al
 85c:	3c 39                	cmp    $0x39,%al
 85e:	7e ca                	jle    82a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 860:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 863:	c9                   	leave  
 864:	c3                   	ret    

00000865 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 865:	55                   	push   %ebp
 866:	89 e5                	mov    %esp,%ebp
 868:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 86b:	8b 45 08             	mov    0x8(%ebp),%eax
 86e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 871:	8b 45 0c             	mov    0xc(%ebp),%eax
 874:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 877:	eb 16                	jmp    88f <memmove+0x2a>
    *dst++ = *src++;
 879:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87c:	8d 50 01             	lea    0x1(%eax),%edx
 87f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 882:	8b 55 f8             	mov    -0x8(%ebp),%edx
 885:	8d 4a 01             	lea    0x1(%edx),%ecx
 888:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 88b:	8a 12                	mov    (%edx),%dl
 88d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 88f:	8b 45 10             	mov    0x10(%ebp),%eax
 892:	8d 50 ff             	lea    -0x1(%eax),%edx
 895:	89 55 10             	mov    %edx,0x10(%ebp)
 898:	85 c0                	test   %eax,%eax
 89a:	7f dd                	jg     879 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 89c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 89f:	c9                   	leave  
 8a0:	c3                   	ret    
 8a1:	90                   	nop
 8a2:	90                   	nop
 8a3:	90                   	nop

000008a4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 8a4:	b8 01 00 00 00       	mov    $0x1,%eax
 8a9:	cd 40                	int    $0x40
 8ab:	c3                   	ret    

000008ac <exit>:
SYSCALL(exit)
 8ac:	b8 02 00 00 00       	mov    $0x2,%eax
 8b1:	cd 40                	int    $0x40
 8b3:	c3                   	ret    

000008b4 <wait>:
SYSCALL(wait)
 8b4:	b8 03 00 00 00       	mov    $0x3,%eax
 8b9:	cd 40                	int    $0x40
 8bb:	c3                   	ret    

000008bc <pipe>:
SYSCALL(pipe)
 8bc:	b8 04 00 00 00       	mov    $0x4,%eax
 8c1:	cd 40                	int    $0x40
 8c3:	c3                   	ret    

000008c4 <read>:
SYSCALL(read)
 8c4:	b8 05 00 00 00       	mov    $0x5,%eax
 8c9:	cd 40                	int    $0x40
 8cb:	c3                   	ret    

000008cc <write>:
SYSCALL(write)
 8cc:	b8 10 00 00 00       	mov    $0x10,%eax
 8d1:	cd 40                	int    $0x40
 8d3:	c3                   	ret    

000008d4 <close>:
SYSCALL(close)
 8d4:	b8 15 00 00 00       	mov    $0x15,%eax
 8d9:	cd 40                	int    $0x40
 8db:	c3                   	ret    

000008dc <kill>:
SYSCALL(kill)
 8dc:	b8 06 00 00 00       	mov    $0x6,%eax
 8e1:	cd 40                	int    $0x40
 8e3:	c3                   	ret    

000008e4 <exec>:
SYSCALL(exec)
 8e4:	b8 07 00 00 00       	mov    $0x7,%eax
 8e9:	cd 40                	int    $0x40
 8eb:	c3                   	ret    

000008ec <open>:
SYSCALL(open)
 8ec:	b8 0f 00 00 00       	mov    $0xf,%eax
 8f1:	cd 40                	int    $0x40
 8f3:	c3                   	ret    

000008f4 <mknod>:
SYSCALL(mknod)
 8f4:	b8 11 00 00 00       	mov    $0x11,%eax
 8f9:	cd 40                	int    $0x40
 8fb:	c3                   	ret    

000008fc <unlink>:
SYSCALL(unlink)
 8fc:	b8 12 00 00 00       	mov    $0x12,%eax
 901:	cd 40                	int    $0x40
 903:	c3                   	ret    

00000904 <fstat>:
SYSCALL(fstat)
 904:	b8 08 00 00 00       	mov    $0x8,%eax
 909:	cd 40                	int    $0x40
 90b:	c3                   	ret    

0000090c <link>:
SYSCALL(link)
 90c:	b8 13 00 00 00       	mov    $0x13,%eax
 911:	cd 40                	int    $0x40
 913:	c3                   	ret    

00000914 <mkdir>:
SYSCALL(mkdir)
 914:	b8 14 00 00 00       	mov    $0x14,%eax
 919:	cd 40                	int    $0x40
 91b:	c3                   	ret    

0000091c <chdir>:
SYSCALL(chdir)
 91c:	b8 09 00 00 00       	mov    $0x9,%eax
 921:	cd 40                	int    $0x40
 923:	c3                   	ret    

00000924 <dup>:
SYSCALL(dup)
 924:	b8 0a 00 00 00       	mov    $0xa,%eax
 929:	cd 40                	int    $0x40
 92b:	c3                   	ret    

0000092c <getpid>:
SYSCALL(getpid)
 92c:	b8 0b 00 00 00       	mov    $0xb,%eax
 931:	cd 40                	int    $0x40
 933:	c3                   	ret    

00000934 <sbrk>:
SYSCALL(sbrk)
 934:	b8 0c 00 00 00       	mov    $0xc,%eax
 939:	cd 40                	int    $0x40
 93b:	c3                   	ret    

0000093c <sleep>:
SYSCALL(sleep)
 93c:	b8 0d 00 00 00       	mov    $0xd,%eax
 941:	cd 40                	int    $0x40
 943:	c3                   	ret    

00000944 <uptime>:
SYSCALL(uptime)
 944:	b8 0e 00 00 00       	mov    $0xe,%eax
 949:	cd 40                	int    $0x40
 94b:	c3                   	ret    

0000094c <getname>:
SYSCALL(getname)
 94c:	b8 16 00 00 00       	mov    $0x16,%eax
 951:	cd 40                	int    $0x40
 953:	c3                   	ret    

00000954 <setname>:
SYSCALL(setname)
 954:	b8 17 00 00 00       	mov    $0x17,%eax
 959:	cd 40                	int    $0x40
 95b:	c3                   	ret    

0000095c <getmaxproc>:
SYSCALL(getmaxproc)
 95c:	b8 18 00 00 00       	mov    $0x18,%eax
 961:	cd 40                	int    $0x40
 963:	c3                   	ret    

00000964 <setmaxproc>:
SYSCALL(setmaxproc)
 964:	b8 19 00 00 00       	mov    $0x19,%eax
 969:	cd 40                	int    $0x40
 96b:	c3                   	ret    

0000096c <getmaxmem>:
SYSCALL(getmaxmem)
 96c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 971:	cd 40                	int    $0x40
 973:	c3                   	ret    

00000974 <setmaxmem>:
SYSCALL(setmaxmem)
 974:	b8 1b 00 00 00       	mov    $0x1b,%eax
 979:	cd 40                	int    $0x40
 97b:	c3                   	ret    

0000097c <getmaxdisk>:
SYSCALL(getmaxdisk)
 97c:	b8 1c 00 00 00       	mov    $0x1c,%eax
 981:	cd 40                	int    $0x40
 983:	c3                   	ret    

00000984 <setmaxdisk>:
SYSCALL(setmaxdisk)
 984:	b8 1d 00 00 00       	mov    $0x1d,%eax
 989:	cd 40                	int    $0x40
 98b:	c3                   	ret    

0000098c <getusedmem>:
SYSCALL(getusedmem)
 98c:	b8 1e 00 00 00       	mov    $0x1e,%eax
 991:	cd 40                	int    $0x40
 993:	c3                   	ret    

00000994 <setusedmem>:
SYSCALL(setusedmem)
 994:	b8 1f 00 00 00       	mov    $0x1f,%eax
 999:	cd 40                	int    $0x40
 99b:	c3                   	ret    

0000099c <getuseddisk>:
SYSCALL(getuseddisk)
 99c:	b8 20 00 00 00       	mov    $0x20,%eax
 9a1:	cd 40                	int    $0x40
 9a3:	c3                   	ret    

000009a4 <setuseddisk>:
SYSCALL(setuseddisk)
 9a4:	b8 21 00 00 00       	mov    $0x21,%eax
 9a9:	cd 40                	int    $0x40
 9ab:	c3                   	ret    

000009ac <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 9ac:	55                   	push   %ebp
 9ad:	89 e5                	mov    %esp,%ebp
 9af:	83 ec 18             	sub    $0x18,%esp
 9b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 9b5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 9b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9bf:	00 
 9c0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 9c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 9c7:	8b 45 08             	mov    0x8(%ebp),%eax
 9ca:	89 04 24             	mov    %eax,(%esp)
 9cd:	e8 fa fe ff ff       	call   8cc <write>
}
 9d2:	c9                   	leave  
 9d3:	c3                   	ret    

000009d4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 9d4:	55                   	push   %ebp
 9d5:	89 e5                	mov    %esp,%ebp
 9d7:	56                   	push   %esi
 9d8:	53                   	push   %ebx
 9d9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 9dc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 9e3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 9e7:	74 17                	je     a00 <printint+0x2c>
 9e9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 9ed:	79 11                	jns    a00 <printint+0x2c>
    neg = 1;
 9ef:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 9f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 9f9:	f7 d8                	neg    %eax
 9fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 9fe:	eb 06                	jmp    a06 <printint+0x32>
  } else {
    x = xx;
 a00:	8b 45 0c             	mov    0xc(%ebp),%eax
 a03:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 a06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 a0d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 a10:	8d 41 01             	lea    0x1(%ecx),%eax
 a13:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a16:	8b 5d 10             	mov    0x10(%ebp),%ebx
 a19:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a1c:	ba 00 00 00 00       	mov    $0x0,%edx
 a21:	f7 f3                	div    %ebx
 a23:	89 d0                	mov    %edx,%eax
 a25:	8a 80 ac 12 00 00    	mov    0x12ac(%eax),%al
 a2b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 a2f:	8b 75 10             	mov    0x10(%ebp),%esi
 a32:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a35:	ba 00 00 00 00       	mov    $0x0,%edx
 a3a:	f7 f6                	div    %esi
 a3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 a3f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a43:	75 c8                	jne    a0d <printint+0x39>
  if(neg)
 a45:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a49:	74 10                	je     a5b <printint+0x87>
    buf[i++] = '-';
 a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4e:	8d 50 01             	lea    0x1(%eax),%edx
 a51:	89 55 f4             	mov    %edx,-0xc(%ebp)
 a54:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 a59:	eb 1e                	jmp    a79 <printint+0xa5>
 a5b:	eb 1c                	jmp    a79 <printint+0xa5>
    putc(fd, buf[i]);
 a5d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a63:	01 d0                	add    %edx,%eax
 a65:	8a 00                	mov    (%eax),%al
 a67:	0f be c0             	movsbl %al,%eax
 a6a:	89 44 24 04          	mov    %eax,0x4(%esp)
 a6e:	8b 45 08             	mov    0x8(%ebp),%eax
 a71:	89 04 24             	mov    %eax,(%esp)
 a74:	e8 33 ff ff ff       	call   9ac <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 a79:	ff 4d f4             	decl   -0xc(%ebp)
 a7c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a80:	79 db                	jns    a5d <printint+0x89>
    putc(fd, buf[i]);
}
 a82:	83 c4 30             	add    $0x30,%esp
 a85:	5b                   	pop    %ebx
 a86:	5e                   	pop    %esi
 a87:	5d                   	pop    %ebp
 a88:	c3                   	ret    

00000a89 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 a89:	55                   	push   %ebp
 a8a:	89 e5                	mov    %esp,%ebp
 a8c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 a8f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 a96:	8d 45 0c             	lea    0xc(%ebp),%eax
 a99:	83 c0 04             	add    $0x4,%eax
 a9c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 a9f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 aa6:	e9 77 01 00 00       	jmp    c22 <printf+0x199>
    c = fmt[i] & 0xff;
 aab:	8b 55 0c             	mov    0xc(%ebp),%edx
 aae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ab1:	01 d0                	add    %edx,%eax
 ab3:	8a 00                	mov    (%eax),%al
 ab5:	0f be c0             	movsbl %al,%eax
 ab8:	25 ff 00 00 00       	and    $0xff,%eax
 abd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 ac0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ac4:	75 2c                	jne    af2 <printf+0x69>
      if(c == '%'){
 ac6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 aca:	75 0c                	jne    ad8 <printf+0x4f>
        state = '%';
 acc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 ad3:	e9 47 01 00 00       	jmp    c1f <printf+0x196>
      } else {
        putc(fd, c);
 ad8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 adb:	0f be c0             	movsbl %al,%eax
 ade:	89 44 24 04          	mov    %eax,0x4(%esp)
 ae2:	8b 45 08             	mov    0x8(%ebp),%eax
 ae5:	89 04 24             	mov    %eax,(%esp)
 ae8:	e8 bf fe ff ff       	call   9ac <putc>
 aed:	e9 2d 01 00 00       	jmp    c1f <printf+0x196>
      }
    } else if(state == '%'){
 af2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 af6:	0f 85 23 01 00 00    	jne    c1f <printf+0x196>
      if(c == 'd'){
 afc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 b00:	75 2d                	jne    b2f <printf+0xa6>
        printint(fd, *ap, 10, 1);
 b02:	8b 45 e8             	mov    -0x18(%ebp),%eax
 b05:	8b 00                	mov    (%eax),%eax
 b07:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 b0e:	00 
 b0f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 b16:	00 
 b17:	89 44 24 04          	mov    %eax,0x4(%esp)
 b1b:	8b 45 08             	mov    0x8(%ebp),%eax
 b1e:	89 04 24             	mov    %eax,(%esp)
 b21:	e8 ae fe ff ff       	call   9d4 <printint>
        ap++;
 b26:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 b2a:	e9 e9 00 00 00       	jmp    c18 <printf+0x18f>
      } else if(c == 'x' || c == 'p'){
 b2f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 b33:	74 06                	je     b3b <printf+0xb2>
 b35:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 b39:	75 2d                	jne    b68 <printf+0xdf>
        printint(fd, *ap, 16, 0);
 b3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 b3e:	8b 00                	mov    (%eax),%eax
 b40:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 b47:	00 
 b48:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 b4f:	00 
 b50:	89 44 24 04          	mov    %eax,0x4(%esp)
 b54:	8b 45 08             	mov    0x8(%ebp),%eax
 b57:	89 04 24             	mov    %eax,(%esp)
 b5a:	e8 75 fe ff ff       	call   9d4 <printint>
        ap++;
 b5f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 b63:	e9 b0 00 00 00       	jmp    c18 <printf+0x18f>
      } else if(c == 's'){
 b68:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 b6c:	75 42                	jne    bb0 <printf+0x127>
        s = (char*)*ap;
 b6e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 b71:	8b 00                	mov    (%eax),%eax
 b73:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 b76:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 b7a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b7e:	75 09                	jne    b89 <printf+0x100>
          s = "(null)";
 b80:	c7 45 f4 c9 0e 00 00 	movl   $0xec9,-0xc(%ebp)
        while(*s != 0){
 b87:	eb 1c                	jmp    ba5 <printf+0x11c>
 b89:	eb 1a                	jmp    ba5 <printf+0x11c>
          putc(fd, *s);
 b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b8e:	8a 00                	mov    (%eax),%al
 b90:	0f be c0             	movsbl %al,%eax
 b93:	89 44 24 04          	mov    %eax,0x4(%esp)
 b97:	8b 45 08             	mov    0x8(%ebp),%eax
 b9a:	89 04 24             	mov    %eax,(%esp)
 b9d:	e8 0a fe ff ff       	call   9ac <putc>
          s++;
 ba2:	ff 45 f4             	incl   -0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 ba5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba8:	8a 00                	mov    (%eax),%al
 baa:	84 c0                	test   %al,%al
 bac:	75 dd                	jne    b8b <printf+0x102>
 bae:	eb 68                	jmp    c18 <printf+0x18f>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 bb0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 bb4:	75 1d                	jne    bd3 <printf+0x14a>
        putc(fd, *ap);
 bb6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 bb9:	8b 00                	mov    (%eax),%eax
 bbb:	0f be c0             	movsbl %al,%eax
 bbe:	89 44 24 04          	mov    %eax,0x4(%esp)
 bc2:	8b 45 08             	mov    0x8(%ebp),%eax
 bc5:	89 04 24             	mov    %eax,(%esp)
 bc8:	e8 df fd ff ff       	call   9ac <putc>
        ap++;
 bcd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 bd1:	eb 45                	jmp    c18 <printf+0x18f>
      } else if(c == '%'){
 bd3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 bd7:	75 17                	jne    bf0 <printf+0x167>
        putc(fd, c);
 bd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 bdc:	0f be c0             	movsbl %al,%eax
 bdf:	89 44 24 04          	mov    %eax,0x4(%esp)
 be3:	8b 45 08             	mov    0x8(%ebp),%eax
 be6:	89 04 24             	mov    %eax,(%esp)
 be9:	e8 be fd ff ff       	call   9ac <putc>
 bee:	eb 28                	jmp    c18 <printf+0x18f>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 bf0:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 bf7:	00 
 bf8:	8b 45 08             	mov    0x8(%ebp),%eax
 bfb:	89 04 24             	mov    %eax,(%esp)
 bfe:	e8 a9 fd ff ff       	call   9ac <putc>
        putc(fd, c);
 c03:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c06:	0f be c0             	movsbl %al,%eax
 c09:	89 44 24 04          	mov    %eax,0x4(%esp)
 c0d:	8b 45 08             	mov    0x8(%ebp),%eax
 c10:	89 04 24             	mov    %eax,(%esp)
 c13:	e8 94 fd ff ff       	call   9ac <putc>
      }
      state = 0;
 c18:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 c1f:	ff 45 f0             	incl   -0x10(%ebp)
 c22:	8b 55 0c             	mov    0xc(%ebp),%edx
 c25:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c28:	01 d0                	add    %edx,%eax
 c2a:	8a 00                	mov    (%eax),%al
 c2c:	84 c0                	test   %al,%al
 c2e:	0f 85 77 fe ff ff    	jne    aab <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 c34:	c9                   	leave  
 c35:	c3                   	ret    
 c36:	90                   	nop
 c37:	90                   	nop

00000c38 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 c38:	55                   	push   %ebp
 c39:	89 e5                	mov    %esp,%ebp
 c3b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 c3e:	8b 45 08             	mov    0x8(%ebp),%eax
 c41:	83 e8 08             	sub    $0x8,%eax
 c44:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c47:	a1 d0 12 00 00       	mov    0x12d0,%eax
 c4c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 c4f:	eb 24                	jmp    c75 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c51:	8b 45 fc             	mov    -0x4(%ebp),%eax
 c54:	8b 00                	mov    (%eax),%eax
 c56:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 c59:	77 12                	ja     c6d <free+0x35>
 c5b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 c5e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 c61:	77 24                	ja     c87 <free+0x4f>
 c63:	8b 45 fc             	mov    -0x4(%ebp),%eax
 c66:	8b 00                	mov    (%eax),%eax
 c68:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 c6b:	77 1a                	ja     c87 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 c70:	8b 00                	mov    (%eax),%eax
 c72:	89 45 fc             	mov    %eax,-0x4(%ebp)
 c75:	8b 45 f8             	mov    -0x8(%ebp),%eax
 c78:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 c7b:	76 d4                	jbe    c51 <free+0x19>
 c7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 c80:	8b 00                	mov    (%eax),%eax
 c82:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 c85:	76 ca                	jbe    c51 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 c87:	8b 45 f8             	mov    -0x8(%ebp),%eax
 c8a:	8b 40 04             	mov    0x4(%eax),%eax
 c8d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 c94:	8b 45 f8             	mov    -0x8(%ebp),%eax
 c97:	01 c2                	add    %eax,%edx
 c99:	8b 45 fc             	mov    -0x4(%ebp),%eax
 c9c:	8b 00                	mov    (%eax),%eax
 c9e:	39 c2                	cmp    %eax,%edx
 ca0:	75 24                	jne    cc6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 ca2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ca5:	8b 50 04             	mov    0x4(%eax),%edx
 ca8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cab:	8b 00                	mov    (%eax),%eax
 cad:	8b 40 04             	mov    0x4(%eax),%eax
 cb0:	01 c2                	add    %eax,%edx
 cb2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cb5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 cb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cbb:	8b 00                	mov    (%eax),%eax
 cbd:	8b 10                	mov    (%eax),%edx
 cbf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cc2:	89 10                	mov    %edx,(%eax)
 cc4:	eb 0a                	jmp    cd0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 cc6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cc9:	8b 10                	mov    (%eax),%edx
 ccb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cce:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 cd0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cd3:	8b 40 04             	mov    0x4(%eax),%eax
 cd6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 cdd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ce0:	01 d0                	add    %edx,%eax
 ce2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ce5:	75 20                	jne    d07 <free+0xcf>
    p->s.size += bp->s.size;
 ce7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cea:	8b 50 04             	mov    0x4(%eax),%edx
 ced:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cf0:	8b 40 04             	mov    0x4(%eax),%eax
 cf3:	01 c2                	add    %eax,%edx
 cf5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 cf8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 cfb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 cfe:	8b 10                	mov    (%eax),%edx
 d00:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d03:	89 10                	mov    %edx,(%eax)
 d05:	eb 08                	jmp    d0f <free+0xd7>
  } else
    p->s.ptr = bp;
 d07:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d0a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 d0d:	89 10                	mov    %edx,(%eax)
  freep = p;
 d0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 d12:	a3 d0 12 00 00       	mov    %eax,0x12d0
}
 d17:	c9                   	leave  
 d18:	c3                   	ret    

00000d19 <morecore>:

static Header*
morecore(uint nu)
{
 d19:	55                   	push   %ebp
 d1a:	89 e5                	mov    %esp,%ebp
 d1c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 d1f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 d26:	77 07                	ja     d2f <morecore+0x16>
    nu = 4096;
 d28:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 d2f:	8b 45 08             	mov    0x8(%ebp),%eax
 d32:	c1 e0 03             	shl    $0x3,%eax
 d35:	89 04 24             	mov    %eax,(%esp)
 d38:	e8 f7 fb ff ff       	call   934 <sbrk>
 d3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 d40:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 d44:	75 07                	jne    d4d <morecore+0x34>
    return 0;
 d46:	b8 00 00 00 00       	mov    $0x0,%eax
 d4b:	eb 22                	jmp    d6f <morecore+0x56>
  hp = (Header*)p;
 d4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d50:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 d53:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d56:	8b 55 08             	mov    0x8(%ebp),%edx
 d59:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 d5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d5f:	83 c0 08             	add    $0x8,%eax
 d62:	89 04 24             	mov    %eax,(%esp)
 d65:	e8 ce fe ff ff       	call   c38 <free>
  return freep;
 d6a:	a1 d0 12 00 00       	mov    0x12d0,%eax
}
 d6f:	c9                   	leave  
 d70:	c3                   	ret    

00000d71 <malloc>:

void*
malloc(uint nbytes)
{
 d71:	55                   	push   %ebp
 d72:	89 e5                	mov    %esp,%ebp
 d74:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d77:	8b 45 08             	mov    0x8(%ebp),%eax
 d7a:	83 c0 07             	add    $0x7,%eax
 d7d:	c1 e8 03             	shr    $0x3,%eax
 d80:	40                   	inc    %eax
 d81:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 d84:	a1 d0 12 00 00       	mov    0x12d0,%eax
 d89:	89 45 f0             	mov    %eax,-0x10(%ebp)
 d8c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 d90:	75 23                	jne    db5 <malloc+0x44>
    base.s.ptr = freep = prevp = &base;
 d92:	c7 45 f0 c8 12 00 00 	movl   $0x12c8,-0x10(%ebp)
 d99:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d9c:	a3 d0 12 00 00       	mov    %eax,0x12d0
 da1:	a1 d0 12 00 00       	mov    0x12d0,%eax
 da6:	a3 c8 12 00 00       	mov    %eax,0x12c8
    base.s.size = 0;
 dab:	c7 05 cc 12 00 00 00 	movl   $0x0,0x12cc
 db2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 db5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 db8:	8b 00                	mov    (%eax),%eax
 dba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 dbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dc0:	8b 40 04             	mov    0x4(%eax),%eax
 dc3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 dc6:	72 4d                	jb     e15 <malloc+0xa4>
      if(p->s.size == nunits)
 dc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dcb:	8b 40 04             	mov    0x4(%eax),%eax
 dce:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 dd1:	75 0c                	jne    ddf <malloc+0x6e>
        prevp->s.ptr = p->s.ptr;
 dd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dd6:	8b 10                	mov    (%eax),%edx
 dd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ddb:	89 10                	mov    %edx,(%eax)
 ddd:	eb 26                	jmp    e05 <malloc+0x94>
      else {
        p->s.size -= nunits;
 ddf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 de2:	8b 40 04             	mov    0x4(%eax),%eax
 de5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 de8:	89 c2                	mov    %eax,%edx
 dea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ded:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 df0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 df3:	8b 40 04             	mov    0x4(%eax),%eax
 df6:	c1 e0 03             	shl    $0x3,%eax
 df9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dff:	8b 55 ec             	mov    -0x14(%ebp),%edx
 e02:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 e05:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e08:	a3 d0 12 00 00       	mov    %eax,0x12d0
      return (void*)(p + 1);
 e0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e10:	83 c0 08             	add    $0x8,%eax
 e13:	eb 38                	jmp    e4d <malloc+0xdc>
    }
    if(p == freep)
 e15:	a1 d0 12 00 00       	mov    0x12d0,%eax
 e1a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 e1d:	75 1b                	jne    e3a <malloc+0xc9>
      if((p = morecore(nunits)) == 0)
 e1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 e22:	89 04 24             	mov    %eax,(%esp)
 e25:	e8 ef fe ff ff       	call   d19 <morecore>
 e2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 e2d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 e31:	75 07                	jne    e3a <malloc+0xc9>
        return 0;
 e33:	b8 00 00 00 00       	mov    $0x0,%eax
 e38:	eb 13                	jmp    e4d <malloc+0xdc>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 e3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 e40:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e43:	8b 00                	mov    (%eax),%eax
 e45:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 e48:	e9 70 ff ff ff       	jmp    dbd <malloc+0x4c>
}
 e4d:	c9                   	leave  
 e4e:	c3                   	ret    