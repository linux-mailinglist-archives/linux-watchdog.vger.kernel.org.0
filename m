Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D8378F7B
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 17:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbfG2PhR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 11:37:17 -0400
Received: from gateway22.websitewelcome.com ([192.185.46.194]:23341 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725209AbfG2PhR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 11:37:17 -0400
X-Greylist: delayed 1449 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Jul 2019 11:37:16 EDT
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 47844985E9
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jul 2019 10:10:36 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id s7IKhsaqw90ons7IKhkDaT; Mon, 29 Jul 2019 10:10:36 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ezmUYmghSI2oQrQKLe/uAGwuPmnk5NL+l2uSGCKlz2g=; b=g7lWwfb8EWIblZK+memppWODv8
        Rvv6Ncc2rzJzGz55rar1n1WUAdqPKtRNudRxCypzYdewCJiHE7yq8/IKRpb4baqnZyYAZ74QpX9ye
        kqxsWYH9BW9ZB6w/iLTSyQCiw4hoEdNQtG/7AmPnU20KGFx4o+bWvgVamDySwz7k263upyc7dINPO
        hFPvGOzHsWr72GhMSsNmoX8y48/gkyBKSWJSgwoe2ziGq+W1j7XrrxXxj0I4Mev5t18lgWDZLfk8O
        JNUTlvocW13//J4tNYpsgDN1eK3vZCBdM2W+g1JlJcUr83IZRyTIofyADraAhBGOvWPCj94FJV1Gh
        rxf4CMiQ==;
Received: from [187.192.11.120] (port=51632 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hs7IJ-002hzs-4X; Mon, 29 Jul 2019 10:10:35 -0500
Date:   Mon, 29 Jul 2019 10:10:33 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] watchdog: Mark expected switch fall-throughs
Message-ID: <20190729151033.GA10143@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hs7IJ-002hzs-4X
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:51632
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warnings:

drivers/watchdog/ar7_wdt.c: warning: this statement may fall
through [-Wimplicit-fallthrough=]:  => 237:3
drivers/watchdog/pcwd.c: warning: this statement may fall
through [-Wimplicit-fallthrough=]:  => 653:3
drivers/watchdog/sb_wdog.c: warning: this statement may fall
through [-Wimplicit-fallthrough=]:  => 204:3
drivers/watchdog/wdt.c: warning: this statement may fall
through [-Wimplicit-fallthrough=]:  => 391:3

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/watchdog/ar7_wdt.c | 1 +
 drivers/watchdog/pcwd.c    | 2 +-
 drivers/watchdog/sb_wdog.c | 1 +
 drivers/watchdog/wdt.c     | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
index b9b2d06b3879..668a1c704f28 100644
--- a/drivers/watchdog/ar7_wdt.c
+++ b/drivers/watchdog/ar7_wdt.c
@@ -235,6 +235,7 @@ static long ar7_wdt_ioctl(struct file *file,
 		ar7_wdt_update_margin(new_margin);
 		ar7_wdt_kick(1);
 		spin_unlock(&wdt_lock);
+		/* Fall through */
 
 	case WDIOC_GETTIMEOUT:
 		if (put_user(margin, (int *)arg))
diff --git a/drivers/watchdog/pcwd.c b/drivers/watchdog/pcwd.c
index 1b2cf5b95a89..c3c93e00b320 100644
--- a/drivers/watchdog/pcwd.c
+++ b/drivers/watchdog/pcwd.c
@@ -651,7 +651,7 @@ static long pcwd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			return -EINVAL;
 
 		pcwd_keepalive();
-		/* Fall */
+		/* Fall through */
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(heartbeat, argp);
diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
index 5a6ced7a7e8f..202fc8d8ca5f 100644
--- a/drivers/watchdog/sb_wdog.c
+++ b/drivers/watchdog/sb_wdog.c
@@ -202,6 +202,7 @@ static long sbwdog_ioctl(struct file *file, unsigned int cmd,
 		timeout = time;
 		sbwdog_set(user_dog, timeout);
 		sbwdog_pet(user_dog);
+		/* Fall through */
 
 	case WDIOC_GETTIMEOUT:
 		/*
diff --git a/drivers/watchdog/wdt.c b/drivers/watchdog/wdt.c
index 0650100fad00..7d278b37e083 100644
--- a/drivers/watchdog/wdt.c
+++ b/drivers/watchdog/wdt.c
@@ -389,7 +389,7 @@ static long wdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (wdt_set_heartbeat(new_heartbeat))
 			return -EINVAL;
 		wdt_ping();
-		/* Fall */
+		/* Fall through */
 	case WDIOC_GETTIMEOUT:
 		return put_user(heartbeat, p);
 	default:
-- 
2.22.0

