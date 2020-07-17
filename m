Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C5B2240AE
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Jul 2020 18:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgGQQff (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Jul 2020 12:35:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbgGQQfe (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Jul 2020 12:35:34 -0400
Received: from embeddedor (unknown [201.162.167.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A6D52065E;
        Fri, 17 Jul 2020 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595003734;
        bh=PKNDgQwBHU+u8iM5TGqJfeOToHbtv4pEScV52MFvHls=;
        h=Date:From:To:Cc:Subject:From;
        b=TxrJ7MbTKKQV9fmTaapbzAMx82PP2hfF0FIoSt9LDMdPqIRlGudG3yJ01uwHmGhB5
         xuciIdPKqVhf9uoQaTkLSkxE2QyoiinG9PwsMe82+8Nw2SmzMxRHklZNNC3nzAYXy2
         G+ztodhuCgdH/qcjHxyaU5OuuUAgLzENA+9E9dEk=
Date:   Fri, 17 Jul 2020 11:40:59 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jim Cromie <jim.cromie@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] watchdog: scx200_wdt: Use fallthrough pseudo-keyword
Message-ID: <20200717164059.GA26947@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1].

[1] https://www.kernel.org/doc/html/v5.7-rc7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/watchdog/scx200_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/scx200_wdt.c b/drivers/watchdog/scx200_wdt.c
index c94098acb78f..7b5e18323f3f 100644
--- a/drivers/watchdog/scx200_wdt.c
+++ b/drivers/watchdog/scx200_wdt.c
@@ -186,7 +186,7 @@ static long scx200_wdt_ioctl(struct file *file, unsigned int cmd,
 		margin = new_margin;
 		scx200_wdt_update_margin();
 		scx200_wdt_ping();
-		/* Fall through */
+		fallthrough;
 	case WDIOC_GETTIMEOUT:
 		if (put_user(margin, p))
 			return -EFAULT;
-- 
2.27.0

