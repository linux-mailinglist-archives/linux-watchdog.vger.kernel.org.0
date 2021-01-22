Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC683300303
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 13:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbhAVJ0P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 04:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbhAVJZi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 04:25:38 -0500
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org [IPv6:2a01:4f8:c0c:3a97::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75267C061786;
        Fri, 22 Jan 2021 01:24:58 -0800 (PST)
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 0B0FDAD996C; Fri, 22 Jan 2021 10:24:56 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] watchdog: pcwd: drop always-false if from remove callback
Date:   Fri, 22 Jan 2021 10:24:47 +0100
Message-Id: <20210122092449.426097-2-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122092449.426097-1-uwe@kleine-koenig.org>
References: <20210122092449.426097-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If pcwd_isa_probe() succeeded pcwd_private.io_addr cannot be NULL. (And
if pcwd_isa_probe() failed, pcwd_isa_remove() isn't called.)

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/watchdog/pcwd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/watchdog/pcwd.c b/drivers/watchdog/pcwd.c
index e86fa7f8351d..b95cd38f3ceb 100644
--- a/drivers/watchdog/pcwd.c
+++ b/drivers/watchdog/pcwd.c
@@ -956,9 +956,6 @@ static int pcwd_isa_remove(struct device *dev, unsigned int id)
 	if (debug >= DEBUG)
 		pr_debug("pcwd_isa_remove id=%d\n", id);
 
-	if (!pcwd_private.io_addr)
-		return 1;
-
 	/*  Disable the board  */
 	if (!nowayout)
 		pcwd_stop();
-- 
2.29.2

