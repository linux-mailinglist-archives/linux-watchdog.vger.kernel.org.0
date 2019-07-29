Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0771B799E8
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 22:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbfG2U0q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 16:26:46 -0400
Received: from gateway33.websitewelcome.com ([192.185.147.108]:13496 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfG2U0p (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 16:26:45 -0400
X-Greylist: delayed 1239 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Jul 2019 16:26:45 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id F016D205ED
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jul 2019 15:06:05 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id sBuHhTbaBiQersBuHhshgr; Mon, 29 Jul 2019 15:06:05 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=a+saqhhJ62Tmb3k+GTqe/6Z8xWSbumJEIlxILgYZV68=; b=D21o2tT2ziSnE7MIh2vEJd6fYU
        QGXkh3zZILMMexb09l2I6lwzM+bfCfVYIswj4T7rz2U6qeV5Pc9y8csMUc09Fyr7SNZhFZYBl0ev9
        9oU7byiBVw5//0grrI305r6hNvsRqsRcldYxkGLXI2X/9UiFtJf5x+kEp46E+bh3ycsuyJoHQYadw
        CtSYDIvDJVHnpz6UvVu328gp9aiXMx9XdRSnCGR8NVMij1zLnOORmJmOyf1okfJwOIUR/fKAZdQy+
        GHoO6zX8b2EsMjupBOH5d1FJpLaDLCcqrUyVew5WN0BmHLt5tnbU8s8HAeoQeV6NmQBIHJYdq0o3t
        5VxXyO+g==;
Received: from [187.192.11.120] (port=59530 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hsBuG-000wID-R4; Mon, 29 Jul 2019 15:06:04 -0500
Date:   Mon, 29 Jul 2019 15:06:02 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jim Cromie <jim.cromie@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] watchdog: scx200_wdt: Mark expected switch fall-through
Message-ID: <20190729200602.GA6854@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hsBuG-000wID-R4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:59530
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: i386):

drivers/watchdog/scx200_wdt.c: In function ‘scx200_wdt_ioctl’:
drivers/watchdog/scx200_wdt.c:188:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   scx200_wdt_ping();
   ^~~~~~~~~~~~~~~~~
drivers/watchdog/scx200_wdt.c:189:2: note: here
  case WDIOC_GETTIMEOUT:
  ^~~~

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/watchdog/scx200_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/scx200_wdt.c b/drivers/watchdog/scx200_wdt.c
index efd7996694de..46268309ee9b 100644
--- a/drivers/watchdog/scx200_wdt.c
+++ b/drivers/watchdog/scx200_wdt.c
@@ -186,6 +186,7 @@ static long scx200_wdt_ioctl(struct file *file, unsigned int cmd,
 		margin = new_margin;
 		scx200_wdt_update_margin();
 		scx200_wdt_ping();
+		/* Fall through */
 	case WDIOC_GETTIMEOUT:
 		if (put_user(margin, p))
 			return -EFAULT;
-- 
2.22.0

