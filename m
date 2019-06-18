Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 019BD4A602
	for <lists+linux-watchdog@lfdr.de>; Tue, 18 Jun 2019 17:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbfFRP6d (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 18 Jun 2019 11:58:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:41708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729247AbfFRP6d (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 18 Jun 2019 11:58:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3593220873;
        Tue, 18 Jun 2019 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560873512;
        bh=5IgDcHOHdqBTEvpv0oNU8pjBmQeMlZR1WO14NjpkCkk=;
        h=Date:From:To:Cc:Subject:From;
        b=gTMinqL6Y4xKU/KpsCQixXwZx8GlZ9sKcS6lPv5aVIFdKhdR0mLXoCAP+0WIH3p+b
         lS0NzE47OYECRCyqEC+XTdMMy1PXMnJ2nIOOHxpdQRiF9s3pg9GgrPakPSGenBKG8K
         azIAu4kqHh97Pl34zRj+o0hMOFkyUs9ZdgiUIfV4=
Date:   Tue, 18 Jun 2019 17:58:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tomas Winkler <tomas.winkler@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Subject: [PATCH] watchdog: mei_wdt: no need to check return value of
 debugfs_create functions
Message-ID: <20190618155830.GB21825@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/watchdog/mei_wdt.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/watchdog/mei_wdt.c b/drivers/watchdog/mei_wdt.c
index 8023cf28657a..96a770938ff0 100644
--- a/drivers/watchdog/mei_wdt.c
+++ b/drivers/watchdog/mei_wdt.c
@@ -539,38 +539,23 @@ static void dbgfs_unregister(struct mei_wdt *wdt)
 	wdt->dbgfs_dir = NULL;
 }
 
-static int dbgfs_register(struct mei_wdt *wdt)
+static void dbgfs_register(struct mei_wdt *wdt)
 {
-	struct dentry *dir, *f;
+	struct dentry *dir;
 
 	dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
-	if (!dir)
-		return -ENOMEM;
-
 	wdt->dbgfs_dir = dir;
-	f = debugfs_create_file("state", S_IRUSR, dir, wdt, &dbgfs_fops_state);
-	if (!f)
-		goto err;
 
-	f = debugfs_create_file("activation",  S_IRUSR,
-				dir, wdt, &dbgfs_fops_activation);
-	if (!f)
-		goto err;
+	debugfs_create_file("state", S_IRUSR, dir, wdt, &dbgfs_fops_state);
 
-	return 0;
-err:
-	dbgfs_unregister(wdt);
-	return -ENODEV;
+	debugfs_create_file("activation", S_IRUSR, dir, wdt,
+			    &dbgfs_fops_activation);
 }
 
 #else
 
 static inline void dbgfs_unregister(struct mei_wdt *wdt) {}
-
-static inline int dbgfs_register(struct mei_wdt *wdt)
-{
-	return 0;
-}
+static inline void dbgfs_register(struct mei_wdt *wdt) {}
 #endif /* CONFIG_DEBUG_FS */
 
 static int mei_wdt_probe(struct mei_cl_device *cldev,
@@ -623,8 +608,7 @@ static int mei_wdt_probe(struct mei_cl_device *cldev,
 	if (ret)
 		goto err_disable;
 
-	if (dbgfs_register(wdt))
-		dev_warn(&cldev->dev, "cannot register debugfs\n");
+	dbgfs_register(wdt);
 
 	return 0;
 
-- 
2.22.0

