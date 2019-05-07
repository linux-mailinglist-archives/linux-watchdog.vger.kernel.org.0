Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 620D516DD9
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2019 01:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfEGXdL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 May 2019 19:33:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41258 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfEGXdK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 May 2019 19:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NLj2ytq46fXnI4+cInwB5swQNkX42I39nDMgwRNz0Qk=; b=QO2hqxAIl2hQgrnyizCkacwbr
        K+A3fwnShNQBoG7oAWhy6+JgsyxExQZQVjB8m7Hp8HQ84c/N00+Gj6ZYQlGWkHeAQ6dVnH+zU4Ktg
        EUO67WZyULuMFz8bVzUtMUHYYlKRbi8xyC98Kr/wDOcMdKbQhOvp/eWtXjs6zjAX8nlHyzmCkT2wo
        4bZLLrc6pDoS1BPxkDlUgCmdcZO2MX9ZlXezrlHF2jmHe+jWoOhGhvdLN5pa9Z9XGEJqC5rPETZvf
        bu0FFlkxUeIcz6hHupVVqYaSWILrH+tZKWKjfYE39hmG0+DOqjYh/yVWzKkuUoIYxn3QLnJDEagLs
        MLqMkpWYw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hO9a7-0005QY-Rp; Tue, 07 May 2019 23:33:07 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc:     Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] watchdog: fix watchdog_pretimeout.c build error when no
 default gov. is set
Message-ID: <ec5a2b04-2649-e527-bcfd-4e708808e681@infradead.org>
Date:   Tue, 7 May 2019 16:33:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error when
CONFIG_WATCHDOG_PRETIMEOUT_GOV=y
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP is not set
# CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC is not set

Fixes this build error:

../drivers/watchdog/watchdog_pretimeout.c: In function ‘watchdog_register_governor’:
../drivers/watchdog/watchdog_pretimeout.c:139:26: error: ‘WATCHDOG_PRETIMEOUT_DEFAULT_GOV’ undeclared (first use in this function)
  if (!strncmp(gov->name, WATCHDOG_PRETIMEOUT_DEFAULT_GOV,

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
---
Found in linux-next but applies to mainline.

 drivers/watchdog/watchdog_pretimeout.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20190507.orig/drivers/watchdog/watchdog_pretimeout.c
+++ linux-next-20190507/drivers/watchdog/watchdog_pretimeout.c
@@ -118,7 +118,6 @@ EXPORT_SYMBOL_GPL(watchdog_notify_pretim
 
 int watchdog_register_governor(struct watchdog_governor *gov)
 {
-	struct watchdog_pretimeout *p;
 	struct governor_priv *priv;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
@@ -136,8 +135,11 @@ int watchdog_register_governor(struct wa
 	priv->gov = gov;
 	list_add(&priv->entry, &governor_list);
 
+#if defined(WATCHDOG_PRETIMEOUT_DEFAULT_GOV)
 	if (!strncmp(gov->name, WATCHDOG_PRETIMEOUT_DEFAULT_GOV,
 		     WATCHDOG_GOV_NAME_MAXLEN)) {
+		struct watchdog_pretimeout *p;
+
 		spin_lock_irq(&pretimeout_lock);
 		default_gov = gov;
 
@@ -146,6 +148,7 @@ int watchdog_register_governor(struct wa
 				p->wdd->gov = default_gov;
 		spin_unlock_irq(&pretimeout_lock);
 	}
+#endif
 
 	mutex_unlock(&governor_lock);
 


