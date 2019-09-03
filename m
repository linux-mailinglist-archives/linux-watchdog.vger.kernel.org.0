Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD84A6C57
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2019 17:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729912AbfICPHw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Sep 2019 11:07:52 -0400
Received: from mail-yb1-f202.google.com ([209.85.219.202]:50560 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729906AbfICPHv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Sep 2019 11:07:51 -0400
Received: by mail-yb1-f202.google.com with SMTP id p80so14160700ybc.17
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Sep 2019 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=PXDMDCBfc2xecCOj15IRjy6gG7tFhf1boblcojHoIqc=;
        b=OehgC/QpGVW5WHRtYYFEBPQjfIK+N42Odb/gz465atQlpSIk1lvdVNY2fEt5bT5y/i
         ncnP5Uzjks7oK05vFxfW7R4g/0AHAm6ZfhdpT9wXG6QB9n3Z0n3y2ZjV4jnYLOuSPB+V
         X3WZHM6Z6AEL0iTYXZ2q8rc3cx61dR3VH7hA6VsD64SSclKjEvBcfHz00aeGDU4u9Wg0
         kO46LRoLWUpD93faDcaTwE3uYYBlaEGBRH9xLFbyVy1nOz7+8Ec5oTMVlw5Xr2i9V05w
         0afYMRX4Wu/UypBQBMVOR/dlbL/g92c6Fkmc05h9ztxwfejrJ3k5dAKR3nVZAllXy1E2
         4rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=PXDMDCBfc2xecCOj15IRjy6gG7tFhf1boblcojHoIqc=;
        b=G1Bcj+ArIC4kEI6skXTwG8J7boUonVHtXn9HJwPj/KSMVGnlh1kY6yCJoXJLUg8R0P
         ibKerzlynNrVH/EYGSP8aOzt2+FWcLZs/98wBeUKlCxBxUNJxAt2Kw8rNTvFMjIrRO0z
         6CSKRai1E3FzOFldnIkvdJDVrXcU/4HA6Ji3koyAjBocJEI5qrFyc1URzltshHnzt7Lm
         lyW1xCHkBhifowq1IwRIz+uH2jpmhkT1zud5kswWABG9WHAwudq0tjF+clZ8HNkMcDt8
         Lzo3sJ5ruYvMRH1rN/dfi+Jw8YFreUnCrNi4dVwlT0r4UeylrASJP52g7G2f+BSEDdUV
         ANeg==
X-Gm-Message-State: APjAAAUrXcsvKggx2bms4mTFguCMvydGBb4AVsWZTkXEPJDsBlGhESYP
        tT8rYU0pdKL/5i/2SC47AqzF3mDFPsHu+A==
X-Google-Smtp-Source: APXvYqylPWFHf2hpNQhFQu2/5vQMLUmJtcBW5//m7WkaHo/DcTGkmE7DrAleumJF4actayeB+yWtnVWCxpa+8g==
X-Received: by 2002:a25:6191:: with SMTP id v139mr25130367ybb.396.1567523270130;
 Tue, 03 Sep 2019 08:07:50 -0700 (PDT)
Date:   Tue,  3 Sep 2019 16:06:35 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-10-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v4 09/12] docs: Add documentation for Symbol Namespaces
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Describe using Symbol Namespaces from a perspective of a user. I.e.
module authors or subsystem maintainers.

Signed-off-by: Matthias Maennich <maennich@google.com>
---
 Documentation/kbuild/namespaces.rst      | 154 +++++++++++++++++++++++
 Documentation/kernel-hacking/hacking.rst |  18 +++
 2 files changed, 172 insertions(+)
 create mode 100644 Documentation/kbuild/namespaces.rst

diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/kbuild/namespaces.rst
new file mode 100644
index 000000000000..982ed7b568ac
--- /dev/null
+++ b/Documentation/kbuild/namespaces.rst
@@ -0,0 +1,154 @@
+=================
+Symbol Namespaces
+=================
+
+The following document describes how to use Symbol Namespaces to structure the
+export surface of in-kernel symbols exported through the family of
+EXPORT_SYMBOL() macros.
+
+.. Table of Contents
+
+	=== 1 Introduction
+	=== 2 How to define Symbol Namespaces
+	   --- 2.1 Using the EXPORT_SYMBOL macros
+	   --- 2.2 Using the DEFAULT_SYMBOL_NAMESPACE define
+	=== 3 How to use Symbols exported in Namespaces
+	=== 4 Loading Modules that use namespaced Symbols
+	=== 5 Automatically creating MODULE_IMPORT_NS statements
+
+1. Introduction
+===============
+
+Symbol Namespaces have been introduced as a means to structure the export
+surface of the in-kernel API. It allows subsystem maintainers to partition
+their exported symbols into separate namespaces. That is useful for
+documentation purposes (think of the SUBSYSTEM_DEBUG namespace) as well as for
+limiting the availability of a set of symbols for use in other parts of the
+kernel. As of today, modules that make use of symbols exported into namespaces,
+are required to import the namespace. Otherwise the kernel will, depending on
+its configuration, reject loading the module or warn about a missing import.
+
+2. How to define Symbol Namespaces
+==================================
+
+Symbols can be exported into namespace using different methods. All of them are
+changing the way EXPORT_SYMBOL and friends are instrumented to create ksymtab
+entries.
+
+2.1 Using the EXPORT_SYMBOL macros
+==================================
+
+In addition to the macros EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL(), that allow
+exporting of kernel symbols to the kernel symbol table, variants of these are
+available to export symbols into a certain namespace: EXPORT_SYMBOL_NS() and
+EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the namespace.
+Please note that due to macro expansion that argument needs to be a
+preprocessor symbol. E.g. to export the symbol `usb_stor_suspend` into the
+namespace `USB_STORAGE`, use::
+
+	EXPORT_SYMBOL_NS(usb_stor_suspend, USB_STORAGE);
+
+The corresponding ksymtab entry struct `kernel_symbol` will have the member
+`namespace` set accordingly. A symbol that is exported without a namespace will
+refer to `NULL`. There is no default namespace if none is defined. `modpost`
+and kernel/module.c make use the namespace at build time or module load time,
+respectively.
+
+2.2 Using the DEFAULT_SYMBOL_NAMESPACE define
+=============================================
+
+Defining namespaces for all symbols of a subsystem can be very verbose and may
+become hard to maintain. Therefore a default define (DEFAULT_SYMBOL_NAMESPACE)
+is been provided, that, if set, will become the default for all EXPORT_SYMBOL()
+and EXPORT_SYMBOL_GPL() macro expansions that do not specify a namespace.
+
+There are multiple ways of specifying this define and it depends on the
+subsystem and the maintainer's preference, which one to use. The first option
+is to define the default namespace in the `Makefile` of the subsystem. E.g. to
+export all symbols defined in usb-common into the namespace USB_COMMON, add a
+line like this to drivers/usb/common/Makefile::
+
+	ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_COMMON
+
+That will affect all EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL() statements. A
+symbol exported with EXPORT_SYMBOL_NS() while this definition is present, will
+still be exported into the namespace that is passed as the namespace argument
+as this argument has preference over a default symbol namespace.
+
+A second option to define the default namespace is directly in the compilation
+unit as preprocessor statement. The above example would then read::
+
+	#undef  DEFAULT_SYMBOL_NAMESPACE
+	#define DEFAULT_SYMBOL_NAMESPACE USB_COMMON
+
+within the corresponding compilation unit before any EXPORT_SYMBOL macro is
+used.
+
+3. How to use Symbols exported in Namespaces
+============================================
+
+In order to use symbols that are exported into namespaces, kernel modules need
+to explicitly import these namespaces. Otherwise the kernel might reject to
+load the module. The module code is required to use the macro MODULE_IMPORT_NS
+for the namespaces it uses symbols from. E.g. a module using the
+usb_stor_suspend symbol from above, needs to import the namespace USB_STORAGE
+using a statement like::
+
+	MODULE_IMPORT_NS(USB_STORAGE);
+
+This will create a `modinfo` tag in the module for each imported namespace.
+This has the side effect, that the imported namespaces of a module can be
+inspected with modinfo::
+
+	$ modinfo drivers/usb/storage/ums-karma.ko
+	[...]
+	import_ns:      USB_STORAGE
+	[...]
+
+
+It is advisable to add the MODULE_IMPORT_NS() statement close to other module
+metadata definitions like MODULE_AUTHOR() or MODULE_LICENSE(). Refer to section
+5. for a way to create missing import statements automatically.
+
+4. Loading Modules that use namespaced Symbols
+==============================================
+
+At module loading time (e.g. `insmod`), the kernel will check each symbol
+referenced from the module for its availability and whether the namespace it
+might be exported to has been imported by the module. The default behaviour of
+the kernel is to reject loading modules that don't specify sufficient imports.
+An error will be logged and loading will be failed with EINVAL. In order to
+allow loading of modules that don't satisfy this precondition, a configuration
+option is available: Setting MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y will
+enable loading regardless, but will emit a warning.
+
+5. Automatically creating MODULE_IMPORT_NS statements
+=====================================================
+
+Missing namespaces imports can easily be detected at build time. In fact,
+modpost will emit a warning if a module uses a symbol from a namespace
+without importing it.
+MODULE_IMPORT_NS() statements will usually be added at a definite location
+(along with other module meta data). To make the life of module authors (and
+subsystem maintainers) easier, a script and make target is available to fixup
+missing imports. Fixing missing imports can be done with::
+
+	$ make nsdeps
+
+A typical scenario for module authors would be::
+
+	- write code that depends on a symbol from a not imported namespace
+	- `make`
+	- notice the warning of modpost telling about a missing import
+	- run `make nsdeps` to add the import to the correct code location
+
+For subsystem maintainers introducing a namespace, the steps are very similar.
+Again, `make nsdeps` will eventually add the missing namespace imports for
+in-tree modules::
+
+	- move or add symbols to a namespace (e.g. with EXPORT_SYMBOL_NS())
+	- `make` (preferably with an allmodconfig to cover all in-kernel
+	  modules)
+	- notice the warning of modpost telling about a missing import
+	- run `make nsdeps` to add the import to the correct code location
+
diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 5891a701a159..a3ddb213a5e1 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -594,6 +594,24 @@ internal implementation issue, and not really an interface. Some
 maintainers and developers may however require EXPORT_SYMBOL_GPL()
 when adding any new APIs or functionality.
 
+:c:func:`EXPORT_SYMBOL_NS()`
+----------------------------
+
+Defined in ``include/linux/export.h``
+
+This is the variant of `EXPORT_SYMBOL()` that allows specifying a symbol
+namespace. Symbol Namespaces are documented in
+``Documentation/kbuild/namespaces.rst``.
+
+:c:func:`EXPORT_SYMBOL_NS_GPL()`
+--------------------------------
+
+Defined in ``include/linux/export.h``
+
+This is the variant of `EXPORT_SYMBOL_GPL()` that allows specifying a symbol
+namespace. Symbol Namespaces are documented in
+``Documentation/kbuild/namespaces.rst``.
+
 Routines and Conventions
 ========================
 
-- 
2.23.0.187.g17f5b7556c-goog

