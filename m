Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 806FAA6C52
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2019 17:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729855AbfICPHp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Sep 2019 11:07:45 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:46887 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729870AbfICPHp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Sep 2019 11:07:45 -0400
Received: by mail-qk1-f202.google.com with SMTP id n135so18815429qka.13
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Sep 2019 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RSyx3V/T3+Fb/fBnjK85DcZdNsViLHAQqUGk4FWkZsU=;
        b=ldoyE70kJF8tGNXA/RdsmM9WccjJ/l/oyRh7hHi08RWg0nZ0Rb9g+gDqK01q50s4LE
         kEVDyCivDnMhp2TLCfzMZYj7EbsAcC1SKLhl1eECH6O6bIxSkf2tkH8PeVaISi8BMrjQ
         bFXkoedgoNYakwEgLdUh8j5FZZjsKdK6CtIOvdnLDO3LaQhp7wzRMV3TRywQgOkYCBOv
         2akNhCRlY8j1azQOET4yeA7EmwQcMc0+z3BB0hSY3z7eYrDCORt+rTpAmU8VUCpl7APr
         R6ehlcXY7D66jWN4vC0T8gA6QaXzDZCb1IaCgj/asymbAZciAkWxF0iDkOohDTp8DXxs
         BeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RSyx3V/T3+Fb/fBnjK85DcZdNsViLHAQqUGk4FWkZsU=;
        b=tFYPlFi98dE4EekVy9T7NiP8JB3MYXsLniMRptzgxSvUDdiH8Zo1T5POZ8o20zAEN7
         AvnA/uWTRzdC8c3E7dX5CY7AT/ctcUaSDcoQLJCqdoLobXyeap9Fy+5eY4qtxNi2DNhw
         IZx9YM03NCkpZ4QDZbG6z9kGJGNCv3sRSbHTb/mxvPMWd2Al1G3pgG0Xt0zh+UxsDYQO
         IcHyzIvS/PDqoGSvCdVfyUn1qnamkhYqJ+dcnsFLYZ5Y5kUwh3QjATWbmOtBBzx4kYbN
         weSMsFqtCyxOzNU+zEEsRSCet4VzeIk+SDDtKlH3CC66U9WUxccbbw3jEWcb0Leoe7al
         nrDw==
X-Gm-Message-State: APjAAAV3ntEq+5g7zEcrV0nFr9DA/MCERPHfhB/KBUiyfXX7cd3VAfh5
        jLmj1+c7JzHVJhJKjU5+CMi1ctm176XcYQ==
X-Google-Smtp-Source: APXvYqzWnbTLWyx6Y6Af5dccbNi55xGD4hNXquBtED1N8JNA/6qhN3gWGV+qHmrza6FyvvdYJCf4Aj27tPX94g==
X-Received: by 2002:aed:3c52:: with SMTP id u18mr15781866qte.194.1567523264136;
 Tue, 03 Sep 2019 08:07:44 -0700 (PDT)
Date:   Tue,  3 Sep 2019 16:06:33 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-8-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v4 07/12] modpost: add support for generating namespace dependencies
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

This patch adds an option to modpost to generate a <module>.ns_deps file
per module, containing the namespace dependencies for that module.

E.g. if the linked module my-module.ko would depend on the symbol
myfunc.MY_NS in the namespace MY_NS, the my-module.ns_deps file created
by modpost would contain the entry MY_NS to express the namespace
dependency of my-module imposed by using the symbol myfunc.

These files can subsequently be used by static analysis tools (like
coccinelle scripts) to address issues with missing namespace imports. A
later patch of this series will introduce such a script 'nsdeps' and a
corresponding make target to automatically add missing
MODULE_IMPORT_NS() definitions to the module's sources. For that it uses
the information provided in the generated .ns_deps files.

Co-developed-by: Martijn Coenen <maco@android.com>
Signed-off-by: Martijn Coenen <maco@android.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 .gitignore            |  1 +
 Makefile              |  2 +-
 scripts/mod/modpost.c | 54 +++++++++++++++++++++++++++++++++++++++----
 scripts/mod/modpost.h |  2 ++
 4 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/.gitignore b/.gitignore
index 2030c7a4d2f8..9ee63aa2a3fb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -32,6 +32,7 @@
 *.lzo
 *.mod
 *.mod.c
+*.ns_deps
 *.o
 *.o.*
 *.order
diff --git a/Makefile b/Makefile
index 0cbe8717bdb3..0cdb957ae2c3 100644
--- a/Makefile
+++ b/Makefile
@@ -1669,7 +1669,7 @@ clean: $(clean-dirs)
 		-o -name '*.ko.*' \
 		-o -name '*.dtb' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
 		-o -name '*.dwo' -o -name '*.lst' \
-		-o -name '*.su' -o -name '*.mod' \
+		-o -name '*.su' -o -name '*.mod' -o -name '*.ns_deps' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name '*.asn1.[ch]' \
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index c2d49afaea1c..be72da25fe7c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -38,6 +38,8 @@ static int sec_mismatch_count = 0;
 static int sec_mismatch_fatal = 0;
 /* ignore missing files */
 static int ignore_missing_files;
+/* write namespace dependencies */
+static int write_namespace_deps;
 
 enum export {
 	export_plain,      export_unused,     export_gpl,
@@ -2176,10 +2178,15 @@ static int check_exports(struct module *mod)
 		else
 			basename = mod->name;
 
-		if (exp->namespace &&
-		    !module_imports_namespace(mod, exp->namespace)) {
-			warn("module %s uses symbol %s from namespace %s, but does not import it.\n",
-			     basename, exp->name, exp->namespace);
+		if (exp->namespace) {
+			add_namespace(&mod->required_namespaces,
+				      exp->namespace);
+
+			if (!write_namespace_deps &&
+			    !module_imports_namespace(mod, exp->namespace)) {
+				warn("module %s uses symbol %s from namespace %s, but does not import it.\n",
+				     basename, exp->name, exp->namespace);
+			}
 		}
 
 		if (!mod->gpl_compatible)
@@ -2484,6 +2491,31 @@ static void write_dump(const char *fname)
 	free(buf.p);
 }
 
+static void write_namespace_deps_files(void)
+{
+	struct module *mod;
+	struct namespace_list *ns;
+	struct buffer ns_deps_buf = {};
+
+	for (mod = modules; mod; mod = mod->next) {
+		char fname[PATH_MAX];
+
+		if (mod->skip)
+			continue;
+
+		ns_deps_buf.pos = 0;
+
+		for (ns = mod->required_namespaces; ns; ns = ns->next)
+			buf_printf(&ns_deps_buf, "%s\n", ns->namespace);
+
+		if (ns_deps_buf.pos == 0)
+			continue;
+
+		sprintf(fname, "%s.ns_deps", mod->name);
+		write_if_changed(&ns_deps_buf, fname);
+	}
+}
+
 struct ext_sym_list {
 	struct ext_sym_list *next;
 	const char *file;
@@ -2500,7 +2532,7 @@ int main(int argc, char **argv)
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
-	while ((opt = getopt(argc, argv, "i:I:e:mnsT:o:awE")) != -1) {
+	while ((opt = getopt(argc, argv, "i:I:e:mnsT:o:awEd")) != -1) {
 		switch (opt) {
 		case 'i':
 			kernel_read = optarg;
@@ -2541,6 +2573,9 @@ int main(int argc, char **argv)
 		case 'E':
 			sec_mismatch_fatal = 1;
 			break;
+		case 'd':
+			write_namespace_deps = 1;
+			break;
 		default:
 			exit(1);
 		}
@@ -2575,6 +2610,9 @@ int main(int argc, char **argv)
 
 		err |= check_modname_len(mod);
 		err |= check_exports(mod);
+		if (write_namespace_deps)
+			continue;
+
 		add_header(&buf, mod);
 		add_intree_flag(&buf, !external_module);
 		add_retpoline(&buf);
@@ -2587,6 +2625,12 @@ int main(int argc, char **argv)
 		sprintf(fname, "%s.mod.c", mod->name);
 		write_if_changed(&buf, fname);
 	}
+
+	if (write_namespace_deps) {
+		write_namespace_deps_files();
+		return 0;
+	}
+
 	if (dump_write)
 		write_dump(dump_write);
 	if (sec_mismatch_count && sec_mismatch_fatal)
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 9626bf3e7424..92a926d375d2 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -126,6 +126,8 @@ struct module {
 	struct buffer dev_table_buf;
 	char	     srcversion[25];
 	int is_dot_o;
+	// Required namespace dependencies
+	struct namespace_list *required_namespaces;
 	// Actual imported namespaces
 	struct namespace_list *imported_namespaces;
 };
-- 
2.23.0.187.g17f5b7556c-goog

