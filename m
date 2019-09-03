Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF2FA6C72
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2019 17:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbfICPHe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Sep 2019 11:07:34 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:46855 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729715AbfICPHd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Sep 2019 11:07:33 -0400
Received: by mail-qk1-f201.google.com with SMTP id n135so18814669qka.13
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Sep 2019 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6KFIwWWApjCQfX4bs8S0gCxREVnzqCf121iaZRShrCw=;
        b=Sq3vmIE3RRW8/0tzAryDYvO6evIP8eSEgKaTM+D/EjC8D0qfLDriKuTZA/b5mqtwJk
         aRdkKtHKuczfbACLOAhxwIgZDJ53o9A/E9TUG1Bdzg2HvN0R8BBESPo4N0f34P0+l5EK
         TPxw9a1/q8BY9TSSBPwb0hwdW3mRNp6EVLDyQPjU+ouRKTPeXVZ9jThW+buuKSLlKHcr
         fLPo01ryJYo6mpHGQwgLdWJaSgr0PrCEcJrMH+veMvbsHH+7LbxNNPYVKezLtFRE10fC
         hylPZTXDMuJm6WdUOphQ1A1BCgs+u5dp1SUgRp92vfjRUWx92yIdcTMBHFcC6esRqLRm
         /WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6KFIwWWApjCQfX4bs8S0gCxREVnzqCf121iaZRShrCw=;
        b=Zx5X18lp+RejJxeu+BjRju/l08WMkTx0Ulpt8nNBtaZ43C9gtLwOjmgrknK6u1fNyc
         aaLnL6SO/0v8/fNlgxFxARb3HtZujbiDuyaoZ7PiFRzjGgbq0Ag7de93eOxF5cycPVh3
         IzRWu3RwQol2VvGc+YgYU/awlqa5Xyh473iXMXLQWTj66Wme+Jfbj//OlXmWtcJgUkm1
         nbUUylulg1olItuDtWT6ZWHnb02eLpjSCinyoH2YbAJztXLqFWo1loB5eI3t3d8LUKvi
         PHivL9WiNJUB1sr0blfZHBac0HZP/oEuJV2Yt0lXMfuaPebA8WN6KsOtw2TQT2qAGhkV
         jKcg==
X-Gm-Message-State: APjAAAWltiIHvH0sqQMXlzP1XAOJE9ARHsROKnNgJlx8qPFqb4lOiGQH
        khTFt8f5VTemqMjWkT7QOILTHoS/WtMNZg==
X-Google-Smtp-Source: APXvYqwkGjOjq8i5CnHuf2sFWNeuuy/PHCxP/r2j+xPkkCcu6R9v+4Q7lNDZkL2j2OiB3bjx7xLwNhsBvEQdiQ==
X-Received: by 2002:a05:6214:12ca:: with SMTP id s10mr15075192qvv.91.1567523252369;
 Tue, 03 Sep 2019 08:07:32 -0700 (PDT)
Date:   Tue,  3 Sep 2019 16:06:29 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-4-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v4 03/12] module: add support for symbol namespaces.
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

The EXPORT_SYMBOL_NS() and EXPORT_SYMBOL_NS_GPL() macros can be used to
export a symbol to a specific namespace.  There are no _GPL_FUTURE and
_UNUSED variants because these are currently unused, and I'm not sure
they are necessary.

I didn't add EXPORT_SYMBOL_NS() for ASM exports; this patch sets the
namespace of ASM exports to NULL by default. In case of relative
references, it will be relocatable to NULL. If there's a need, this
should be pretty easy to add.

A module that wants to use a symbol exported to a namespace must add a
MODULE_IMPORT_NS() statement to their module code; otherwise, modpost
will complain when building the module, and the kernel module loader
will emit an error and fail when loading the module.

MODULE_IMPORT_NS() adds a modinfo tag 'import_ns' to the module. That
tag can be observed by the modinfo command, modpost and kernel/module.c
at the time of loading the module.

The ELF symbols are renamed to include the namespace with an asm label;
for example, symbol 'usb_stor_suspend' in namespace USB_STORAGE becomes
'usb_stor_suspend.USB_STORAGE'.  This allows modpost to do namespace
checking, without having to go through all the effort of parsing ELF and
relocation records just to get to the struct kernel_symbols.

On x86_64 I saw no difference in binary size (compression), but at
runtime this will require a word of memory per export to hold the
namespace. An alternative could be to store namespaced symbols in their
own section and use a separate 'struct namespaced_kernel_symbol' for
that section, at the cost of making the module loader more complex.

Co-developed-by: Martijn Coenen <maco@android.com>
Signed-off-by: Martijn Coenen <maco@android.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 include/asm-generic/export.h |  6 +--
 include/linux/export.h       | 91 +++++++++++++++++++++++++++++-------
 include/linux/module.h       |  2 +
 kernel/module.c              | 43 +++++++++++++++++
 4 files changed, 123 insertions(+), 19 deletions(-)

diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
index 63f54907317b..e2b5d0f569d3 100644
--- a/include/asm-generic/export.h
+++ b/include/asm-generic/export.h
@@ -17,11 +17,11 @@
 
 .macro __put, val, name
 #ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
-	.long	\val - ., \name - .
+	.long	\val - ., \name - ., 0 - .
 #elif defined(CONFIG_64BIT)
-	.quad	\val, \name
+	.quad	\val, \name, 0
 #else
-	.long	\val, \name
+	.long	\val, \name, 0
 #endif
 .endm
 
diff --git a/include/linux/export.h b/include/linux/export.h
index 28a4d2150689..d59461e71478 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -20,6 +20,8 @@ extern struct module __this_module;
 
 #ifdef CONFIG_MODULES
 
+#define NS_SEPARATOR "."
+
 #if defined(__KERNEL__) && !defined(__GENKSYMS__)
 #ifdef CONFIG_MODVERSIONS
 /* Mark the CRC weak since genksyms apparently decides not to
@@ -29,13 +31,13 @@ extern struct module __this_module;
 	asm("	.section \"___kcrctab" sec "+" #sym "\", \"a\"	\n"	\
 	    "	.weak	__crc_" #sym "				\n"	\
 	    "	.long	__crc_" #sym " - .			\n"	\
-	    "	.previous					\n");
+	    "	.previous					\n")
 #else
 #define __CRC_SYMBOL(sym, sec)						\
 	asm("	.section \"___kcrctab" sec "+" #sym "\", \"a\"	\n"	\
 	    "	.weak	__crc_" #sym "				\n"	\
 	    "	.long	__crc_" #sym "				\n"	\
-	    "	.previous					\n");
+	    "	.previous					\n")
 #endif
 #else
 #define __CRC_SYMBOL(sym, sec)
@@ -49,6 +51,16 @@ extern struct module __this_module;
  * absolute relocations that require runtime processing on relocatable
  * kernels.
  */
+#define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
+	__ADDRESSABLE(sym)						\
+	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
+	    "	.balign	4					\n"	\
+	    "__ksymtab_" #sym NS_SEPARATOR #ns ":		\n"	\
+	    "	.long	" #sym "- .				\n"	\
+	    "	.long	__kstrtab_" #sym "- .			\n"	\
+	    "	.long	__kstrtab_ns_" #sym "- .		\n"	\
+	    "	.previous					\n")
+
 #define __KSYMTAB_ENTRY(sym, sec)					\
 	__ADDRESSABLE(sym)						\
 	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
@@ -56,32 +68,53 @@ extern struct module __this_module;
 	    "__ksymtab_" #sym ":				\n"	\
 	    "	.long	" #sym "- .				\n"	\
 	    "	.long	__kstrtab_" #sym "- .			\n"	\
+	    "	.long	0 - .					\n"	\
 	    "	.previous					\n")
 
 struct kernel_symbol {
 	int value_offset;
 	int name_offset;
+	int namespace_offset;
 };
 #else
+#define __KSYMTAB_ENTRY_NS(sym, sec, ns)				\
+	static const struct kernel_symbol __ksymtab_##sym##__##ns	\
+	asm("__ksymtab_" #sym NS_SEPARATOR #ns)				\
+	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
+	__aligned(sizeof(void *))					\
+	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtab_ns_##sym }
+
 #define __KSYMTAB_ENTRY(sym, sec)					\
 	static const struct kernel_symbol __ksymtab_##sym		\
+	asm("__ksymtab_" #sym)						\
 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
 	__aligned(sizeof(void *))					\
-	= { (unsigned long)&sym, __kstrtab_##sym }
+	= { (unsigned long)&sym, __kstrtab_##sym, NULL }
 
 struct kernel_symbol {
 	unsigned long value;
 	const char *name;
+	const char *namespace;
 };
 #endif
 
-/* For every exported symbol, place a struct in the __ksymtab section */
-#define ___EXPORT_SYMBOL(sym, sec)					\
+#define ___export_symbol_common(sym, sec)				\
 	extern typeof(sym) sym;						\
-	__CRC_SYMBOL(sym, sec)						\
+	__CRC_SYMBOL(sym, sec);						\
 	static const char __kstrtab_##sym[]				\
 	__attribute__((section("__ksymtab_strings"), used, aligned(1)))	\
-	= #sym;								\
+	= #sym								\
+
+/* For every exported symbol, place a struct in the __ksymtab section */
+#define ___EXPORT_SYMBOL_NS(sym, sec, ns)				\
+	___export_symbol_common(sym, sec);				\
+	static const char __kstrtab_ns_##sym[]				\
+	__attribute__((section("__ksymtab_strings"), used, aligned(1)))	\
+	= #ns;								\
+	__KSYMTAB_ENTRY_NS(sym, sec, ns)
+
+#define ___EXPORT_SYMBOL(sym, sec)					\
+	___export_symbol_common(sym, sec);				\
 	__KSYMTAB_ENTRY(sym, sec)
 
 #if defined(__DISABLE_EXPORTS)
@@ -91,6 +124,7 @@ struct kernel_symbol {
  * be reused in other execution contexts such as the UEFI stub or the
  * decompressor.
  */
+#define __EXPORT_SYMBOL_NS(sym, sec, ns)
 #define __EXPORT_SYMBOL(sym, sec)
 
 #elif defined(CONFIG_TRIM_UNUSED_KSYMS)
@@ -117,18 +151,26 @@ struct kernel_symbol {
 #define __cond_export_sym_1(sym, sec) ___EXPORT_SYMBOL(sym, sec)
 #define __cond_export_sym_0(sym, sec) /* nothing */
 
+#define __EXPORT_SYMBOL_NS(sym, sec, ns)				\
+	__ksym_marker(sym);						\
+	__cond_export_ns_sym(sym, sec, ns, __is_defined(__KSYM_##sym))
+#define __cond_export_ns_sym(sym, sec, ns, conf)			\
+	___cond_export_ns_sym(sym, sec, ns, conf)
+#define ___cond_export_ns_sym(sym, sec, ns, enabled)			\
+	__cond_export_ns_sym_##enabled(sym, sec, ns)
+#define __cond_export_ns_sym_1(sym, sec, ns) ___EXPORT_SYMBOL_NS(sym, sec, ns)
+#define __cond_export_ns_sym_0(sym, sec, ns) /* nothing */
+
 #else
+#define __EXPORT_SYMBOL_NS ___EXPORT_SYMBOL_NS
 #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
 #endif
 
-#define EXPORT_SYMBOL(sym)					\
-	__EXPORT_SYMBOL(sym, "")
-
-#define EXPORT_SYMBOL_GPL(sym)					\
-	__EXPORT_SYMBOL(sym, "_gpl")
-
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)				\
-	__EXPORT_SYMBOL(sym, "_gpl_future")
+#define EXPORT_SYMBOL(sym) __EXPORT_SYMBOL(sym, "")
+#define EXPORT_SYMBOL_GPL(sym) __EXPORT_SYMBOL(sym, "_gpl")
+#define EXPORT_SYMBOL_GPL_FUTURE(sym) __EXPORT_SYMBOL(sym, "_gpl_future")
+#define EXPORT_SYMBOL_NS(sym, ns) __EXPORT_SYMBOL_NS(sym, "", ns)
+#define EXPORT_SYMBOL_NS_GPL(sym, ns) __EXPORT_SYMBOL_NS(sym, "_gpl", ns)
 
 #ifdef CONFIG_UNUSED_SYMBOLS
 #define EXPORT_UNUSED_SYMBOL(sym) __EXPORT_SYMBOL(sym, "_unused")
@@ -138,11 +180,28 @@ struct kernel_symbol {
 #define EXPORT_UNUSED_SYMBOL_GPL(sym)
 #endif
 
-#endif	/* __GENKSYMS__ */
+#endif	/* __KERNEL__ && !__GENKSYMS__ */
+
+#if defined(__GENKSYMS__)
+/*
+ * When we're running genksyms, ignore the namespace and make the _NS
+ * variants look like the normal ones. There are two reasons for this:
+ * 1) In the normal definition of EXPORT_SYMBOL_NS, the 'ns' macro
+ *    argument is itself not expanded because it's always tokenized or
+ *    concatenated; but when running genksyms, a blank definition of the
+ *    macro does allow the argument to be expanded; if a namespace
+ *    happens to collide with a #define, this can cause issues.
+ * 2) There's no need to modify genksyms to deal with the _NS variants
+ */
+#define EXPORT_SYMBOL_NS(sym, ns) EXPORT_SYMBOL(sym)
+#define EXPORT_SYMBOL_NS_GPL(sym, ns) EXPORT_SYMBOL_GPL(sym)
+#endif
 
 #else /* !CONFIG_MODULES... */
 
 #define EXPORT_SYMBOL(sym)
+#define EXPORT_SYMBOL_NS(sym, ns)
+#define EXPORT_SYMBOL_NS_GPL(sym, ns)
 #define EXPORT_SYMBOL_GPL(sym)
 #define EXPORT_SYMBOL_GPL_FUTURE(sym)
 #define EXPORT_UNUSED_SYMBOL(sym)
diff --git a/include/linux/module.h b/include/linux/module.h
index 1455812dd325..b3611e749f72 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -280,6 +280,8 @@ struct notifier_block;
 
 #ifdef CONFIG_MODULES
 
+#define MODULE_IMPORT_NS(ns) MODULE_INFO(import_ns, #ns)
+
 extern int modules_disabled; /* for sysctl */
 /* Get/put a kernel symbol (calls must be symmetric) */
 void *__symbol_get(const char *symbol);
diff --git a/kernel/module.c b/kernel/module.c
index 3ee507c0a92f..6bb9b938f9c7 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -544,6 +544,15 @@ static const char *kernel_symbol_name(const struct kernel_symbol *sym)
 #endif
 }
 
+static const char *kernel_symbol_namespace(const struct kernel_symbol *sym)
+{
+#ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
+	return offset_to_ptr(&sym->namespace_offset);
+#else
+	return sym->namespace;
+#endif
+}
+
 static int cmp_name(const void *va, const void *vb)
 {
 	const char *a;
@@ -1379,6 +1388,34 @@ static inline int same_magic(const char *amagic, const char *bmagic,
 }
 #endif /* CONFIG_MODVERSIONS */
 
+static char *get_modinfo(const struct load_info *info, const char *tag);
+static char *get_next_modinfo(const struct load_info *info, const char *tag,
+			      char *prev);
+
+static int verify_namespace_is_imported(const struct load_info *info,
+					const struct kernel_symbol *sym,
+					struct module *mod)
+{
+	const char *namespace;
+	char *imported_namespace;
+
+	namespace = kernel_symbol_namespace(sym);
+	if (namespace) {
+		imported_namespace = get_modinfo(info, "import_ns");
+		while (imported_namespace) {
+			if (strcmp(namespace, imported_namespace) == 0)
+				return 0;
+			imported_namespace = get_next_modinfo(
+				info, "import_ns", imported_namespace);
+		}
+		pr_err("%s: module uses symbol (%s) from namespace %s, but does not import it.\n",
+		       mod->name, kernel_symbol_name(sym), namespace);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+
 /* Resolve a symbol for this module.  I.e. if we find one, record usage. */
 static const struct kernel_symbol *resolve_symbol(struct module *mod,
 						  const struct load_info *info,
@@ -1407,6 +1444,12 @@ static const struct kernel_symbol *resolve_symbol(struct module *mod,
 		goto getname;
 	}
 
+	err = verify_namespace_is_imported(info, sym, mod);
+	if (err) {
+		sym = ERR_PTR(err);
+		goto getname;
+	}
+
 	err = ref_module(mod, owner);
 	if (err) {
 		sym = ERR_PTR(err);
-- 
2.23.0.187.g17f5b7556c-goog

