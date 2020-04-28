Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F341BBE98
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Apr 2020 15:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgD1NIb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 09:08:31 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50910 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727026AbgD1NIb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 09:08:31 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from michaelsh@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 28 Apr 2020 16:08:26 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 03SD8OAE026463;
        Tue, 28 Apr 2020 16:08:25 +0300
From:   michaelsh@mellanox.com
To:     linux@roeck-us.net, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com,
        Michael Shych <michaelsh@mellanox.com>
Subject: [PATCH v2 1/4] platform_data/mlxreg: support new watchdog type with longer timeout period
Date:   Tue, 28 Apr 2020 16:08:13 +0300
Message-Id: <20200428130816.582-2-michaelsh@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200428130816.582-1-michaelsh@mellanox.com>
References: <20200428130816.582-1-michaelsh@mellanox.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Michael Shych <michaelsh@mellanox.com>

Add new watchdog type 3 with longer timeout period.
Extend size of health_cntr field that that can be used to init watchdog
timeout period.

Signed-off-by: Michael Shych <michaelsh@mellanox.com>
Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
---
 include/linux/platform_data/mlxreg.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index b8da8aef2446..2c5e58d1d77b 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -43,10 +43,13 @@
  *
  * TYPE1 HW watchdog implementation exist in old systems.
  * All new systems have TYPE2 HW watchdog.
+ * TYPE3 HW watchdog can exist on all systems with new CPLD.
+ * TYPE3 is selected by WD capability bit.
  */
 enum mlxreg_wdt_type {
 	MLX_WDT_TYPE1,
 	MLX_WDT_TYPE2,
+	MLX_WDT_TYPE3,
 };
 
 /**
@@ -90,7 +93,7 @@ struct mlxreg_core_data {
 	umode_t	mode;
 	struct device_node *np;
 	struct mlxreg_hotplug_device hpdev;
-	u8 health_cntr;
+	u32 health_cntr;
 	bool attached;
 };
 
-- 
2.11.0

