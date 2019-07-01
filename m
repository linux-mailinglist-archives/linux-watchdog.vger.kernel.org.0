Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8753A320
	for <lists+linux-watchdog@lfdr.de>; Sun,  9 Jun 2019 04:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbfFIC2L (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 8 Jun 2019 22:28:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55848 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbfFIC1k (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 8 Jun 2019 22:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+7YOeZYQMgrlvEvn+ptCX3yYsOcx7RA+feD7vnxkurE=; b=LZvTkvGZ/+MlTYDWNyzV9VPU1C
        X5Lu5WJjKZG9OyWbSRnjeygyjvXF9HxD+7/urfoL04shunsS9bfz/JVmsizhZrn5mUMFK/T02xNG7
        e3Bm9cWOIOaT3HJX+JoEi5wP1Kvg+naONmovZZ0VRHlLFy7ZmSwIYkvO5j8szcoZjQl5pNSm04iZX
        Rt2L+Dmvw3VzZ5TJxi5UoEFBGe7YJMYwkFPu4sHdEE33Wbx1EUeLFA7UOe8+nOuF9+kJVitvi8kmT
        iQZACVMZxq9+N7rFUMYvnItpDjRYF+LizvqBYVepZXpUtMRqCalmrD0/oe/lcNJow9N7XuHAiq2Ow
        EInpYwYg==;
Received: from 179.176.115.133.dynamic.adsl.gvt.net.br ([179.176.115.133] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hZnYO-0001my-1e; Sun, 09 Jun 2019 02:27:28 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hZnYL-0000JJ-6k; Sat, 08 Jun 2019 23:27:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org
Subject: [PATCH v3 15/33] docs: kdump: convert docs to ReST and rename to *.rst
Date:   Sat,  8 Jun 2019 23:27:05 -0300
Message-Id: <6ee88eacdbb21e79bcd7a418ffc84373edb91c9c.1560045490.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560045490.git.mchehab+samsung@kernel.org>
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Convert kdump documentation to ReST and add it to the
user faced manual, as the documents are mainly focused on
sysadmins that would be enabling kdump.

Note: the vmcoreinfo.rst has one very long title on one of its
sub-sections:

	PG_lru|PG_private|PG_swapcache|PG_swapbacked|PG_slab|PG_hwpoision|PG_head_mask|PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)

I opted to break this one, into two entries with the same content,
in order to make it easier to display after being parsed in html and PDF.

The conversion is actually:
  - add blank lines and identation in order to identify paragraphs;
  - fix tables markups;
  - add some lists markups;
  - mark literal blocks;
  - adjust title markups.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/admin-guide/bug-hunting.rst     |   2 +-
 .../admin-guide/kernel-parameters.txt         |   6 +-
 Documentation/kdump/index.rst                 |  21 +++
 Documentation/kdump/{kdump.txt => kdump.rst}  | 131 +++++++++++-------
 .../kdump/{vmcoreinfo.txt => vmcoreinfo.rst}  |  59 ++++----
 .../powerpc/firmware-assisted-dump.txt        |   2 +-
 .../translations/zh_CN/oops-tracing.txt       |   2 +-
 Documentation/watchdog/hpwdt.txt              |   2 +-
 arch/arm/Kconfig                              |   2 +-
 arch/arm64/Kconfig                            |   2 +-
 arch/sh/Kconfig                               |   2 +-
 arch/x86/Kconfig                              |   4 +-
 12 files changed, 137 insertions(+), 98 deletions(-)
 create mode 100644 Documentation/kdump/index.rst
 rename Documentation/kdump/{kdump.txt => kdump.rst} (91%)
 rename Documentation/kdump/{vmcoreinfo.txt => vmcoreinfo.rst} (95%)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index f278b289e260..b761aa2a51d2 100644
--- a/Documentation/admin-guide/bug-hunting.rst
+++ b/Documentation/admin-guide/bug-hunting.rst
@@ -90,7 +90,7 @@ the disk is not available then you have three options:
     run a null modem to a second machine and capture the output there
     using your favourite communication program.  Minicom works well.
 
-(3) Use Kdump (see Documentation/kdump/kdump.txt),
+(3) Use Kdump (see Documentation/kdump/kdump.rst),
     extract the kernel ring buffer from old memory with using dmesg
     gdbmacro in Documentation/kdump/gdbmacros.txt.
 
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e4544f0335e3..9789328f5e9d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -708,14 +708,14 @@
 			[KNL, x86_64] select a region under 4G first, and
 			fall back to reserve region above 4G when '@offset'
 			hasn't been specified.
-			See Documentation/kdump/kdump.txt for further details.
+			See Documentation/kdump/kdump.rst for further details.
 
 	crashkernel=range1:size1[,range2:size2,...][@offset]
 			[KNL] Same as above, but depends on the memory
 			in the running system. The syntax of range is
 			start-[end] where start and end are both
 			a memory unit (amount[KMG]). See also
-			Documentation/kdump/kdump.txt for an example.
+			Documentation/kdump/kdump.rst for an example.
 
 	crashkernel=size[KMG],high
 			[KNL, x86_64] range could be above 4G. Allow kernel
@@ -1207,7 +1207,7 @@
 			Specifies physical address of start of kernel core
 			image elf header and optionally the size. Generally
 			kexec loader will pass this option to capture kernel.
-			See Documentation/kdump/kdump.txt for details.
+			See Documentation/kdump/kdump.rst for details.
 
 	enable_mtrr_cleanup [X86]
 			The kernel tries to adjust MTRR layout from continuous
diff --git a/Documentation/kdump/index.rst b/Documentation/kdump/index.rst
new file mode 100644
index 000000000000..2b17fcf6867a
--- /dev/null
+++ b/Documentation/kdump/index.rst
@@ -0,0 +1,21 @@
+:orphan:
+
+================================================================
+Documentation for Kdump - The kexec-based Crash Dumping Solution
+================================================================
+
+This document includes overview, setup and installation, and analysis
+information.
+
+.. toctree::
+    :maxdepth: 1
+
+    kdump
+    vmcoreinfo
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/kdump/kdump.txt b/Documentation/kdump/kdump.rst
similarity index 91%
rename from Documentation/kdump/kdump.txt
rename to Documentation/kdump/kdump.rst
index 3162eeb8c262..ac7e131d2935 100644
--- a/Documentation/kdump/kdump.txt
+++ b/Documentation/kdump/kdump.rst
@@ -71,9 +71,8 @@ This is a symlink to the latest version.
 
 The latest kexec-tools git tree is available at:
 
-git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git
-and
-http://www.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git
+- git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git
+- http://www.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git
 
 There is also a gitweb interface available at
 http://www.kernel.org/git/?p=utils/kernel/kexec/kexec-tools.git
@@ -81,25 +80,25 @@ http://www.kernel.org/git/?p=utils/kernel/kexec/kexec-tools.git
 More information about kexec-tools can be found at
 http://horms.net/projects/kexec/
 
-3) Unpack the tarball with the tar command, as follows:
+3) Unpack the tarball with the tar command, as follows::
 
-   tar xvpzf kexec-tools.tar.gz
+	tar xvpzf kexec-tools.tar.gz
 
-4) Change to the kexec-tools directory, as follows:
+4) Change to the kexec-tools directory, as follows::
 
-   cd kexec-tools-VERSION
+	cd kexec-tools-VERSION
 
-5) Configure the package, as follows:
+5) Configure the package, as follows::
 
-   ./configure
+	./configure
 
-6) Compile the package, as follows:
+6) Compile the package, as follows::
 
-   make
+	make
 
-7) Install the package, as follows:
+7) Install the package, as follows::
 
-   make install
+	make install
 
 
 Build the system and dump-capture kernels
@@ -126,25 +125,25 @@ dump-capture kernels for enabling kdump support.
 System kernel config options
 ----------------------------
 
-1) Enable "kexec system call" in "Processor type and features."
+1) Enable "kexec system call" in "Processor type and features."::
 
-   CONFIG_KEXEC=y
+	CONFIG_KEXEC=y
 
 2) Enable "sysfs file system support" in "Filesystem" -> "Pseudo
-   filesystems." This is usually enabled by default.
+   filesystems." This is usually enabled by default::
 
-   CONFIG_SYSFS=y
+	CONFIG_SYSFS=y
 
    Note that "sysfs file system support" might not appear in the "Pseudo
    filesystems" menu if "Configure standard kernel features (for small
    systems)" is not enabled in "General Setup." In this case, check the
-   .config file itself to ensure that sysfs is turned on, as follows:
+   .config file itself to ensure that sysfs is turned on, as follows::
 
-   grep 'CONFIG_SYSFS' .config
+	grep 'CONFIG_SYSFS' .config
 
-3) Enable "Compile the kernel with debug info" in "Kernel hacking."
+3) Enable "Compile the kernel with debug info" in "Kernel hacking."::
 
-   CONFIG_DEBUG_INFO=Y
+	CONFIG_DEBUG_INFO=Y
 
    This causes the kernel to be built with debug symbols. The dump
    analysis tools require a vmlinux with debug symbols in order to read
@@ -154,29 +153,32 @@ Dump-capture kernel config options (Arch Independent)
 -----------------------------------------------------
 
 1) Enable "kernel crash dumps" support under "Processor type and
-   features":
+   features"::
 
-   CONFIG_CRASH_DUMP=y
+	CONFIG_CRASH_DUMP=y
 
-2) Enable "/proc/vmcore support" under "Filesystems" -> "Pseudo filesystems".
+2) Enable "/proc/vmcore support" under "Filesystems" -> "Pseudo filesystems"::
+
+	CONFIG_PROC_VMCORE=y
 
-   CONFIG_PROC_VMCORE=y
    (CONFIG_PROC_VMCORE is set by default when CONFIG_CRASH_DUMP is selected.)
 
 Dump-capture kernel config options (Arch Dependent, i386 and x86_64)
 --------------------------------------------------------------------
 
 1) On i386, enable high memory support under "Processor type and
-   features":
+   features"::
 
-   CONFIG_HIGHMEM64G=y
-   or
-   CONFIG_HIGHMEM4G
+	CONFIG_HIGHMEM64G=y
+
+   or::
+
+	CONFIG_HIGHMEM4G
 
 2) On i386 and x86_64, disable symmetric multi-processing support
-   under "Processor type and features":
+   under "Processor type and features"::
 
-   CONFIG_SMP=n
+	CONFIG_SMP=n
 
    (If CONFIG_SMP=y, then specify maxcpus=1 on the kernel command line
    when loading the dump-capture kernel, see section "Load the Dump-capture
@@ -184,9 +186,9 @@ Dump-capture kernel config options (Arch Dependent, i386 and x86_64)
 
 3) If one wants to build and use a relocatable kernel,
    Enable "Build a relocatable kernel" support under "Processor type and
-   features"
+   features"::
 
-   CONFIG_RELOCATABLE=y
+	CONFIG_RELOCATABLE=y
 
 4) Use a suitable value for "Physical address where the kernel is
    loaded" (under "Processor type and features"). This only appears when
@@ -211,13 +213,13 @@ Dump-capture kernel config options (Arch Dependent, i386 and x86_64)
 Dump-capture kernel config options (Arch Dependent, ppc64)
 ----------------------------------------------------------
 
-1) Enable "Build a kdump crash kernel" support under "Kernel" options:
+1) Enable "Build a kdump crash kernel" support under "Kernel" options::
 
-   CONFIG_CRASH_DUMP=y
+	CONFIG_CRASH_DUMP=y
 
-2)   Enable "Build a relocatable kernel" support
+2)   Enable "Build a relocatable kernel" support::
 
-   CONFIG_RELOCATABLE=y
+	CONFIG_RELOCATABLE=y
 
    Make and install the kernel and its modules.
 
@@ -231,11 +233,13 @@ Dump-capture kernel config options (Arch Dependent, ia64)
 
   The crashkernel region can be automatically placed by the system
   kernel at run time. This is done by specifying the base address as 0,
-  or omitting it all together.
+  or omitting it all together::
 
-  crashkernel=256M@0
-  or
-  crashkernel=256M
+	crashkernel=256M@0
+
+  or::
+
+	crashkernel=256M
 
   If the start address is specified, note that the start address of the
   kernel will be aligned to 64Mb, so if the start address is not then
@@ -245,9 +249,9 @@ Dump-capture kernel config options (Arch Dependent, arm)
 ----------------------------------------------------------
 
 -   To use a relocatable kernel,
-    Enable "AUTO_ZRELADDR" support under "Boot" options:
+    Enable "AUTO_ZRELADDR" support under "Boot" options::
 
-    AUTO_ZRELADDR=y
+	AUTO_ZRELADDR=y
 
 Dump-capture kernel config options (Arch Dependent, arm64)
 ----------------------------------------------------------
@@ -265,12 +269,12 @@ on the value of System RAM -- that's mostly for distributors that pre-setup
 the kernel command line to avoid a unbootable system after some memory has
 been removed from the machine.
 
-The syntax is:
+The syntax is::
 
     crashkernel=<range1>:<size1>[,<range2>:<size2>,...][@offset]
     range=start-[end]
 
-For example:
+For example::
 
     crashkernel=512M-2G:64M,2G-:128M
 
@@ -326,35 +330,46 @@ can choose to load the uncompressed vmlinux or compressed bzImage/vmlinuz
 of dump-capture kernel. Following is the summary.
 
 For i386 and x86_64:
+
 	- Use vmlinux if kernel is not relocatable.
 	- Use bzImage/vmlinuz if kernel is relocatable.
+
 For ppc64:
+
 	- Use vmlinux
+
 For ia64:
+
 	- Use vmlinux or vmlinuz.gz
+
 For s390x:
+
 	- Use image or bzImage
+
 For arm:
+
 	- Use zImage
+
 For arm64:
+
 	- Use vmlinux or Image
 
 If you are using an uncompressed vmlinux image then use following command
-to load dump-capture kernel.
+to load dump-capture kernel::
 
    kexec -p <dump-capture-kernel-vmlinux-image> \
    --initrd=<initrd-for-dump-capture-kernel> --args-linux \
    --append="root=<root-dev> <arch-specific-options>"
 
 If you are using a compressed bzImage/vmlinuz, then use following command
-to load dump-capture kernel.
+to load dump-capture kernel::
 
    kexec -p <dump-capture-kernel-bzImage> \
    --initrd=<initrd-for-dump-capture-kernel> \
    --append="root=<root-dev> <arch-specific-options>"
 
 If you are using a compressed zImage, then use following command
-to load dump-capture kernel.
+to load dump-capture kernel::
 
    kexec --type zImage -p <dump-capture-kernel-bzImage> \
    --initrd=<initrd-for-dump-capture-kernel> \
@@ -362,7 +377,7 @@ to load dump-capture kernel.
    --append="root=<root-dev> <arch-specific-options>"
 
 If you are using an uncompressed Image, then use following command
-to load dump-capture kernel.
+to load dump-capture kernel::
 
    kexec -p <dump-capture-kernel-Image> \
    --initrd=<initrd-for-dump-capture-kernel> \
@@ -376,18 +391,23 @@ Following are the arch specific command line options to be used while
 loading dump-capture kernel.
 
 For i386, x86_64 and ia64:
+
 	"1 irqpoll maxcpus=1 reset_devices"
 
 For ppc64:
+
 	"1 maxcpus=1 noirqdistrib reset_devices"
 
 For s390x:
+
 	"1 maxcpus=1 cgroup_disable=memory"
 
 For arm:
+
 	"1 maxcpus=1 reset_devices"
 
 For arm64:
+
 	"1 maxcpus=1 reset_devices"
 
 Notes on loading the dump-capture kernel:
@@ -464,7 +484,7 @@ Write Out the Dump File
 =======================
 
 After the dump-capture kernel is booted, write out the dump file with
-the following command:
+the following command::
 
    cp /proc/vmcore <dump-file>
 
@@ -476,7 +496,7 @@ Before analyzing the dump image, you should reboot into a stable kernel.
 
 You can do limited analysis using GDB on the dump file copied out of
 /proc/vmcore. Use the debug vmlinux built with -g and run the following
-command:
+command::
 
    gdb vmlinux <dump-file>
 
@@ -504,6 +524,11 @@ to achieve the same behaviour.
 Contact
 =======
 
-Vivek Goyal (vgoyal@redhat.com)
-Maneesh Soni (maneesh@in.ibm.com)
+- Vivek Goyal (vgoyal@redhat.com)
+- Maneesh Soni (maneesh@in.ibm.com)
 
+GDB macros
+==========
+
+.. include:: gdbmacros.txt
+   :literal:
diff --git a/Documentation/kdump/vmcoreinfo.txt b/Documentation/kdump/vmcoreinfo.rst
similarity index 95%
rename from Documentation/kdump/vmcoreinfo.txt
rename to Documentation/kdump/vmcoreinfo.rst
index bb94a4bd597a..007a6b86e0ee 100644
--- a/Documentation/kdump/vmcoreinfo.txt
+++ b/Documentation/kdump/vmcoreinfo.rst
@@ -1,8 +1,7 @@
-================================================================
-			VMCOREINFO
-================================================================
+==========
+VMCOREINFO
+==========
 
-===========
 What is it?
 ===========
 
@@ -12,7 +11,6 @@ values, field offsets, etc. These data are packed into an ELF note
 section and used by user-space tools like crash and makedumpfile to
 analyze a kernel's memory layout.
 
-================
 Common variables
 ================
 
@@ -49,7 +47,7 @@ in a system, one bit position per node number. Used to keep track of
 which nodes are in the system and online.
 
 swapper_pg_dir
--------------
+--------------
 
 The global page directory pointer of the kernel. Used to translate
 virtual to physical addresses.
@@ -132,16 +130,14 @@ nodemask_t
 The size of a nodemask_t type. Used to compute the number of online
 nodes.
 
-(page, flags|_refcount|mapping|lru|_mapcount|private|compound_dtor|
-       compound_order|compound_head)
--------------------------------------------------------------------
+(page, flags|_refcount|mapping|lru|_mapcount|private|compound_dtor|compound_order|compound_head)
+-------------------------------------------------------------------------------------------------
 
 User-space tools compute their values based on the offset of these
 variables. The variables are used when excluding unnecessary pages.
 
-(pglist_data, node_zones|nr_zones|node_mem_map|node_start_pfn|node_
-              spanned_pages|node_id)
--------------------------------------------------------------------
+(pglist_data, node_zones|nr_zones|node_mem_map|node_start_pfn|node_spanned_pages|node_id)
+-----------------------------------------------------------------------------------------
 
 On NUMA machines, each NUMA node has a pg_data_t to describe its memory
 layout. On UMA machines there is a single pglist_data which describes the
@@ -245,21 +241,25 @@ NR_FREE_PAGES
 On linux-2.6.21 or later, the number of free pages is in
 vm_stat[NR_FREE_PAGES]. Used to get the number of free pages.
 
-PG_lru|PG_private|PG_swapcache|PG_swapbacked|PG_slab|PG_hwpoision
-|PG_head_mask|PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)
-|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)
------------------------------------------------------------------
+PG_lru|PG_private|PG_swapcache|PG_swapbacked|PG_slab|PG_hwpoision|PG_head_mask
+------------------------------------------------------------------------------
 
 Page attributes. These flags are used to filter various unnecessary for
 dumping pages.
 
+PAGE_BUDDY_MAPCOUNT_VALUE(~PG_buddy)|PAGE_OFFLINE_MAPCOUNT_VALUE(~PG_offline)
+-----------------------------------------------------------------------------
+
+More page attributes. These flags are used to filter various unnecessary for
+dumping pages.
+
+
 HUGETLB_PAGE_DTOR
 -----------------
 
 The HUGETLB_PAGE_DTOR flag denotes hugetlbfs pages. Makedumpfile
 excludes these pages.
 
-======
 x86_64
 ======
 
@@ -318,12 +318,12 @@ address.
 Currently, sme_mask stores the value of the C-bit position. If needed,
 additional SME-relevant info can be placed in that variable.
 
-For example:
-[ misc	        ][ enc bit  ][ other misc SME info       ]
-0000_0000_0000_0000_1000_0000_0000_0000_0000_0000_..._0000
-63   59   55   51   47   43   39   35   31   27   ... 3
+For example::
+
+  [ misc	        ][ enc bit  ][ other misc SME info       ]
+  0000_0000_0000_0000_1000_0000_0000_0000_0000_0000_..._0000
+  63   59   55   51   47   43   39   35   31   27   ... 3
 
-======
 x86_32
 ======
 
@@ -335,7 +335,6 @@ of a higher page table lookup overhead, and also consumes more page
 table space per process. Used to check whether PAE was enabled in the
 crash kernel when converting virtual addresses to physical addresses.
 
-====
 ia64
 ====
 
@@ -366,7 +365,6 @@ PGTABLE_3|PGTABLE_4
 User-space tools need to know whether the crash kernel was in 3-level or
 4-level paging mode. Used to distinguish the page table.
 
-=====
 ARM64
 =====
 
@@ -395,9 +393,8 @@ KERNELOFFSET
 The kernel randomization offset. Used to compute the page offset. If
 KASLR is disabled, this value is zero.
 
-====
 arm
-====
+===
 
 ARM_LPAE
 --------
@@ -405,12 +402,11 @@ ARM_LPAE
 It indicates whether the crash kernel supports large physical address
 extensions. Used to translate virtual to physical addresses.
 
-====
 s390
 ====
 
 lowcore_ptr
-----------
+-----------
 
 An array with a pointer to the lowcore of every CPU. Used to print the
 psw and all registers information.
@@ -425,7 +421,6 @@ Used to get the vmalloc_start address from the high_memory symbol.
 
 The maximum number of CPUs.
 
-=======
 powerpc
 =======
 
@@ -460,9 +455,8 @@ Page size definitions, i.e. 4k, 64k, or 16M.
 
 Used to make vtop translations.
 
-vmemmap_backing|(vmemmap_backing, list)|(vmemmap_backing, phys)|
-(vmemmap_backing, virt_addr)
-----------------------------------------------------------------
+vmemmap_backing|(vmemmap_backing, list)|(vmemmap_backing, phys)|(vmemmap_backing, virt_addr)
+--------------------------------------------------------------------------------------------
 
 The vmemmap virtual address space management does not have a traditional
 page table to track which virtual struct pages are backed by a physical
@@ -480,7 +474,6 @@ member.
 
 Used in vtop translations.
 
-==
 sh
 ==
 
diff --git a/Documentation/powerpc/firmware-assisted-dump.txt b/Documentation/powerpc/firmware-assisted-dump.txt
index 18c5feef2577..0c41d6d463f3 100644
--- a/Documentation/powerpc/firmware-assisted-dump.txt
+++ b/Documentation/powerpc/firmware-assisted-dump.txt
@@ -59,7 +59,7 @@ as follows:
          the default calculated size. Use this option if default
          boot memory size is not sufficient for second kernel to
          boot successfully. For syntax of crashkernel= parameter,
-         refer to Documentation/kdump/kdump.txt. If any offset is
+         refer to Documentation/kdump/kdump.rst. If any offset is
          provided in crashkernel= parameter, it will be ignored
          as fadump uses a predefined offset to reserve memory
          for boot memory dump preservation in case of a crash.
diff --git a/Documentation/translations/zh_CN/oops-tracing.txt b/Documentation/translations/zh_CN/oops-tracing.txt
index 93fa061cf9e4..368ddd05b304 100644
--- a/Documentation/translations/zh_CN/oops-tracing.txt
+++ b/Documentation/translations/zh_CN/oops-tracing.txt
@@ -53,7 +53,7 @@ cat /proc/kmsg > file， 然而你必须介入中止传输， kmsg是一个“
 （2）用串口终端启动（请参看Documentation/admin-guide/serial-console.rst），运行一个null
 modem到另一台机器并用你喜欢的通讯工具获取输出。Minicom工作地很好。
 
-（3）使用Kdump（请参看Documentation/kdump/kdump.txt），
+（3）使用Kdump（请参看Documentation/kdump/kdump.rst），
 使用在Documentation/kdump/gdbmacros.txt中定义的dmesg gdb宏，从旧的内存中提取内核
 环形缓冲区。
 
diff --git a/Documentation/watchdog/hpwdt.txt b/Documentation/watchdog/hpwdt.txt
index 55df692c5595..aaa9e4b4bdcd 100644
--- a/Documentation/watchdog/hpwdt.txt
+++ b/Documentation/watchdog/hpwdt.txt
@@ -51,7 +51,7 @@ Last reviewed: 08/20/2018
  and loop forever.  This is generally not what a watchdog user wants.
 
  For those wishing to learn more please see:
-	Documentation/kdump/kdump.txt
+	Documentation/kdump/kdump.rst
 	Documentation/admin-guide/kernel-parameters.txt (panic=)
 	Your Linux Distribution specific documentation.
 
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 204cbc6bf234..af58d31ee4e1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2006,7 +2006,7 @@ config CRASH_DUMP
 	  kdump/kexec. The crash dump kernel must be compiled to a
 	  memory address not used by the main kernel
 
-	  For more details see Documentation/kdump/kdump.txt
+	  For more details see Documentation/kdump/kdump.rst
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address"
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c2afcea9b19b..ac33b4bd1624 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -996,7 +996,7 @@ config CRASH_DUMP
 	  reserved region and then later executed after a crash by
 	  kdump/kexec.
 
-	  For more details see Documentation/kdump/kdump.txt
+	  For more details see Documentation/kdump/kdump.rst
 
 config XEN_DOM0
 	def_bool y
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index b77f512bb176..ce1a28654507 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -623,7 +623,7 @@ config CRASH_DUMP
 	  to a memory address not used by the main kernel using
 	  PHYSICAL_START.
 
-	  For more details see Documentation/kdump/kdump.txt
+	  For more details see Documentation/kdump/kdump.rst
 
 config KEXEC_JUMP
 	bool "kexec jump (EXPERIMENTAL)"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index da5e0c34c239..2057254c6c8a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2037,7 +2037,7 @@ config CRASH_DUMP
 	  to a memory address not used by the main kernel or BIOS using
 	  PHYSICAL_START, or it must be built as a relocatable image
 	  (CONFIG_RELOCATABLE=y).
-	  For more details see Documentation/kdump/kdump.txt
+	  For more details see Documentation/kdump/kdump.rst
 
 config KEXEC_JUMP
 	bool "kexec jump"
@@ -2074,7 +2074,7 @@ config PHYSICAL_START
 	  the reserved region.  In other words, it can be set based on
 	  the "X" value as specified in the "crashkernel=YM@XM"
 	  command line boot parameter passed to the panic-ed
-	  kernel. Please take a look at Documentation/kdump/kdump.txt
+	  kernel. Please take a look at Documentation/kdump/kdump.rst
 	  for more details about crash dumps.
 
 	  Usage of bzImage for capturing the crash dump is recommended as
-- 
2.21.0

