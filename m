Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6F02FF6CD
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Jan 2021 22:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbhAUVIF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Jan 2021 16:08:05 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:51608 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbhAUU6R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Jan 2021 15:58:17 -0500
X-Greylist: delayed 538 seconds by postgrey-1.27 at vger.kernel.org; Thu, 21 Jan 2021 15:58:15 EST
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 8270AAD8EB2; Thu, 21 Jan 2021 21:48:22 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] watchdog: pcwd: drop always-false if from remove callback
Date:   Thu, 21 Jan 2021 21:48:11 +0100
Message-Id: <20210121204812.402589-2-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121204812.402589-1-uwe@kleine-koenig.org>
References: <20210121204812.402589-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If pcwd_isa_probe() succeeded pcwd_private.io_addr cannot be NULL. (And
if pcwd_isa_probe() failed, pcwd_isa_remove() isn't called.)

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

