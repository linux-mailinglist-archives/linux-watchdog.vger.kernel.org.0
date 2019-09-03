Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1028A6C76
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2019 17:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbfICPHk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Sep 2019 11:07:40 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:42394 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbfICPHj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Sep 2019 11:07:39 -0400
Received: by mail-vs1-f74.google.com with SMTP id m26so934469vsa.9
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Sep 2019 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=e5Xa0/L265hDWGkY0PbNgVQnJTuuZu+3daZLqyOdxeE=;
        b=Hc0uhxetFetgu/poYhUNFgg1T/AwAxEU/l5K1FfOUg+f0UDE9/4KemaScAtIodqCcf
         p+HErAQSwLryXYi6kJhwEDHbcaoIEMJn1t1UXw5opoN+Eo7Q8uX0MgEtrKPvgRCHqr60
         bcyHtxD9NVfAPNsjYgne7wNNEXO3ygL8XmhSxOqgamb2vNSBC/PH9s1qLICgCeuhcUzc
         gor8Bzjd0nOLnqmfz8RlNFqa+Ip17HpWMJ/4Oohd87xpibMA9P2cOON4y/PnV+yD1DEY
         yim6amoWS0+2n19l9MHM7rxxZ1+ZLaK1MEr2KbIKihHzI+SvCc1RGyKDayWQorTmMk8m
         6vpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=e5Xa0/L265hDWGkY0PbNgVQnJTuuZu+3daZLqyOdxeE=;
        b=frnJm29k23s7O+gZsZFSmM4bE8zfPHRM3NJMBYXxilST1SBb/78NmoiNLH1lK7sVLZ
         j0XLPO7VUcvwh3YTjh8zgqSk/xlFKGbO0zfj4YGUtN2peUFt7OTec1OMwKJ+ooXJk4db
         +OIWQ0eCXSZC0aX7IHRHqRcw2QJPXcPZvBp21UPmSWeZSJComVYHyk3fd9LMq5mFZmTj
         EtVqyEpJmEIPkznF2AqRlJVtH2Nf+YefEOJxqYV49ZXF3orL8axtkh72srG97LXrGDwH
         W/7Gk6936OW+CwD0TAE5a1CIgC11KXJF4xtjCFRU/rS/KGC6wjkGxm0Fp1uz22/t/9xM
         +LNg==
X-Gm-Message-State: APjAAAWMjOCLLKe2+9IfAqSq+hw9j1CjuJTzPIgcsrwpGrl+Mr2jy/xw
        aQgAesc/t5cPWs3S6z2H+35+RaHPgn/shg==
X-Google-Smtp-Source: APXvYqwQdWroZ46qqIvVShU81d8ojjOGsuCIOY/jhv+xD2nymIDWaNxFqSFL2DC3qyyVqkblB8HT7gT1W1ZVnQ==
X-Received: by 2002:a1f:bd94:: with SMTP id n142mr7086317vkf.86.1567523258142;
 Tue, 03 Sep 2019 08:07:38 -0700 (PDT)
Date:   Tue,  3 Sep 2019 16:06:31 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-6-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v4 05/12] module: add config option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
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

If MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is enabled (default=n), the
requirement for modules to import all namespaces that are used by
the module is relaxed.

Enabling this option effectively allows (invalid) modules to be loaded
while only a warning is emitted.

Disabling this option keeps the enforcement at module loading time and
loading is denied if the module's imports are not satisfactory.

Reviewed-by: Martijn Coenen <maco@android.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 init/Kconfig    | 13 +++++++++++++
 kernel/module.c | 11 +++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index bd7d650d4a99..cc28561288a7 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2119,6 +2119,19 @@ config MODULE_COMPRESS_XZ
 
 endchoice
 
+config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
+	bool "Allow loading of modules with missing namespace imports"
+	help
+	  Symbols exported with EXPORT_SYMBOL_NS*() are considered exported in
+	  a namespace. A module that makes use of a symbol exported with such a
+	  namespace is required to import the namespace via MODULE_IMPORT_NS().
+	  There is no technical reason to enforce correct namespace imports,
+	  but it creates consistency between symbols defining namespaces and
+	  users importing namespaces they make use of. This option relaxes this
+	  requirement and lifts the enforcement when loading a module.
+
+	  If unsure, say N.
+
 config TRIM_UNUSED_KSYMS
 	bool "Trim unused exported kernel symbols"
 	depends on MODULES && !UNUSED_SYMBOLS
diff --git a/kernel/module.c b/kernel/module.c
index 6bb9b938f9c7..f76efcf2043e 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1408,9 +1408,16 @@ static int verify_namespace_is_imported(const struct load_info *info,
 			imported_namespace = get_next_modinfo(
 				info, "import_ns", imported_namespace);
 		}
-		pr_err("%s: module uses symbol (%s) from namespace %s, but does not import it.\n",
-		       mod->name, kernel_symbol_name(sym), namespace);
+#ifdef CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
+		pr_warn(
+#else
+		pr_err(
+#endif
+			"%s: module uses symbol (%s) from namespace %s, but does not import it.\n",
+			mod->name, kernel_symbol_name(sym), namespace);
+#ifndef CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
 		return -EINVAL;
+#endif
 	}
 	return 0;
 }
-- 
2.23.0.187.g17f5b7556c-goog

