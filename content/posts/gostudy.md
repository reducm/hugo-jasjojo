+++
author = "JAS"
title = "整理的Go语言笔记"
date = "2022-06-25"
description = "go文档整理与持续更新"
tags = [
    "go"
]
+++


# 整理的GO文档

## 下载安装等

[ 下载地址 ] ( <http://code.google.com/p/go/downloads/list> )

安装后
$ go version //如果提 示找不到go命令,可以通过手动添加/usr/local/go/bin到PATH环境变量来解决

卸载go
rm -rf /usr/local/go
rm -rf /etc/paths.d/go

### GVM

现在装go可以用 [gvm](https://github.com/moovweb/gvm)

国内访问不了 `https://go.googlesource.com/go` 可将 GO_SOURCE_URL修改为github上的源码镜像

修改方法：
vim ~/.gvm/scripts/install
修改
GO_SOURCE_URL=<https://github.com/golang/go>

或者
gvm install go1.13.8 --source=<https://github.com/golang/go.git>

安装1.5+的时候，要用这种方式，加 -B 去直接用binary，不用compile

```bash
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.5
```

指针的主要作用就是在函数内部改变传递进来变量的值!!!!

### mac requirements

Install Mercurial from <https://www.mercurial-scm.org/downloads>
Install Xcode Command Line Tools from the App Store.

```bash
xcode-select --install
brew update
brew install mercurial
```

### 另一个go版本管理，g

[链接]( https://github.com/stefanmaric/g )

安装
`curl -sSL https://git.io/g-install | sh -s -- bash zsh`

安装完后默认的path

* GOROOT: $HOME/.go
* GOPATH: $HOME/go

`$GOPATH/bin` is added to the PATH and there's where g is copied to.

### arm m1 mac

直接到[官网](https://go.dev/dl/)下载 pkg，记得是下载arm64

下载后重启 terminal, `go version`

然后查看一下env `go env GOPATH`, 把`$GOPATH/bin` 设置到系统path

设置 go module `go env -w GO111MODULE=on`

### go安装包翻墙问题

使用 <https://github.com/gomods/athens>

```bash
docker run -p '4000:3000' gomods/athens:latest

export GOPROXY=http://localhost:4000 && go get module@v1

```

### 1.13以上的proxy设置

[thanks-mirror](https://github.com/eryajf/Thanks-Mirror#go)

```bash
export GOPROXY="http://nexus.eryajf.net/repository/go/"
GONOPROXY="gitlab.eryajf.net"
GONOSUMDB="gitlab.eryajf.net"
GOPRIVATE="gitlab.eryajf.net"
GOSUMDB="sum.golang.google.cn"
```

### 常用库等

一般搭建vscode或者goland开发环境时，都会自动安装

安装lint代码检查器

安装golint： shell $ go get github.com/golang/lint $ go install github.com/golang/lint

安装gooracle shell $ go get code.google.com/p/go.tools/cmd/oracle

安装goimport shell $ go get golang.org/x/tools/cmd/goimports

安装gocode shell $ go get -u github.com/nsf/gocode

安装 godef shell $ go get -v code.google.com/p/rog-go/exp/cmd/godef go install -v code.google.com/p/rog-go/exp/cmd/godef

gocode 提供代码补全

godef 代码跳转

gofmt 自动代码整理

golint 代码语法检查

goimports 自动整理imports


* go get -u -v github.com/nsf/gocode
* go get -u -v github.com/rogpeppe/godef
* go get -u -v github.com/golang/lint/golint
* go get -u -v github.com/lukehoban/go-outline
* go get -u -v sourcegraph.com/sqs/goreturns
* go get -u -v golang.org/x/tools/cmd/gorename
* go get -u -v github.com/tpng/gopkgs
* go get -u -v github.com/newhook/go-symbols
* go get -u -v golang.org/x/tools/cmd/guru
 
[tunny](https://github.com/Jeffail/tunny) 可设置固定数量协程的 goroutine pool 库。通过这个项目可实现 goroutine 重复使用，从而避免过度创建 goroutine 而造成的内存占用过多等问题

[glab](https://github.com/profclems/glab) gitlab terminal版

[fzf](https://github.com/junegunn/fzf) fuzzyfind go版搜索一切

[godis](https://github.com/HDT3213/godis) go实现的redis

[duf](https://github.com/muesli/duf) 取代linux`du`

[bubbletea](https://github.com/charmbracelet/bubbletea) 做漂亮交互命令行的库

[rosedb](https://github.com/flower-corp/rosedb/blob/main/README-CN.md) kv数据库，可内嵌到go程序, 还有开发kv数据库的教程

[cointop](https://github.com/cointop-sh/cointop) 看加密货币行情

[jql](https://github.com/cube2222/jql) json工具，实现命令行下查询，格式化

[chanify](https://github.com/chanify/chanify) iOs推送

[imaging](https://github.com/disintegration/imaging) go的图像处理

[ebiten](https://github.com/hajimehoshi/ebiten) go2d 游戏引擎

[pretty](https://github.com/kr/pretty) pretty print go版

[act](https://github.com/nektos/act) 本地调试github actions

[bild](https://github.com/anthonynsimon/bild) 类似imagick的纯go 图像处理

[pyroscope](https://github.com/pyroscope-io/pyroscope) 性能分析工具

[macdriver](https://github.com/progrium/macdriver) 封装mac系统的go工具，80行写个任务栏

[pb](https://github.com/cheggaaa/pb) progress bar命令行

[vegeta](https://github.com/tsenart/vegeta) 贝吉塔http压测工具

[delve](https://github.com/go-delve/delve) go调试工具

[rqlite](https://github.com/rqlite/rqlite) go版本的sqlite

[golearn](https://github.com/sjwhitworth/golearn) 机器学习框架

[syncthing](https://github.com/syncthing/syncthing) 开源的文件同步工具

[now](https://github.com/jinzhu/now) go时间库

[cli](https://github.com/urfave/cli) 创建cli工具, 另一个是croba

[corbra](https://github.com/spf13/cobra)  类似 python的 argparse，用于方便编写命令行工具，docker 等都用到

[jsonitor](https://github.com/json-iterator/go) 比官方json更好

[quicktemplate](https://github.com/valyala/quicktemplatei) 快速模版引擎，除了html其他都可以用,go原生

[zap](https://github.com/uber-go/zap) uber出的go日志库

[lumberjack](https://github.com/natefinch/lumberjack) 日志切割

[mgm](https://github.com/Kamva/mgm) mongo odm快速开发

[mapstruct](https://github.com) 把map[string]interface{} 转成struct，方便json

[validator](https://github.com/go-playground/validator) 用go的tag去验证struct

[do](https://github.com/samber/do) do依赖注入

[mo](https://github.com/samber/mo) monad，函数链

[lo](https://github.com/samber/lo) 类似lodash支持1.18范性

### Go Module

go1.11开始使用go module，原生内置解决了版本依赖的问题，详情计在evernote
注意到 go mod后，本地引用的包不再使用 ./ 相对路径，要使用go.mod定义的 module/app/controllers/api/v1的方式

----

## 语言


### hello world

```go
//hello.go
package main
import "fmt"
func main(){
  fmt.Println("hello world")
}
```

```bash
go run hello.go
go build hello.go && ./hello
```

//go项目编译，非常简单，无需makefile
<project dir>
  <src>
    ....your sourcefile and unit test
  <bin>
  <pkg>
设好系统$GOPATH然后在bin目录下执行go build project就可以编译好整个项目了!(单元测试可以用go test命令)

```go
//Println Printf的例子
fval := 110.48
ival := 200
sval := "This is a string. "
fmt.Println("The value of fval is", fval)
fmt.Printf("fval=%f, ival=%d, sval=%s\n", fval, ival, sval)
fmt.Printf("fval=%v, ival=%v, sval=%v\n", fval, ival, sval)
```

//gdb调试
gdb project

go约定了大写开头的变量是public, 小写开头的是private


### 变量

声明

```go

var v1 int
var v2 string
var v3 [10]int //数组
var v4 []int //数组切片
var v5 struct {
  f int
}
var v6 *int //指针
var v7 map[string]int // map, key为string, value 为int
var v8 func(a int)int

var( //多个变量同时声明
  v1 int
  v2 string
)
// 变量初始化
var v1 int = 10
var v2 = 10
v3 := 10

```

三种方式完全一样，v3写法编译器会自动推导类型，减少输入量，推荐
要注意方式三不能使用在已经声明过的变量上，会引起错误

支持多重赋值

i, j = j, i

匿名变量，可以利用go函数多个返回值去方便赋值

```go
func GetName()(firstname, secoend_name, lastname){
  return "jas", "kevin", "leap"
}
jas, _, _ := GetName() //不需要的时候可以用下划线取代
```

### 常量

-12
3.14159
3.2+2i //复数类型
true
"xxx"
c语言之流赋值给long要12l之类的，现在在go语言12这种常量可以直接复制给所有数值类型
给常量做声明

```go
const Pi float64 = 3.1415926
const {
  size int64 = 1024
  eof = -1
}
```

### iota常量

iota编译时候会重置为0，每次出现自动加1
const {
  fuck1 = iota //0
  fuck2 = iota //2
  fuck3 = iota //3
}

### enum枚举

```go

const {
  Monday = iota
  Tusday
  Thursday
  numberOfDays //这个是小写开头， 包外不能访问
}

```

### 基础类型

布尔 bool
整形 int64 int32 int8 byte等
浮点 float64 float32
复数 complex128 complex64
字符类型 rune
字符串类型 string
错误类型 error
复合类型
指针 Pointer
数组 array
切片 slice
字典 map
通道 chan
结构 struct
接口 interface

类型强制转换，int转int32, 要注意精度丢失
v1 := 32
v2 = int32(v1)

整形有一般的`+-*/%`运算

### 字符串

```go
str := "hello world"
len(str) //可以获取字符串的长度, 还可以获取数组，切片的长度
str[0] //字符串第一个字符
str + "fuck" //普通字符串+操作
```

两种方式遍历字符串

```go
// 1)
str := "hello world" // 遍历字符串数组
  l = len(str)
  for i:=0, i < len; i++ {
    ch = str[i]
    fmt.Println(i, ch)
  }

// 2)
str := "hello world" // 遍历字符串数组
for i, ch := range str{
  fmt.Println(i, ch)
}

//这里遍历出来的ch会是数字,是string的start byte, For a string value, the "range" clause iterates over the Unicode code points in the string starting at byte index 0. On successive iterations, the index value will be the index of the first byte of successive UTF-8-encoded code points in the string, and the second value, of type rune, will be the value of the corresponding code point. If the iteration encounters an invalid UTF-8 sequence, the second value will be 0xFFFD, the Unicode replacement character, and the next iteration will advance a single byte in the string.

//用string函数转换一下就可以
c := string(ch)
```

### 数组

和其他语言一样, -1下标为数组最后一个元素
[32]byte
[3][5]int
[1000]*int //指针数组
数组长度定义后不可更改
除了len()可以获取数组长度外，go还提供一个range关键字方便遍历数组，返回的结构(下标，值)

```go
for i, v := range some_array {
  fmt.Println(i, v)
}
```

go数组有一个值类型（value type）, 在函数内不能对原数组进行修改，只是修改数组的一个clone, 要修改的话要用slice

### 数组切片slice

初看起来,数组切片就像一个指向数组的指针,实际上它拥有自己的数据结构,而不仅仅是 个指针。数组切片的数据结构可以抽象为以下3个变量:
一个指向原生数组的指针;
数组切片中的元素个数;
数组切片已分配的存储空间。
从底层实现的角度来看,数组切片实际上仍然使用数组来管理元素,因此它们之间的关系让 C++程序员们很容易联想起STL中std::vector和数组的关系。基于数组,数组切片添加了一系 列管理功能,可以随时动态扩充存放空间,并且可以被随意传递而不会导致所管理的元素被重复 复制。

slice有两种创建方式

``` go
// 1）基于数组
array := [5]int{1,2,3,4,5}
slice := array[:3] //所以这里会生成头三个,Go语言支持用myArray[first:last]这样的方式来基于数组生成一 个数组切片 还可以 array[:]全部， array[2:], 数组2个之后的

// 2)直接创建, 用自带的make()方法创建
// 创建一个初始元素个数为5的数组切片,元素初始值为0:
mySlice1 := make([]int, 5)
// 创建一个初始元素个数为5的数组切片,元素初始值为0,并预留10个元素的存储空间:
mySlice2 := make([]int, 5, 10)
// 直接创建并初始化包含5个元素的数组切片:
mySlice3 := []int{1, 2, 3, 4, 5}

```

当然,事实上还会有一个匿名数组被创建出来,只是不需要我们来操心而已。
遍历和数组一样，可以用长度或者range

两个有用方法`cap()`是返回分配了占用了的内存空间(最长用多少个)，`len()`是返回已有元素个数(长度)

为slice增加元素

```go
mySlice = append(mySlice, 1, 2, 3)
```

还可以把另一个slice直接放在slice的结尾

``` go
mySlice = append(mySlice, mySlice2...) //后面跟三个点省略号意思是把mySlice2的东西打散放进来
```

复制slice, 会基于更小的slice部分互相复制

```go
slice1 := []int{1,2,3,4,5}
slice2 := []int{1,2}
copy(slice1, slice2) //把slice1的前两个复制给slice2
copy(slice2, slice1) //把slice2的前两个复制给slice1
```

切割!!!
Go语言支持用myArray[first:last]这样的方式来基于数组生成一 个数组切片,而且这个用法还很灵活,比如下面几种都是合法的。

```go
// 基于myArray的所有元素创建数组切片:
mySlice = myArray[:]
// 基于myArray的前5个元素创建数组切片:
mySlice = myArray[:5]
// 基于从第5个元素开始的所有元素创建数组切片:
mySlice = myArray[5:]
```

下标表示!!
numbers := []int{0,1,2,3,4,5}
numbers[1:4] 表示由小标1到3（不包含4） //=> [ 1, 2, 3 ]


所以例如要达到数组pop的效果, pop !!

```go
pop := mySlice[len(mySlice) -1 ]
mySlice = mySlice[:len(mySlice)-1]
```

!!!!!!!some tricks, 数组常用

```go

// AppendVector
a = append(a, b...)

// Copy
b = make([]T, len(a))
copy(b, a)
// or
b = append([]T(nil), a...)

// Cut
a = append(a[:i], a[j:]...)

// Delete
a = append(a[:i], a[i+1:]...)
// or
a = a[:i+copy(a[i:], a[i+1:])]

// Delete without preserving order
a[i] = a[len(a)-1] 
a = a[:len(a)-1]
// NOTE If the type of the element is a pointer or a struct with pointer fields, which need to be garbage collected, the above implementations of Cut and Delete have a potential memory leak problem: some elements with values are still referenced by slice a and thus can not be collected. The following code can fix this problem:

// Cut
copy(a[i:], a[j:])
for k, n := len(a)-j+i, len(a); k < n; k++ {
    a[k] = nil // or the zero value of T
}
a = a[:len(a)-j+i]

// Delete
copy(a[i:], a[i+1:])
a[len(a)-1] = nil // or the zero value of T
a = a[:len(a)-1]
// or, more simply:
a, a[len(a)-1] = append(a[:i], a[i+1:]...), nil

// Delete without preserving order
a[i] = a[len(a)-1]
a[len(a)-1] = nil
a = a[:len(a)-1]

// Expand
a = append(a[:i], append(make([]T, j), a[i:]...)...)

// Extend
a = append(a, make([]T, j)...)

// Insert
a = append(a[:i], append([]T{x}, a[i:]...)...)
// NOTE The second append creates a new slice with its own underlying storage and copies elements in a[i:] to that slice, and these elements are then copied back to slice a (by the first append). The creation of the new slice (and thus memory garbage) and the second copy can be avoided by using an alternative way:

// Insert
s = append(s, 0)
copy (s[i+1:], s[i:])
s[i] = x

// InsertVector
a = append(a[:i], append(b, a[i:]...)...)

// Pop
x, a = a[len(a)-1], a[:len(a)-1]

// Push
a = append(a, x)

// Shift
x, a := a[0], a[1:]

// Unshift
a = append([]T{x}, a...)
```


### Map go的map是如此的强大


```go

// PersonInfo是一个包含个人详细信息的类型 
type PersonInfo struct {
  ID string
  Name string
  Address string
}
func main() {
  var personDB map[string] PersonInfo
  personDB = make(map[string] PersonInfo)
  // 往这个map里插入几条数据
  personDB["12345"] = PersonInfo{"12345", "Tom", "Room 203,..."}
  personDB["1"] = PersonInfo{"1", "Jack", "Room 101,..."}
  // 从这个map查找键为"1234"的信息  !!! 这个可以判断是否存在该键, 判断hasKey
  person, ok := personDB["1234"]
  // ok是一个返回的bool型,返回true表示找到了对应的数据 if ok {
  if ok {
    fmt.Println("Found person", person.Name, "with ID 1234.")
  } else {
    fmt.Println("Did not find person with ID 1234.")
  }
}


// 参照上面的struct，还可以这样创建
myMap = map[String] PersonInfo{
  "1234": PersonInfo{"1", "jas", "guangzhou"}
}

```

删除键值

```go
delete(myMap, "1234")
```

取值时有个ok是非常好的一个判断值内容是否有问题的好方法，过去我们经常要判断nil?, 现在可以直接用ok了, hasKey

```go
value, ok = map["1234"]
if ok{
 //blah 
}else {
  //blah
}
```

### 流程控制

条件语句,对应的关键字为`if`、`else`和`else if`;
选择语句,对应的关键字为`switch`、`case`和`select`(将在介绍channel的时候细说);
循环语句,对应的关键字为`for`和`range`;
跳转语句,对应的关键字为`goto`。
在具体的应用场景中,为了满足更丰富的控制需求,Go语言还添加了如下关键字: `break`、 `continue`和`fallthrough`。在实际的使用中,需要根据具体的逻辑目标、程序执行的时间和空 间限制、代码的可读性、编译器的代码优化设定等多种因素,灵活组合。

#### if else

条件语句不需要使用括号将条件包含起来();
无论语句体内有几条语句,花括号{}都是必须存在的;
左花括号{必须与if或者else处于同一行;
在if之后,条件语句之前,可以添加变量初始化语句,使用;间隔;
在有返回值的函数中,不允许将“最终的”return语句包含在if...else...结构中, 否则会编译失败

#### switch case

左花括号{必须与switch处于同一行;
条件表达式不限制为常量或者整数;
单个case中,可以出现多个结果选项;
与C语言等规则相反,Go语言不需要用break来明确退出一个case;
只有在case中明确添加fallthrough关键字,才会继续执行紧跟的下一个case; 可以不设定switch之后的条件表达式,在此种情况下,整个switch结构与多个 if...else...的逻辑作用等同。

#### for 循环

go没有什么while, do-while的东西,若要死循环，直接用for{}就行
左花括号{必须与for处于同一行。
Go语言中的for循环与C语言一样,都允许在循环条件中定义和初始化变量,唯一的区别
是,Go语言不支持以逗号为间隔的多个赋值语句,必须使用平行赋值的方式来初始化多
个变量。
Go语言的for循环同样支持continue和break来控制循环,但是它提供了一个更高级的break,可以选择中断哪一个循环,如下例:

```go
for j := 0; j < 5; j++ {
  for i := 0; i < 10; i++ {
    if i > 5 {
      break JLoop
    }
  fmt.Println(i)
  }
}

// JLoop: // ...
// 本例中,break语句终止的是JLoop标签处的外层循环。

goto
func myfunc() {
  i := 0
  HERE:
  fmt.Println(i)
  i++
  if i < 10 {
    ￼￼goto HERE //跳到HERE标签位置
  }
}
```

### 函数

函数的结构 `func`, 函数名, 参数， 返回值, 函数体， 返回语句

```go
package mymath
import "errors"
func Add(a int, b int) (ret int, err error) {
  if a < 0 || b < 0 { // 假设这个函数只支持两个非负数字的加法
    err= errors.New("Should be non-negative numbers!")
    return 0, err
  }
  return a + b, nil // 支持多重返回值 
}
```

调用非常简单

```go
import mymath
  value, err := mymath.Add(1, 2)
```

不定量参数

```go
unc myfunc(args ...int) {
  for _, arg := range args {
    fmt.Println(arg)
  }
}

//这段代码的意思是,函数myfunc()接受不定数量的参数,这些参数的类型全部是int,所以它可以用如下方式调用:
myfunc(2, 3, 4)
myfunc(1, 3, 7, 13)
//这种方式不定参数只能写在最后的一个参数上

```


不定量参数的传递

```go
// 假设有另一个变参函数叫做myfunc3(args ...int),下面的例子演示了如何向其传递变参:
func myfunc(args ...int) { // 按原样传递
  myfunc3(args...)
  // 传递片段,实际上任意的int slice都可以传进去
  myfunc3(args[1:]...)
}
```


任意类型的不定参数，用args...interface{}, 例子说话

```go
package main
import "fmt"
func MyPrintf(args ...interface{}) {
  for _, arg := range args {
    switch arg.(type) {
      case int: ￼
 //blah
      case int64:
       //blah
      case string:
       //blah
      case float32:
       //blah
    }
  }
}
func main() {
  var v1 int = 1
  var v2 int64 = 234
  var v3 string = "hello"
  var v4 float32 = 1.234
  MyPrintf(v1,v2,v3,v4)
}
```

匿名函数和闭包!!

```go
func(a, b int) bool{
  //blahblah
}(1,2) //可直接执行或者赋值给一个变量
```

### 错误处理，实例代码

```go
type PathError struct {
  Op string
  Path string
  Err error
}
func (e *PathError) Error() string {
  return e.Op + " " + e.Path + ": " + e.Err.Error()
}

// defer保证函数完成后程序某个语句必须执行
func CopyFile(dst, src string) (w int64, err error) {
  srcFile, err := os.Open(src)
if err != nil {
  return
}
defer srcFile.Close()
dstFile, err := os.Create(dstName) 
if err != nil {
  return
}
defer dstFile.Close()
return io.Copy(dstFile, srcFile) 
}

// ￼即使其中的Copy()函数抛出异常,Go仍然会保证dstFile和srcFile会被正常关闭。 如果觉得一句话干不完清理的工作,也可以使用在defer后加一个匿名函数的做法:
defer func() {
  // 做你复杂的清理工作
} ()

panic()和recover()
panic(interface{}) 相当于raise
recover() 相当于catch，但由于有defer存在，可以写在任意地方并且一定接到
//害怕函数foo会有panic的时候
defer func() {
  if r := recover(); r != nil {
    log.Printf("Runtime error caught: %v", r)
  }
}()
foo()
```

### 面向对象

Go语言和C语言一样,类型都是基于值传递的。要想修改变量的值,只能 传递指针。

```go
func (a *Integer) Add(b Integer) {
  *a += b
}
main() {
  var a Integer = 3
  a.Add(2) //5
  fmt.Println(a)
}
```

如果上面的func不是用指针传递，那a的值还是3

值语义和引用语义

```go
b = a 
b.Modify()
```

如果b的修改不会影响a的值,那么此类型属于值类型。如果会影响a的值,那么此类型是引用 类型。
基本类型int float之流和复合类型array struct pointer之流都是值语义
举例，go语言很彻底的大部分都是值语义

``` go
a = [3]int{1,2,3}
var b = a
b[1]++
fmt.Println(a, b)//[1 2 3] [1 3 3]
// 如果要改b的时候改a，就要用指针b = &a //这表明b=&a赋值语句是数组内容的引用。变量b的类型不是[3]int,而是*[3]int类型。
fmt.Println(a, *b)
```

### struct

所有的Go语言类型(指针类型除外)都可以有自己的方法。在这个背景下,
Go语言的结构体只是很普通的复合类型,平淡无奇。例如,我们要定义一个矩形类型:

```go
type Rect struct {
  x, y float64
  width, height float64
}
// 然后我们定义成员方法Area()来计算矩形的面积:
func (r *Rect) Area() float64 {
  return r.width * r.height
}
```

可以看出, Go语言中结构体的使用方式与C语言并没有明显不同。

初始化

```go
rect1 := new(Rect)
rect2 := &Rect{} //因为react2是一个指针指向对象，所以后面的写法是引用
rect3 := &Rect{0, 0, 100, 200}
rect4 := &Rect{width: 100, height: 200}
```

`type Rect struct{}`

在Go语言中没有构造函数的概念,对象的创建通常交由一个全局的创建函数来完成,以 NewXXX来命名,表示“构造函数”: 初始化

```go
func NewRect(x, y, width, height float64) *Rect {
  return &Rect{x, y, width, height}
}
```


使用指针这种定义方法`( r *Rect )`相当于是向一个Rect类定义了一个对象方法, 如果不用指针的话，就是简单的属于一个类的方法而已

通常在对象方法里，引用都别的对象或者值，都用指针，这样的话指针指向的对象状态都可以保存在自己对象的内部

### new

```go

package main

import (
    "fmt"
)

type Rect struct {
  width, length float64
}

func main() {
  var rect Rect
  rect.width = 100
  rect.length = 200
  fmt.Println(rect.width * rect.length)
}

```

从上面的例子看到，其实结构体类型和基础数据类型使用方式差不多，唯一的区别就是结构体类型可以通过.来访问内部的成员。包括给内部成员赋值和读取内部成员值。

在上面的例子中，我们是用var关键字先定义了一个Rect变量，然后对它的成员赋值。我们也可以使用初始化的方式来给Rect变量的内部成员赋值。


```go

package main

import (
  "fmt"
)

type Rect struct 
  width, length float64
}

func main() {
  var rect = Rect{width: 100, length: 200} //另一种赋值方式

  fmt.Println(rect.width * rect.length)
}

```

当然如果你知道结构体成员定义的顺序，也可以不使用key:value的方式赋值，直接按照结构体成员定义的顺序给它们赋值。

```go
package main

import (
  "fmt"
)

type Rect struct {
  width, length float64
}

func main() {
  var rect = Rect{100, 200} //体参赋值

  fmt.Println("Width:", rect.width, "* Length:",
  rect.length, "= Area:", rect.width*rect.length)
}
```

输出结果为
Width: 100 * Length: 200 = Area: 20000


### 结构体参数传递方式

我们说过，Go函数的参数传递方式是值传递，这句话对结构体也是适用的。

```go

package main

import (
  "fmt"
)

type Rect struct {
  width, length float64
}

func double_area(rect Rect) float64 {
  rect.width *= 2
  rect.length *= 2
  return rect.width * rect.length
}
func main() {
  var rect = Rect{100, 200}
  fmt.Println(double_area(rect))
  fmt.Println("Width:", rect.width, "Length:", rect.length)
}
```

上面的例子输出为:

80000
Width: 100 Length: 200

### 结构体组合函数 类似类的静态函数

上面我们在main函数中计算了矩形的面积，但是我们觉得矩形的面积如果能够作为矩形结构体的“内部函数”提供会更好。这样我们就可以直接说这个矩形面积是多少，而不用另外去取宽度和长度去计算。现在我们看看结构体“内部函数”定义方法：

```go
package main

import (
 "fmt"
)

type Rect struct {
 width, length float64
}

func (rect Rect) area() float64 {
 return rect.width * rect.length
}

func main() {
 var rect = Rect{100, 200}

 fmt.Println("Width:", rect.width, "Length:", rect.length,
  "Area:", rect.area())
}
```

我们看到，虽然main函数中的rect变量可以直接调用函数area()来获取矩形面积，但是area()函数确实没有定义在Rect结构体内部，这点和C语言的有很大不同。Go使用组合函数的方式来为结构体定义结构体方法。我们仔细看一下上面的area()函数定义。

首先是关键字func表示这是一个函数，第二个参数是结构体类型和实例变量，第三个是函数名称，第四个是函数返回值。这里我们可以看出area()函数和普通函数定义的区别就在于area()函数多了一个结构体类型限定。这样一来Go就知道了这是一个为结构体定义的方法。

这里需要注意一点就是定义在结构体上面的函数(function)一般叫做方法(method)。

### 结构体和指针!!! 这个类似对象

我们在指针一节讲到过，指针的主要作用就是在函数内部改变传递进来变量的值。对于上面的计算矩形面积的例子，我们可以修改一下代码如下：

```go
package main

import (
 "fmt"
)

type Rect struct {
 width, length float64
}

func (rect *Rect) area() float64 {
 return rect.width * rect.length
}

func main() {
 var rect = new(Rect)
 rect.width = 100
 rect.length = 200
 fmt.Println("Width:", rect.width, "Length:", rect.length,
 "Area:", rect.area())
}
```

上面的例子中，使用了new函数来创建一个结构体指针rect，也就是说rect的类型是*Rect，结构体遇到指针的时候，你不需要使用*去访问结构体的成员，直接使用.引用就可以了。所以上面的例子中我们直接使用rect.width=100 和rect.length=200来设置结构体成员值。因为这个时候rect是结构体指针，所以我们定义area()函数的时候结构体限定类型为*Rect。

其实在计算面积的这个例子中，我们不需要改变矩形的宽或者长度，所以定义area函数的时候结构体限定类型仍然为Rect也是可以的。如下：

```go
package main

import (
 "fmt"
)

type Rect struct {
 width, length float64
}

func (rect Rect) area() float64 {
 return rect.width * rect.length
}

func main() {
 var rect = new(Rect)
 rect.width = 100
 rect.length = 200
 fmt.Println("Width:", rect.width, "Length:", rect.length,
 "Area:", rect.area())
}
```

这里Go足够聪明，所以rect.area()也是可以的。

至于使不使用结构体指针和使不使用指针的出发点是一样的，那就是你是否试图在函数内部改变传递进来的参数的值。再举个例子如下：

```go
package main

import (
 "fmt"
)

type Rect struct {
 width, length float64
}

func (rect *Rect) double_area() float64 {
 rect.width *= 2
 rect.length *= 2
 return rect.width * rect.length
}

func main() {
 var rect = new(Rect)
 rect.width = 100
 rect.length = 200
 fmt.Println(*rect)
 fmt.Println("Double Width:", rect.width, "Double Length:", rect.length,
  "Double Area:", rect.double_area())
 fmt.Println(*rect)
}
```

这个例子的输出是：

{100 200}
Double Width: 200 Double Length: 400 Double Area: 80000
{200 400}

### 结构体内嵌类型

我们可以在一个结构体内部定义另外一个结构体类型的成员。例如iPhone也是Phone，我们看下例子：

```go
package main

import (
 "fmt"
)

type Phone struct {
 price int
 color string
}

type IPhone struct {
 phone Phone
 model string
}

func main() {
 var p IPhone
 p.phone.price = 5000
 p.phone.color = "Black"
 p.model = "iPhone 5"
 fmt.Println("I have a iPhone:")
 fmt.Println("Price:", p.phone.price)
 fmt.Println("Color:", p.phone.color)
 fmt.Println("Model:", p.model)
}
```

输出结果为

I have a iPhone:
Price: 5000
Color: Black
Model: iPhone 5
在上面的例子中，我们在结构体IPhone里面定义了一个Phone变量phone，然后我们可以像正常的访问结构体成员一样访问phone的成员数据。但是我们原来的意思是“iPhone也是(is-a)Phone”，而这里的结构体IPhone里面定义了一个phone变量，给人的感觉就是“iPhone有一个(has-a)Phone”，挺奇怪的。当然Go也知道这种方式很奇怪，所以支持如下做法：

```go
package main

import (
 "fmt"
)

type Phone struct {
 price int
 color string
}

type IPhone struct {
 Phone
 model string
}

func main() {
 var p IPhone
 p.price = 5000
 p.color = "Black"
 p.model = "iPhone 5"
 fmt.Println("I have a iPhone:")
 fmt.Println("Price:", p.price)
 fmt.Println("Color:", p.color)
 fmt.Println("Model:", p.model)
}

```

输出结果为

I have a iPhone:
Price: 5000
Color: Black
Model: iPhone 5
在这个例子中，我们定义IPhone结构体的时候，不再定义Phone变量，直接把结构体Phone类型定义在那里。然后IPhone就可以像访问直接定义在自己结构体里面的成员一样访问Phone的成员。

上面的例子中，我们演示了结构体的内嵌类型以及内嵌类型的成员访问，除此之外，假设结构体A内部定义了一个内嵌结构体B，那么A同时也可以调用所有定义在B上面的函数。

```go
package main

import (
 "fmt"
)

type Phone struct {
 price int
 color string
}

func (phone Phone) ringing() {
 fmt.Println("Phone is ringing...")
}

type IPhone struct {
 Phone
 model string
}

func main() {
 var p IPhone
 p.price = 5000
 p.color = "Black"
 p.model = "iPhone 5"
 fmt.Println("I have a iPhone:")
 fmt.Println("Price:", p.price)
 fmt.Println("Color:", p.color)
 fmt.Println("Model:", p.model)

 p.ringing()
}
```

输出结果为：

I have a iPhone:
Price: 5000
Color: Black
Model: iPhone 5
Phone is ringing...

#### 结构体和指针进一步阐述

```go
package main

import (
 "fmt"
)

type person struct {
 name string
 age  int
}

func main() {
 p1 := person{}
 p2 := &person{}
 p3 := new(person)
 fmt.Println(p1)
 fmt.Println(p2)
 fmt.Println(p3)
}

// 输出结果: 
// { 0}
// &{ 0}
// &{ 0}

```

p1、p2、p3都是person struct的实例，但p2和p3是完全等价的，它们都指向实例的指针，指针中保存的是实例的地址，所以指针再指向实例，p1则是直接指向实例。这三个变量与person struct实例的指向关系如下：

变量名      指针     数据对象(实例)
p1(addr) -------------> { 0}
p2 -----> ptr(addr) --> { 0}
p3 -----> ptr(addr) --> { 0}

所以p1和ptr(addr)保存的都是数据对象的地址，p2和p3则保存ptr(addr)的地址。通常，将指向指针的变量(p1、p2)直接称为指针，将直接指向数据对象的变量(p1)称为对象本身，因为指向数据对象的内容就是数据对象的地址，其中ptr(addr)和p1保存的都是实例对象的地址。

但尽管一个是数据对象值，一个是指针，它们都是数据对象的实例。也就是说，`p1.name`和`p2.name`都能访问对应实例的属性。

那`var p4 *person`呢，它是什么？该语句表示p4是一个指针，它的指向对象是person类型的，但因为它是一个指针，它将初始化为nil，即表示没有指向目标。但已经明确表示了，p4所指向的是一个保存数据对象地址的指针。也就是说，目前为止，p4的指向关系如下：

p4 -> ptr(nil)

既然p4是一个指针，那么可以将`&person{}`或`new(person)`赋值给p4。

#### 传值 or 传指针

Go函数给参数传递值的时候是以复制的方式进行的。

复制传值时，如果函数的参数是一个struct对象，将直接复制整个数据结构的副本传递给函数，这有两个问题：

* 函数内部无法修改传递给函数的原始数据结构，它修改的只是原始数据结构拷贝后的副本
* 如果传递的原始数据结构很大，完整地复制出一个副本开销并不小

所以，如果条件允许，应当给需要struct实例作为参数的函数传struct的指针。例如：

```go
func add(p *person){...}
```

既然要传指针，那struct的指针何来？自然是通过`&`符号来获取。分两种情况，创建成功和尚未创建的实例。

对于已经创建成功的struct实例`p`，如果这个实例是一个值而非指针(即`p->{person_fields}`)，那么可以`&p`来获取这个已存在的实例的指针，然后传递给函数，如`add(&p)`。

对于尚未创建的struct实例，可以使用`&person{}`或者`new(person)`的方式直接生成实例的指针p，虽然是指针，但Go能自动解析成实例对象。然后将这个指针p传递给函数即可。如：

```go
p1 := new(person)
p2 := &person{}
add(p1)
add(p2)
```


### 接口 interface

我们先看一个例子，关于Nokia手机和iPhone手机都能够打电话的例子。

```go

package main

import (
 "fmt"
)

type NokiaPhone struct {
}

func (nokiaPhone NokiaPhone) call() {
 fmt.Println("I am Nokia, I can call you!")
}

type IPhone struct {
}

func (iPhone IPhone) call() {
 fmt.Println("I am iPhone, I can call you!")
}
func main() {
 var nokia NokiaPhone
 nokia.call()

 var iPhone IPhone
 iPhone.call()
}

```

我们定义了NokiaPhone和IPhone，它们都有各自的方法call()，表示自己都能够打电话。但是我们想一想，是手机都应该能够打电话，所以这个不算是NokiaPhone或是IPhone的独特特点。否则iPhone不可能卖这么贵了。

再仔细看一下接口的定义，首先是关键字`type`，然后是接口名称，最后是关键字`interface`表示这个类型是接口类型。在接口类型里面，我们定义了一组方法。

Go语言提供了一种接口功能，它把所有的具有共性的方法定义在一起，任何其他类型只要实现了这些方法就是实现了这个接口，不一定非要显式地声明要去实现哪些接口啦。比如上面的手机的call()方法，就完全可以定义在接口Phone里面，而NokiaPhone和IPhone只要实现了这个接口就是一个Phone。

```go
package main

import (
 "fmt"
)

type Phone interface {
 call()
}

type NokiaPhone struct {
}

func (nokiaPhone NokiaPhone) call() {
 fmt.Println("I am Nokia, I can call you!")
}

type IPhone struct {
}

func (iPhone IPhone) call() {
 fmt.Println("I am iPhone, I can call you!")
}

func main() {
 var phone Phone

 phone = new(NokiaPhone)
 phone.call()

 phone = new(IPhone)
 phone.call()
}
```

在上面的例子中，我们定义了一个接口Phone，接口里面有一个方法call()，仅此而已。然后我们在main函数里面定义了一个Phone类型变量，并分别为之赋值为NokiaPhone和IPhone。然后调用call()方法，输出结果如下：

I am Nokia, I can call you!
I am iPhone, I can call you!

以前我们说过，Go语言式静态类型语言，变量的类型在运行过程中不能改变。但是在上面的例子中，phone变量好像先定义为Phone类型，然后是NokiaPhone类型，最后成为了IPhone类型，真的是这样吗？

原来，在Go语言里面，一个类型A只要实现了接口X所定义的全部方法，那么A类型的变量也是X类型的变量。在上面的例子中，NokiaPhone和IPhone都实现了Phone接口的call()方法，所以它们都是Phone，这样一来是不是感觉正常了一些。

我们为Phone添加一个方法sales()，再来熟悉一下接口用法。

```go
package main

import (
 "fmt"
)

type Phone interface {
 call()
 sales() int
}

type NokiaPhone struct {
 price int
}

func (nokiaPhone NokiaPhone) call() {
 fmt.Println("I am Nokia, I can call you!")
}
func (nokiaPhone NokiaPhone) sales() int {
 return nokiaPhone.price
}

type IPhone struct {
 price int
}

func (iPhone IPhone) call() {
 fmt.Println("I am iPhone, I can call you!")
}

func (iPhone IPhone) sales() int {
 return iPhone.price
}

func main() {
 var phones = [5]Phone{
  NokiaPhone{price: 350},
  IPhone{price: 5000},
  IPhone{price: 3400},
  NokiaPhone{price: 450},
  IPhone{price: 5000},
 }

 var totalSales = 0
 for _, phone := range phones {
  totalSales += phone.sales()
 }
 fmt.Println(totalSales)

}
```

输出结果：

14200
上面的例子中，我们定义了一个手机数组，然后计算手机的总售价。可以看到，由于NokiaPhone和IPhone都实现了sales()方法，所以它们都是Phone类型，但是计算售价的时候，Go会知道调用哪个对象实现的方法。

接口类型还可以作为结构体的数据成员。

假设有个败家子，iPhone没有出的时候，买了好几款Nokia，iPhone出来后，又买了好多部iPhone，老爸要来看看这小子一共花了多少钱。

```go
package main

import (
 "fmt"
)

type Phone interface {
 sales() int
}

type NokiaPhone struct {
 price int
}

func (nokiaPhone NokiaPhone) sales() int {
 return nokiaPhone.price
}

type IPhone struct {
 price int
}

func (iPhone IPhone) sales() int {
 return iPhone.price
}

type Person struct {
 phones []Phone
 name   string
 age    int
}

func (person Person) total_cost() int {
 var sum = 0
 for _, phone := range person.phones {
  sum += phone.sales()
 }
 return sum
}

func main() {
 var bought_phones = [5]Phone{
  NokiaPhone{price: 350},
  IPhone{price: 5000},
  IPhone{price: 3400},
  NokiaPhone{price: 450},
  IPhone{price: 5000},
 }

 var person = Person{name: "Jemy", age: 25, phones: bought_phones[:]}

 fmt.Println(person.name)
 fmt.Println(person.age)
 fmt.Println(person.total_cost())
}
```

这个例子纯为演示接口作为结构体数据成员，如有雷同，纯属巧合。这里面我们定义了一个Person结构体，结构体内部定义了一个手机类型切片。另外我们定义了Person的total_cost()方法用来计算手机花费总额。输出结果如下：

Jemy
25
14200

#### 强制检测是否全实现一个接口

有时不完全实现一个接口，也能跑通

```go
type Shape interface {
    Sides() int
    Area() int
}
type Square struct {
    len int
}
func (s* Square) Sides() int {
    return 4
}
func main() {
    s := Square{len: 5}
    fmt.Printf("%d\n",s.Sides())
}
```

这时可以用空指针负值，编译期会报错

```go
var _ Shape = (*Square)(nil)
```



----

### Go and Channel高并发

go关键字标明后面的语句进入协程操作

```go
func Add(x int, y int) z int {
  return x * y
}
go Add(2, 3)
```

channel一般用 `chan` 关键字去声明

```go
var chanName chan ElementType //必须制定channel里传递值的类型
var ch chan int
var var m map[string] chan bool //生命一个map元素是bool型的channel
```

定义一个channel可以用`make()`函数

```go
ch := make(chan int)
```

一个例子

```go
package main
import "fmt"

func Count(ch chan int) {
  ch <- 1 //下面的for循环里调用这个方法时，来到这里会阻塞, 因为写到channel里的东西，未有人接
  fmt.Println("Counting")
}

func main() {
  chs := make([]chan int, 10)
  for i := 0; i < 10; i++ {
    chs[i] = make(chan int)
    go Count(chs[i]) //创建10个channel，扔到Count方法里面
  }

  for _, ch := range(chs){
    <-ch //不把channel里面的东西都跑出来，整个进程都不会关闭, 也是会阻塞住程序
  }
}



```

!!!

ch <- value //这种写法会令程序阻塞，直到有其他goroutine从这个channel读取数据

value := <-ch //这个是从channel读取数据的写法，如果channel之前没有写入数据，那么这个读取的数据的一行也会阻塞程序，知道这个channel在其他地方被写入为止


----

### 首字母大写 用titles.Title方法

fmt.Printf("%s", titles.Title("shit"))


或者

```go
func Ucfirst(str string) string {
    for i, v := range str {
        return string(unicode.ToUpper(v)) + str[i+1:]
    }
    return ""
}
 
func Lcfirst(str string) string {
    for i, v := range str {
        return string(unicode.ToLower(v)) + str[i+1:]
    }
    return ""
}
```

----

### 在mac下cross compile Linux 版本

env GOOS=linux GOARCH=amd64 go build -v .

----

数字类型的范围和占用

有符号整型
int8：表示 8 位有符号整型
大小：8 位
范围：-128～127

int16：表示 16 位有符号整型
大小：16 位
范围：-32768～32767

int32：表示 32 位有符号整型
大小：32 位
范围：-2147483648～2147483647

int64：表示 64 位有符号整型
大小：64 位
范围：-9223372036854775808～9223372036854775807

int：根据不同的底层平台（Underlying Platform），表示 32 或 64 位整型。除非对整型的大小有特定的需求，否则你通常应该使用 int 表示整型。
大小：在 32 位系统下是 32 位，而在 64 位系统下是 64 位。
范围：在 32 位系统下是 -2147483648～2147483647，而在 64 位系统是 -9223372036854775808～9223372036854775807。

无符号整型
uint8：表示 8 位无符号整型
大小：8 位
范围：0～255

uint16：表示 16 位无符号整型
大小：16 位
范围：0～65535

uint32：表示 32 位无符号整型
大小：32 位
范围：0～4294967295

uint64：表示 64 位无符号整型
大小：64 位
范围：0～18446744073709551615

uint：根据不同的底层平台，表示 32 或 64 位无符号整型。
大小：在 32 位系统下是 32 位，而在 64 位系统下是 64 位。
范围：在 32 位系统下是 0～4294967295，而在 64 位系统是 0～18446744073709551615。

浮点型
float32：32 位浮点数
float64：64 位浮点数

复数类型
complex64：实部和虚部都是 float32 类型的的复数。
complex128：实部和虚部都是 float64 类型的的复数。

其他数字类型
byte 是 uint8 的别名。
rune 是 int32 的别名。

在学习字符串的时候，我们会详细讨论 byte 和 rune。


----

gorm定义类型或strcut定义字段类型时用指针，是为了能使用nil值
string类型类似slice,它等价StringHeader。所以很多情况下会用｀unsafe.Pointer｀与[]byte类型进行更有效的转换，因为直接进行类型转换string([]byte)会发生数据的复制。

字符串比较特殊，它的值不能修改，任何想对字符串的值做修改都会生成新的字符串。

大部分情况下你不需要定义成*string。唯一的例外你需要 nil值的时候。我们知道，类型string的空值/缺省值为"",但是如果你需要nil，你就必须定义*string。举个例子，在对象序列化的时候""和nil表示的意义是不一样的，""表示字段存在，只不过字符串是空值，而nil表示字段不存在

----

"math/rand"

rand.Perm(4) 返回[0,2,1,3] 等0到4随机数组

shuffle一个数组的方法
a := []int{1, 2, 3, 4, 5, 6, 7, 8}
rand.Seed(time.Now().UnixNano())
rand.Shuffle(len(a), func(i, j int) { a[i], a[j] = a[j], a[i]  })

//这种更简单,Seed是先设定好全局的随机方式
rand.Seed(time.Now().Unix()) // initialize global pseudo random generator
xxx = reasons[rand.Intn(len(reasons))]

----

go1.11后的go module, go mod init

之前go get都是 $GOPATH/src源码 $GOPATH/bin编译可执行 $GOPATH/pkg .a编译后的关联文件

go modules 在 v1.11 版本正式推出，在最新发布的 v1.14 版本中，官方正式发话，称其已经足够成熟，可以应用于生产上。

从 v1.11 开始，go env 多了个环境变量： GO111MODULE ，这里的 111，其实就是 v1.11 的象征标志， go 里好像很喜欢这样的命名方式，比如当初 vendor 出现的时候，也多了个 GO15VENDOREXPERIMENT 环境变量，其中 15，表示的vendor 是在 v1.5 时才诞生的。

GO111MODULE 是一个开关，通过它可以开启或关闭 go mod 模式。

它有三个可选值：off、on、auto，默认值是auto。

GO111MODULE=off禁用模块支持，编译时会从GOPATH和vendor文件夹中查找包。
GO111MODULE=on启用模块支持，编译时会忽略GOPATH和vendor文件夹，只根据 go.mod下载依赖。
GO111MODULE=auto，当项目在$GOPATH/src 外且项目根目录有go.mod文件时，自动开启模块支持。
go mod 出现后， GOPATH（肯定没人使用了） 和 GOVENDOR 将会且正在被逐步淘汰，但是若你的项目仍然要使用那些即将过时的包依赖管理方案，请注意将 GO111MODULE 置为 off。

具体怎么设置呢？可以使用 go env 的命令，如我要开启 go mod ，就使用这条命令

$ go env -w GO111MODULE="on"
开了以后 go install会自动把依赖安装到gopath并分开版本

go mod init：初始化go mod， 生成go.mod文件，后可接参数指定 module 名，上面已经演示过。
go mod download：手动触发下载依赖包到本地cache（默认为$GOPATH/pkg/mod目录）
go mod graph： 打印项目的模块依赖结构
go mod tidy ：添加缺少的包，且删除无用的包
go mod verify ：校验模块是否被篡改过
go mod why： 查看为什么需要依赖
go mod vendor ：导出项目所有依赖到vendor下
go mod edit ：编辑go.mod文件，接 -fmt 参数格式化 go.mod 文件，接 -require=golang.org/x/text 添加依赖，接 -droprequire=golang.org/x/text 删除依赖，详情可参考 go help mod edit
go list -m -json all：以 json 的方式打印依赖详情


自己的mindmap例子

`module mindmap`, 里面有package `model`, 然后`main.go` 引用model

```go
package mindmap
import (
  // 引用子模块
  "mindmap/model"
)

func main() {
  // 用模块前缀引用
  model.Mindmap.FindAll()
}

```

----

go get 或 install 查看进度, 利用`pv`

```bash
strace -f -e trace=network go get github.com/GoAdminGroup/go-admin/adm 2>&1 | pv -i 0.05 > /dev/null
```

----

 vscode 调试 debug !!!

 1. 安装go插件
 2. 安装delve `go install github.com/go-delve/delve/cmd/dlv@latest` , goversion 1.16+
 3. vscode debug添加配置

 ```json
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Connect to server",
            "type": "go",
            "request": "attach",
            "mode": "remote",
            "remotePath": "",
            "port": 2345,
            "host": "127.0.0.1",
            "program": "${workspaceRoot}"
        },
        {
            "name": "Launch file",
            "type": "go",
            "request": "launch",
            "mode": "debug",
            // 这里还可以指定执行哪个入口 "./server/main.go"
            "program": "${file}"
        }
    ]
}
 ```

arm m1 记得版本问题，还有最后跑一下 Go: install/update tools.

无论在vscode 或者不太用配置的 idea goland, m1 arm要注意检查系统的`go env`, 确保运行的

```bash
go env -w GOOS=darwin
go env -w GOARCH=arm64
go env -w GOHOSTARCH=arm64
```

## 错误处理

```go
func shit() int, error {
    return -1, errors.New("Bad Arguments - negtive!")
}

```

-----

## jwt 用在mindmap里的例子

```go
var identityKey = "currentUser"
var demoSecret = "10ASAD90890BCUASD451321AGASDUH213124BSDU"
var demoTokenHead = "demo"

// 返回当前用户
// /auth/currentUser
func currentUserHandler(c *gin.Context) {
 // claims := jwt.ExtractClaims(c) // 从contest的KEYS = JWT_TOKEN, Get出来 {[key]: keyname, payload, exp}
 user, _ := c.Get(identityKey) //这里的user是payload
 // 重新拿一下，就有created_at之类
 user, _ = FindByName(user.(*User).Name)
 // c.JSON(200, gin.H{
 //  "id":     user.(*User).ID,
 //  "name":   user.(*User).Name,
 //  "avatar": user.(*User).Avatar,
 // })
 c.JSON(200, user)
}

// 一.未登陆login时首先进入Authenticator, 然后到payload方法，按payload模版生成token，返回token expire给前端
// 二.已登陆日常需要验证登陆的地方 1)IdentityHandler 把token解析出Payload来的塞进返回User, 2)Authorizator检查解析出来的是否存在
func JwtAuth(r *gin.Engine) (*jwt.GinJWTMiddleware, error) {
 authMiddleware, err := jwt.New(&jwt.GinJWTMiddleware{
  Realm:       "test zone",
  Key:         []byte(demoSecret),
  Timeout:     30 * 24 * time.Hour,
  MaxRefresh:  30 * 24 * time.Hour,
  IdentityKey: identityKey, //用于放在context里面的Key，可以拿出User
  PayloadFunc: func(data interface{}) jwt.MapClaims {
   if v, ok := data.(*User); ok {
    return jwt.MapClaims{
     "name":   v.Name,
     "avatar": v.Avatar,
     "id":     v.GetID(),
    }
   }
   return jwt.MapClaims{}
  },
  IdentityHandler: func(c *gin.Context) interface{} {
   // 这个位置只能确保claims有值
   claims := jwt.ExtractClaims(c)
   obj, ok := claims[identityKey]
   if ok {
    fmt.Printf("obj: %#v", obj)
   }

   user := &User{
    Name:   claims["name"].(string),
    Avatar: claims["avatar"].(string),
   }
   objectId, _ := primitive.ObjectIDFromHex(claims["id"].(string))
   user.SetID(objectId)

   return user
  },
  // 验证login
  Authenticator: func(c *gin.Context) (interface{}, error) {
   var loginVals User
   if err := c.ShouldBind(&loginVals); err != nil {
    return nil, err
   }
   // 传上来的name验证，demo环境直接返回或创建用户就行
   name := loginVals.Name
   avatar := loginVals.Avatar

   if name != "" {
    return FindOrCreateUserByName(name, avatar)
   }

   return nil, jwt.ErrFailedAuthentication
  },
  // 用于验证下方 group(auth/xxxUrl)是否合法，是否可以获取资源，demo只需要有登陆或者有token就行
  Authorizator: func(data interface{}, c *gin.Context) bool {
   if _, ok := data.(*User); ok {
    // TODO userName检查数据库是否存在之类
    return true
   }

   return false
  },
  // 未登陆的报错
  Unauthorized: func(c *gin.Context, code int, message string) {
   // http code444未登陆方便判断
   c.JSON(444, gin.H{
    "code":    444,
    "message": message,
   })
  },
  // TokenLookup is a string in the form of "<source>:<name>" that is used
  // to extract token from the request.
  // Optional. Default value "header:Authorization".
  // Possible values:
  // - "header:<name>"
  // - "query:<name>"
  // - "cookie:<name>"
  // - "param:<name>"
  TokenLookup: "header: Authorization, query: token, cookie: jwt",
  // TokenLookup: "query:token",
  // TokenLookup: "cookie:token",

  // TokenHeadName is a string in the header. Default value is "Bearer"
  TokenHeadName: demoTokenHead,

  // TimeFunc provides the current time. You can override it to use another time value. This is useful for testing or if your server uses a different time zone than your tokens.
  TimeFunc: time.Now,
 })

 if err != nil {
  log.Fatal("JWT Error:" + err.Error())
 }

 // When you use jwt.New(), the function is already automatically called for checking,
 // which means you don't need to call it again.
 errInit := authMiddleware.MiddlewareInit()

 if errInit != nil {
  log.Fatal("authMiddleware.MiddlewareInit() Error:" + errInit.Error())
 }

 r.POST("/login", authMiddleware.LoginHandler)

 r.NoRoute(authMiddleware.MiddlewareFunc(), func(c *gin.Context) {
  claims := jwt.ExtractClaims(c)
  log.Printf("NoRoute claims: %#v\n", claims)
  c.JSON(404, gin.H{"code": "PAGE_NOT_FOUND", "message": "Page not found"})
 })

 // auth
 auth := r.Group("/auth")
 // Refresh time can be longer than token timeout
 auth.GET("/refresh_token", authMiddleware.RefreshHandler)

 auth.Use(authMiddleware.MiddlewareFunc())
 {
  auth.GET("/currentUser", currentUserHandler)
 }

 return authMiddleware, err
}

```


----

## mgm Mongo

-----


## import 的各种格式

引用格式
常用的包引用有以下 4 种格式，我们以 fmt 包为例进行说明。

标准引用方式 `import "fmt”`
此时可以用 fmt. 作为前缀引用包内可导出元素，这是常用的一种方式。

别名引用方式 `import F "fmt”`
此时相当于给包 fmt 起了个别名 F ，用 F.代替标准的 fmt.作为前缀引用 fmt 包内可导出元素。

省略引用方式 import . "fmt"
此时相当于把包 fmt 的命名空间直接合并到当前程序的命名空间中，使用 fmt 包内可导出元素可以不用前缀 fmt. ，直接引用。示例如下：

```go
package main
import . "fmt"
func main() {
    // 不需要加前级fmt.
    Println("hello , world”)
}
```

仅执行包初始化 init 函数
使用标准格式引用包，但是代码中却没有使用包，编译器会报错。如果包中有 init 初始化函数，则通过 import packageName 这种方式引用包，仅执行包的初始化函数，即使包没有 init 初始化函数，也不会引发编译器报错。示例如下： `import  _ "fmt"`
