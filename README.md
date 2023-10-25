# About

The MX compiler

*MX is a programming language specifically designed to handle mathematical matrices. MX was built using OCAML and LLVM*.

Coded in OCaml, this incorporates C-style syntax in addition to built in matrix operations (int, bool, string, and matrix types, arithmetic, if-else, for, and while statements) and compiles it into LLVM IR.

It needs the OCaml llvm library, which is most easily installed through opam.

Install LLVM and its development libraries, the m4 macro preprocessor,
and opam, then use opam to install llvm.

The version of the OCaml llvm library must match the version of the LLVM
system installed on your system.

# Getting Started
The basic MX compiler compiles gcd.mx.  run.sh runs the MX
executable of our GCD test program (.mx file) to produce a .ll file, invokes "llc" (the LLVM compiler) to produce a .s (assembly) file, then invokes "cc" (the stock C compiler) to assemlbe the .s file, and generate an executable.  Before running run.sh, be sure to change the file permissions.

If you get errors about llvm.analysis not being found, it's probably
because opam enviroment information is missing.  Either run

eval $(opam config env)

or run ocamlbuild like this:

opam config exec -- ocamlbuild <args>

## Installation under Ubuntu 20.04

Use LLVM 10. Install the matching version of the OCaml LLVM bindings:

sudo apt install ocaml llvm-10.0 llvm-10.0-dev llvm-runtime m4 opam
opam init
opam install llvm.10.0.0
eval $(opam config env)

make

chmod 755 run.sh

./run.sh

## Installation under Ubuntu 18.04

Use LLVM 9. Install the matching version of the OCaml LLVM bindings:

sudo apt install ocaml llvm-9 llvm-9-dev llvm-runtime m4 opam cmake
opam init
opam update
opam install llvm.9.0.0
eval $(opam config env)

make
  
chmod 755 run.sh

./run.sh

## Installation under Ubuntu 16.04

LLVM 3.8 is the default under 16.04. Install the matching version of
the OCaml LLVM bindings:

sudo apt install ocaml llvm llvm-runtime m4 opam cmake
opam init
opam install llvm.3.8
eval $(opam config env)

make

chmod 755 run.sh

./run.sh

## Installation under OS X

1. Install Homebrew:

   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

2. Verify Homebrew is installed correctly:

   brew doctor

3. Install opam:

   brew install opam

4. Set up opam:

   opam init

5. Install llvm:

   brew install llvm

   Take note of where brew places the llvm executables. It will show
   you the path to them under the CAVEATS section of the post-install
   terminal output. For me, they were in /usr/local/opt/llvm/bin. Also
   take note of the llvm version installed. For me, it was 3.6.2.

6. Have opam set up your enviroment:

   eval $(opam config env)

7. Install the OCaml llvm library:

   opam install llvm.3.6 

   Ensure that the version of llvm you install here matches the
   version you installed via brew. Brew installed llvm version 3.6.2,
   so I install llvm.3.6 with opam.

   IF YOU HAVE PROBLEMS ON THIS STEP, it's probably because you are
   missing some external dependencies. Ensure that libffi is installed
   on your machine. It can be installed with

   brew install libffi

   If, after this, opam install llvm.3.6 is still not working, try
   running

   opam list --external --required-by=llvm.3.6

   This will list all of the external dependencies required by
   llvm.3.6. Install all the dependencies listed by this command.

   IF THE PREVIOUS STEPS DO NOT SOLVE THE ISSUE, it may be a problem
   with using your system's default version of llvm. Install a
   different version of llvm and opam install llvm with that version
   by running:

   brew install homebrew/versions/llvm37
   opam install llvm.3.7

   Where the number at the end of both commands is a version different 
   from the one your system currently has.

8. Make sure run.sh can access lli and llc
  
   Modify the definition of LLI and LLC in run.sh to point to the absolute
   path, e.g., LLI="/usr/local/opt/llvm/bin/lli"

   - OR -

   Update your path, e.g.,
   
   export PATH=$PATH:/usr/local/opt/llvm/bin

   - OR -
   
   Create a symbolic link to the lli command:

   sudo ln -s /usr/local/opt/llvm/bin/lli /usr/bin/lli

   Create the symlink from wherever brew installs the llvm executables
   and place it in your bin. From step 5, I know that brew installed
   the lli executable in the folder, /usr/local/opt/llvm/bin/, so this
   is where I symlink to. Brew might install the lli executables in a
   different location for you, so make sure you symlink to the right
   directory.

   IF YOU GET OPERATION NOT PERMITTED ERROR, then this is probably a
   result of OSX's System Integrity Protection. 

   One way to get around this is to reboot your machine into recovery
   mode (by holding cmd-r when restarting). Open a terminal from
   recovery mode by going to Utilities -> Terminal, and enter the
   following commands:

   csrutil disable
   reboot
   
   After your machine has restarted, try the `ln....` command again,
   and it should succeed.

   IMPORTANT: the prevous step disables System Integrity Protection,
   which can leave your machine vulnerable. It's highly advisable to
   reenable System Integrity Protection when you are done by 
   rebooting your machine into recovery mode and entering the following
   command in the terminal:

   csrutil enable
   reboot

9. To run and test, navigate to the MX folder. Once there, run

   make ; chmod 755 run.sh ./run.sh

   MX should build without any complaints and the test program should run (gcd.mx).

   IF RUNNING ./run.sh fails, check to make sure you
   have symlinked the correct executable from your llvm installation.
   For example, if the executable is named lli-[version], then the 
   previous step should have looked something like:

   sudo ln -s /usr/local/opt/llvm/bin/lli-3.7 /usr/bin/lli   

   As before, you may also modify the path to lli in run.sh

## To run and test:

$ make

ocamlbuild -use-ocamlfind -pkgs llvm,llvm.analysis -cflags -w,+a-4 mx.native

$ ./run.sh

