Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D183253DA7
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Aug 2020 08:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgH0GXc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 Aug 2020 02:23:32 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:35910 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725909AbgH0GXc (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 Aug 2020 02:23:32 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 2F17778F08D2597D33A1;
        Thu, 27 Aug 2020 14:23:29 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.253) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Thu, 27 Aug 2020 14:23:22 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        linux-watchdog <linux-watchdog@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] watchdog: remove unneeded inclusion of <uapi/linux/sched/types.h>
Date:   Thu, 27 Aug 2020 14:21:54 +0800
Message-ID: <20200827062154.1847-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There has been no reference to "struct sched_param" since
commit 94beddacb53c ("sched,watchdog: Convert to sched_set_fifo()"), so
there's no need to include <uapi/linux/sched/types.h> any more, delete
it.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/watchdog/watchdog_dev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 6798addabd5a067..0f18fa2433310b0 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -43,8 +43,6 @@
 #include <linux/watchdog.h>	/* For watchdog specific items */
 #include <linux/uaccess.h>	/* For copy_to_user/put_user/... */
 
-#include <uapi/linux/sched/types.h>	/* For struct sched_param */
-
 #include "watchdog_core.h"
 #include "watchdog_pretimeout.h"
 
-- 
1.8.3


