Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06601BB6C4
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Apr 2020 08:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgD1GeP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 02:34:15 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51728 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726303AbgD1GeP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 02:34:15 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5169DF21E50E713E9D9F;
        Tue, 28 Apr 2020 14:34:13 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 14:34:06 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] watchdog: riowd: remove unneeded semicolon
Date:   Tue, 28 Apr 2020 14:33:33 +0800
Message-ID: <20200428063333.2743-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix the following coccicheck warning:

drivers/watchdog/riowd.c:144:2-3: Unneeded semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/watchdog/riowd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
index dc3c06a92f93..1b9a6dc8f982 100644
--- a/drivers/watchdog/riowd.c
+++ b/drivers/watchdog/riowd.c
@@ -141,7 +141,7 @@ static long riowd_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
 	default:
 		return -EINVAL;
-	};
+	}
 
 	return 0;
 }
-- 
2.21.1

