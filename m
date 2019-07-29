Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBC8679C90
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 00:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbfG2WyK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 18:54:10 -0400
Received: from gateway20.websitewelcome.com ([192.185.64.36]:25370 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727091AbfG2WyJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 18:54:09 -0400
X-Greylist: delayed 1327 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Jul 2019 18:54:09 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 87126400C4347
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jul 2019 16:28:32 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id sEBVh1iR92qH7sEBVh44dw; Mon, 29 Jul 2019 17:32:01 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=U+MiMokElKXt1Zcv5kXgnFXUTyae9u7kMKIll4+YD80=; b=onFCZisnfdsGB4dYOjYaXKf/DG
        ejekSGTTTDarJNMXVv41cRWwCOP3IK/d72aqxTsMlb8QtgrbSU5ogZB7mqUrb3cckVSLgILHokxU9
        nHCVfUk2TLmUPDEDK8waPSvGmy77JCw9jQNo17NUqpzsQbf8GuIdbO893dHpi/7ILa5JjUaFK/4hs
        IIfH8wRJs545F2wGJ9XP6gJ0VMRQdvVzdgMvH16vsbq9LD8egKmODKw3xcs5ZOKTamfOZHwGGN/G9
        GrSrpioy/PPkqb/gkWlwSlFlo1TFTNEqq51dkJ/Oc5/LG0fFiqui8Xwnq6lbLKVEgR7r3FJmsBMfX
        12XRE/DA==;
Received: from [187.192.11.120] (port=60874 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hsEBU-00275O-6C; Mon, 29 Jul 2019 17:32:00 -0500
Date:   Mon, 29 Jul 2019 17:31:59 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] watchdog: wdt977: Mark expected switch fall-through
Message-ID: <20190729223159.GA20878@embeddedor>
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
X-Exim-ID: 1hsEBU-00275O-6C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:60874
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 29
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: arm):

drivers/watchdog/wdt977.c: In function ‘wdt977_ioctl’:
  LD [M]  drivers/media/platform/vicodec/vicodec.o
drivers/watchdog/wdt977.c:400:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   wdt977_keepalive();
   ^~~~~~~~~~~~~~~~~~
drivers/watchdog/wdt977.c:403:2: note: here
  case WDIOC_GETTIMEOUT:
  ^~~~

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/watchdog/wdt977.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/wdt977.c b/drivers/watchdog/wdt977.c
index 567005d7598e..5c52c73e1839 100644
--- a/drivers/watchdog/wdt977.c
+++ b/drivers/watchdog/wdt977.c
@@ -398,7 +398,7 @@ static long wdt977_ioctl(struct file *file, unsigned int cmd,
 			return -EINVAL;
 
 		wdt977_keepalive();
-		/* Fall */
+		/* Fall through */
 
 	case WDIOC_GETTIMEOUT:
 		return put_user(timeout, uarg.i);
-- 
2.22.0

