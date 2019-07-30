Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2702879E17
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 03:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730677AbfG3Bqx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 21:46:53 -0400
Received: from gateway22.websitewelcome.com ([192.185.46.225]:35345 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727644AbfG3Bqx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 21:46:53 -0400
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id A808B4B0E
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jul 2019 20:46:52 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id sHE4hXp8kiQersHE4hwsYc; Mon, 29 Jul 2019 20:46:52 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0JGj6mzO9kTiIaCb4sA56WU7/HQECJdHfPE3UcX48CU=; b=tEn/+GPfrhGLuEKJjmVRPzMtW3
        wqPUSUPUHNFEBb9s0PmNQH3MkxS1KprWF6CNRjJTRpeEUH1/3b6df5TmIKqRZk5izak7ekYycw5Zk
        zYzEu+ggxUlOHeKSMBhoLgi/NFJ4Rk/5LrER49PevYx5FL40mSXWqHIKANewduRllU/E738FtMbfo
        UagUc8uQgSleI7CbZl4bVEI9vGlqR+yn+VYTqwZh9ll4SX24RB3W4nP9Cxx4Rkah09r2B7v8+7YBT
        ZslF5Qs4JGx72P6/R1CHDxBw3zNqBRbM9ghCQxE9Zb98r1316+CzFaI6fPgusq6+rasDfZW31B9hU
        j+IzCMRA==;
Received: from [187.192.11.120] (port=37256 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hsHE3-003bjI-Kn; Mon, 29 Jul 2019 20:46:51 -0500
Date:   Mon, 29 Jul 2019 20:46:50 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] watchdog: riowd: Mark expected switch fall-through
Message-ID: <20190730014650.GA31309@embeddedor>
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
X-Exim-ID: 1hsHE3-003bjI-Kn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:37256
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warnings (Building: sparc64):

drivers/watchdog/riowd.c: In function ‘riowd_ioctl’:
drivers/watchdog/riowd.c:136:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   riowd_writereg(p, riowd_timeout, WDTO_INDEX);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/watchdog/riowd.c:139:2: note: here
  case WDIOC_GETTIMEOUT:
  ^~~~

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/watchdog/riowd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
index 41a2a11535a6..b35f7be20c00 100644
--- a/drivers/watchdog/riowd.c
+++ b/drivers/watchdog/riowd.c
@@ -134,7 +134,7 @@ static long riowd_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			return -EINVAL;
 		riowd_timeout = (new_margin + 59) / 60;
 		riowd_writereg(p, riowd_timeout, WDTO_INDEX);
-		/* Fall */
+		/* Fall through */
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(riowd_timeout * 60, (int __user *)argp);
-- 
2.22.0

