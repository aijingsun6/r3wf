r3wf(rebar3 work flow)
=====

```
# 切换到 tag 0.0.1
[alking@localhost r3wf]$ git checkout 0.0.1
# 生成环境变量
[alking@localhost r3wf]$ source prod.env 
# compile 
[alking@localhost r3wf]$ rebar3 as prod compile
===> Verifying dependencies...
===> Compiling r3wf
# 发布release 版本0.0.1
[alking@localhost r3wf]$ rebar3 as prod release -n r3wf -v 0.0.1
===> Verifying dependencies...
===> Compiling r3wf
===> Starting relx build process ...
===> Resolving OTP Applications from directories:
          /home/alking/github/r3wf/_build/prod/lib
          /home/alking/github/r3wf/apps
          /usr/lib/erlang/lib
          /home/alking/github/r3wf/_build/prod/rel
===> Resolved r3wf-0.0.1
===> Including Erts from /usr/lib/erlang
===> release successfully created!
# 打包版本 
[alking@localhost r3wf]$ rebar3 as prod release tar -n r3wf -v 0.0.1
===> Verifying dependencies...
===> Compiling r3wf
===> Starting relx build process ...
===> Resolving OTP Applications from directories:
          /home/alking/github/r3wf/_build/prod/lib
          /home/alking/github/r3wf/apps
          /usr/lib/erlang/lib
          /home/alking/github/r3wf/_build/prod/rel
===> Resolved r3wf-0.0.1
===> Including Erts from /usr/lib/erlang
===> release successfully created!
===> tarball /home/alking/github/r3wf/_build/prod/rel/r3wf/r3wf-0.0.1.tar.gz successfully created!
# 复制到目标目录
[alking@localhost r3wf]$ cp _build/prod/rel/r3wf/r3wf-0.0.1.tar.gz ~/tmp/

# 在目标目录解压缩
[alking@localhost tmp]$ tar -xf r3wf-0.0.1.tar.gz
# 开启服务 0.0.1
[alking@localhost tmp]$ ./bin/r3wf start
# attach 到节点上去看一下
[alking@localhost tmp]$ ./bin/r3wf attach
Attaching to /tmp/erl_pipes/r3wf@localhost/erlang.pipe.1 (^D to exit)

(r3wf@localhost)2> application:which_applications().
[{sasl,"SASL  CXC 138 11","3.4.2"},
 {r3wf,"rebar3 work flow appliaction","0.0.1"},
 {stdlib,"ERTS  CXC 138 10","3.12"},
 {kernel,"ERTS  CXC 138 10","6.5.2"}]
(r3wf@localhost)3> [Quit]

# 准备升级系统
# 切换到tag 0.0.2
[alking@localhost r3wf]$ git checkout 0.0.2
Previous HEAD position was 356088a... add files
HEAD is now at a000233... version 0.0.2
# compile
[alking@localhost r3wf]$ rebar3 as prod compile
===> Verifying dependencies...
===> Compiling r3wf
# 发布版本0.0.2
[alking@localhost r3wf]$ rebar3 as prod release -n r3wf -v 0.0.2
===> Verifying dependencies...
===> Compiling r3wf
===> Starting relx build process ...
===> Resolving OTP Applications from directories:
          /home/alking/github/r3wf/_build/prod/lib
          /home/alking/github/r3wf/apps
          /usr/lib/erlang/lib
          /home/alking/github/r3wf/_build/prod/rel
===> Resolved r3wf-0.0.2
===> Including Erts from /usr/lib/erlang
===> release successfully created!
# 生成 appup
[alking@localhost r3wf]$ rebar3 as prod appup generate
===> current base dir: "/home/alking/github/r3wf/_build/prod"
===> app r3wf ebin dir: "/home/alking/github/r3wf/_build/prod/lib/r3wf/ebin"
===> Generated appup ("0.0.1" <-> "0.0.2") for r3wf in "/home/alking/github/r3wf/_build/prod/lib/r3wf/ebin/r3wf.appup"
# 生成 relup
[alking@localhost r3wf]$ rebar3 as prod relup
===> Verifying dependencies...
===> Compiling r3wf
===> Starting relx build process ...
===> Resolving OTP Applications from directories:
          /home/alking/github/r3wf/_build/prod/lib
          /home/alking/github/r3wf/apps
          /usr/lib/erlang/lib
          /home/alking/github/r3wf/_build/prod/rel
===> Resolved r3wf-0.0.2
===> Including Erts from /usr/lib/erlang
===> release successfully created!
===> Starting relx build process ...
===> Resolving OTP Applications from directories:
          /home/alking/github/r3wf/_build/prod/lib
          /home/alking/github/r3wf/apps
          /usr/lib/erlang/lib
          /home/alking/github/r3wf/_build/prod/rel
===> Resolving available OTP Releases from directories:
          /home/alking/github/r3wf/_build/prod/lib
          /home/alking/github/r3wf/_build/prod/rel
===> Resolved r3wf-0.0.2
===> relup successfully created!
# 打包release
[alking@localhost r3wf]$ rebar3 as prod tar -n r3wf -v 0.0.2
===> Verifying dependencies...
===> Compiling r3wf
===> Starting relx build process ...
===> Resolving OTP Applications from directories:
          /home/alking/github/r3wf/_build/prod/lib
          /home/alking/github/r3wf/apps
          /usr/lib/erlang/lib
          /home/alking/github/r3wf/_build/prod/rel
===> Resolved r3wf-0.0.2
===> Including Erts from /usr/lib/erlang
===> release successfully created!
===> Starting relx build process ...
===> Resolving OTP Applications from directories:
          /home/alking/github/r3wf/_build/prod/lib
          /home/alking/github/r3wf/apps
          /usr/lib/erlang/lib
          /home/alking/github/r3wf/_build/prod/rel
===> Resolved r3wf-0.0.2
===> tarball /home/alking/github/r3wf/_build/prod/rel/r3wf/r3wf-0.0.2.tar.gz successfully created!
# 将tar包复制到releases 目录下
[alking@localhost r3wf]$ cp _build/prod/rel/r3wf/r3wf-0.0.2.tar.gz ~/tmp/releases/
# 安装0.0.2 版本
[alking@localhost tmp]$ ./bin/r3wf install 0.0.2
Release 0.0.2 not found, attempting to unpack releases/r3wf-0.0.2.tar.gz
Unpacked successfully: "0.0.2"
Installed Release: 0.0.2
Made release permanent: "0.0.2"
[alking@localhost tmp]$ ./bin/r3wf versions
Installed versions:
* 0.0.2 permanent
* 0.0.1 old
[alking@localhost tmp]$ ./bin/r3wf attach
Attaching to /tmp/erl_pipes/r3wf@localhost/erlang.pipe.1 (^D to exit)

(r3wf@localhost)3> application:which_applications().
[{sasl,"SASL  CXC 138 11","3.4.2"},
 {r3wf,"rebar3 work flow appliaction","0.0.2"},
 {stdlib,"ERTS  CXC 138 10","3.12"},
 {kernel,"ERTS  CXC 138 10","6.5.2"}]
(r3wf@localhost)4> m(r3wf).
Module: r3wf
MD5: fe5e48d1e7de2dffd9a626803876bab7
Compiled: No compile time info available
Object file: /home/alking/tmp/lib/r3wf-0.0.2/ebin/r3wf.beam
Compiler options:  [debug_info,
                    {i,"/home/alking/github/r3wf/_build/prod/lib/r3wf/src"},
                    {i,"/home/alking/github/r3wf/_build/prod/lib/r3wf/include"},
                    {i,"/home/alking/github/r3wf/_build/prod/lib/r3wf"}]
Exports: 
         hello_v2/0
         module_info/0
         module_info/1
ok
(r3wf@localhost)5> [Quit]

# 降级服务
[alking@localhost tmp]$ ./bin/r3wf downgrade 0.0.1
Release 0.0.1 is marked old, switching to it.
Installed Release: 0.0.1
Made release permanent: "0.0.1"

```
