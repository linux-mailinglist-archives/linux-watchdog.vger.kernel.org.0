Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC0259B17
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Jun 2019 14:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfF1MbH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Jun 2019 08:31:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39868 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727188AbfF1Mas (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Jun 2019 08:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HNTqLR7YTpiCGsfcYzZ23NBv7IuWobNYT8gokGCe3wo=; b=jOK9yEioolCXopD1Wq607Z9fR/
        HdMohOTqYZUqXwti9GCkq6A/d0XRGI45pI0UuIi32KZf8+8qIJi/BsB/AXDe18qx+EYe0Kb3wSpax
        BC4JBaEQFMDtp2rNHNAnVRNUlknvpaqomnsjSBYvbRksF4hQ8rk5FWq7VHR0xaVHdGiXcLi1mhWOL
        7W1t49Fu8buHnGzEJsAmMVi6F8H7jPn2lzXVU6ILBj0+0XL7flg8ydZvEIxgxJvmRKTD407ivUgCs
        DzquqTFZLZPqC91AwCHE5X0N6bEReQ7mAXvdb4/R1QTVyQNWjSXZTkOmieePIKqiGiHsO2c6fu0nx
        yzEbLWYg==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hgq1U-00055N-Fq; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hgq1S-0005SM-DP; Fri, 28 Jun 2019 09:30:34 -0300
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
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org
Subject: [PATCH 18/39] docs: admin-guide: add kdump documentation into it
Date:   Fri, 28 Jun 2019 09:30:11 -0300
Message-Id: <654e7591c044632c06257e0f069a52c0bb993554.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The Kdump documentation describes procedures with admins use
in order to solve issues on their systems.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/admin-guide/bug-hunting.rst            | 4 ++--
 Documentation/admin-guide/index.rst                  | 1 +
 Documentation/{ => admin-guide}/kdump/gdbmacros.txt  | 0
 Documentation/{ => admin-guide}/kdump/index.rst      | 1 -
 Documentation/{ => admin-guide}/kdump/kdump.rst      | 0
 Documentation/{ => admin-guide}/kdump/vmcoreinfo.rst | 0
 Documentation/admin-guide/kernel-parameters.txt      | 6 +++---
 Documentation/powerpc/firmware-assisted-dump.rst     | 2 +-
 Documentation/translations/zh_CN/oops-tracing.txt    | 4 ++--
 Documentation/watchdog/hpwdt.rst                     | 2 +-
 MAINTAINERS                                          | 2 +-
 arch/arm/Kconfig                                     | 2 +-
 arch/arm64/Kconfig                                   | 2 +-
 arch/sh/Kconfig                                      | 2 +-
 arch/x86/Kconfig                                     | 4 ++--
 15 files changed, 16 insertions(+), 16 deletions(-)
 rename Documentation/{ => admin-guide}/kdump/gdbmacros.txt (100%)
 rename Documentation/{ => admin-guide}/kdump/index.rst (97%)
 rename Documentation/{ => admin-guide}/kdump/kdump.rst (100%)
 rename Documentation/{ => admin-guide}/kdump/vmcoreinfo.rst (100%)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index b761aa2a51d2..44b8a4edd348 100644
--- a/Documentation/admin-guide/bug-hunting.rst
+++ b/Documentation/admin-guide/bug-hunting.rst
@@ -90,9 +90,9 @@ the disk is not available then you have three options:
     run a null modem to a second machine and capture the output there
     using your favourite communication program.  Minicom works well.
 
-(3) Use Kdump (see Documentation/kdump/kdump.rst),
+(3) Use Kdump (see Documentation/admin-guide/kdump/kdump.rst),
     extract the kernel ring buffer from old memory with using dmesg
-    gdbmacro in Documentation/kdump/gdbmacros.txt.
+    gdbmacro in Documentation/admin-guide/kdump/gdbmacros.txt.
 
 Finding the bug's location
 --------------------------
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 9899b78dbe50..65e821a03aca 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -39,6 +39,7 @@ problems and bugs in particular.
    ramoops
    dynamic-debug-howto
    init
+   kdump/index
    perf/index
 
 This is the beginning of a section with information of interest to
diff --git a/Documentation/kdump/gdbmacros.txt b/Documentation/admin-guide/kdump/gdbmacros.txt
similarity index 100%
rename from Documentation/kdump/gdbmacros.txt
rename to Documentation/admin-guide/kdump/gdbmacros.txt
diff --git a/Documentation/kdump/index.rst b/Documentation/admin-guide/kdump/index.rst
similarity index 97%
rename from Documentation/kdump/index.rst
rename to Documentation/admin-guide/kdump/index.rst
index 2b17fcf6867a..8e2ebd0383cd 100644
--- a/Documentation/kdump/index.rst
+++ b/Documentation/admin-guide/kdump/index.rst
@@ -1,4 +1,3 @@
-:orphan:
 
 ================================================================
 Documentation for Kdump - The kexec-based Crash Dumping Solution
diff --git a/Documentation/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
similarity index 100%
rename from Documentation/kdump/kdump.rst
rename to Documentation/admin-guide/kdump/kdump.rst
diff --git a/Documentation/kdump/vmcoreinfo.rst b/Documentation/admin-guide/kdump/vmcoreinfo.rst
similarity index 100%
rename from Documentation/kdump/vmcoreinfo.rst
rename to Documentation/admin-guide/kdump/vmcoreinfo.rst
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e38b96d061f4..9b535c0e22f3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -708,14 +708,14 @@
 			[KNL, x86_64] select a region under 4G first, and
 			fall back to reserve region above 4G when '@offset'
 			hasn't been specified.
-			See Documentation/kdump/kdump.rst for further details.
+			See Documentation/admin-guide/kdump/kdump.rst for further details.
 
 	crashkernel=range1:size1[,range2:size2,...][@offset]
 			[KNL] Same as above, but depends on the memory
 			in the running system. The syntax of range is
 			start-[end] where start and end are both
 			a memory unit (amount[KMG]). See also
-			Documentation/kdump/kdump.rst for an example.
+			Documentation/admin-guide/kdump/kdump.rst for an example.
 
 	crashkernel=size[KMG],high
 			[KNL, x86_64] range could be above 4G. Allow kernel
@@ -1207,7 +1207,7 @@
 			Specifies physical address of start of kernel core
 			image elf header and optionally the size. Generally
 			kexec loader will pass this option to capture kernel.
-			See Documentation/kdump/kdump.rst for details.
+			See Documentation/admin-guide/kdump/kdump.rst for details.
 
 	enable_mtrr_cleanup [X86]
 			The kernel tries to adjust MTRR layout from continuous
diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
index d7fa7c35dd12..9ca12830a48e 100644
--- a/Documentation/powerpc/firmware-assisted-dump.rst
+++ b/Documentation/powerpc/firmware-assisted-dump.rst
@@ -61,7 +61,7 @@ as follows:
          the default calculated size. Use this option if default
          boot memory size is not sufficient for second kernel to
          boot successfully. For syntax of crashkernel= parameter,
-         refer to Documentation/kdump/kdump.rst. If any offset is
+         refer to Documentation/admin-guide/kdump/kdump.rst. If any offset is
          provided in crashkernel= parameter, it will be ignored
          as fadump uses a predefined offset to reserve memory
          for boot memory dump preservation in case of a crash.
diff --git a/Documentation/translations/zh_CN/oops-tracing.txt b/Documentation/translations/zh_CN/oops-tracing.txt
index 368ddd05b304..c5f3bda7abcb 100644
--- a/Documentation/translations/zh_CN/oops-tracing.txt
+++ b/Documentation/translations/zh_CN/oops-tracing.txt
@@ -53,8 +53,8 @@ cat /proc/kmsg > file， 然而你必须介入中止传输， kmsg是一个“
 （2）用串口终端启动（请参看Documentation/admin-guide/serial-console.rst），运行一个null
 modem到另一台机器并用你喜欢的通讯工具获取输出。Minicom工作地很好。
 
-（3）使用Kdump（请参看Documentation/kdump/kdump.rst），
-使用在Documentation/kdump/gdbmacros.txt中定义的dmesg gdb宏，从旧的内存中提取内核
+（3）使用Kdump（请参看Documentation/admin-guide/kdump/kdump.rst），
+使用在Documentation/admin-guide/kdump/gdbmacros.txt中定义的dmesg gdb宏，从旧的内存中提取内核
 环形缓冲区。
 
 完整信息
diff --git a/Documentation/watchdog/hpwdt.rst b/Documentation/watchdog/hpwdt.rst
index 94a96371113e..49c647dba8aa 100644
--- a/Documentation/watchdog/hpwdt.rst
+++ b/Documentation/watchdog/hpwdt.rst
@@ -59,7 +59,7 @@ Last reviewed: 08/20/2018
  and loop forever.  This is generally not what a watchdog user wants.
 
  For those wishing to learn more please see:
-	Documentation/kdump/kdump.rst
+	Documentation/admin-guide/kdump/kdump.rst
 	Documentation/admin-guide/kernel-parameters.txt (panic=)
 	Your Linux Distribution specific documentation.
 
diff --git a/MAINTAINERS b/MAINTAINERS
index d35ff73f718a..4c622a19ab7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8622,7 +8622,7 @@ R:	Vivek Goyal <vgoyal@redhat.com>
 L:	kexec@lists.infradead.org
 W:	http://lse.sourceforge.net/kdump/
 S:	Maintained
-F:	Documentation/kdump/
+F:	Documentation/admin-guide/kdump/
 
 KEENE FM RADIO TRANSMITTER DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8bf8985ec667..d5bd4350fcbd 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -2025,7 +2025,7 @@ config CRASH_DUMP
 	  kdump/kexec. The crash dump kernel must be compiled to a
 	  memory address not used by the main kernel
 
-	  For more details see Documentation/kdump/kdump.rst
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address"
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index accb045997c6..e1ea69994e0f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -997,7 +997,7 @@ config CRASH_DUMP
 	  reserved region and then later executed after a crash by
 	  kdump/kexec.
 
-	  For more details see Documentation/kdump/kdump.rst
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config XEN_DOM0
 	def_bool y
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 31a7d12db705..c2858ac6a46a 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -626,7 +626,7 @@ config CRASH_DUMP
 	  to a memory address not used by the main kernel using
 	  PHYSICAL_START.
 
-	  For more details see Documentation/kdump/kdump.rst
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config KEXEC_JUMP
 	bool "kexec jump (EXPERIMENTAL)"
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index c9d59ca5e3ac..489fd833b980 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2057,7 +2057,7 @@ config CRASH_DUMP
 	  to a memory address not used by the main kernel or BIOS using
 	  PHYSICAL_START, or it must be built as a relocatable image
 	  (CONFIG_RELOCATABLE=y).
-	  For more details see Documentation/kdump/kdump.rst
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config KEXEC_JUMP
 	bool "kexec jump"
@@ -2094,7 +2094,7 @@ config PHYSICAL_START
 	  the reserved region.  In other words, it can be set based on
 	  the "X" value as specified in the "crashkernel=YM@XM"
 	  command line boot parameter passed to the panic-ed
-	  kernel. Please take a look at Documentation/kdump/kdump.rst
+	  kernel. Please take a look at Documentation/admin-guide/kdump/kdump.rst
 	  for more details about crash dumps.
 
 	  Usage of bzImage for capturing the crash dump is recommended as
-- 
2.21.0

