Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414DE1C2A25
	for <lists+linux-watchdog@lfdr.de>; Sun,  3 May 2020 07:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgECFee (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 3 May 2020 01:34:34 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:34417 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726937AbgECFed (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 3 May 2020 01:34:33 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from michaelsh@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 3 May 2020 08:34:31 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0435YQbV008633;
        Sun, 3 May 2020 08:34:31 +0300
From:   michaelsh@mellanox.com
To:     linux@roeck-us.net, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com,
        Michael Shych <michaelsh@mellanox.com>
Subject: [PATCH v3 4/4] docs: watchdog: mlx-wdt: Add description of new watchdog type 3
Date:   Sun,  3 May 2020 08:34:24 +0300
Message-Id: <20200503053424.31943-5-michaelsh@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200503053424.31943-1-michaelsh@mellanox.com>
References: <20200503053424.31943-1-michaelsh@mellanox.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Michael Shych <michaelsh@mellanox.com>

Add documentation with details of new type of Mellanox watchdog driver.

Signed-off-by: Michael Shych <michaelsh@mellanox.com>
Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1-v2:
Add explanation about device registers order
---
v2-v3:
Remove note about cpu_to_le16 and vice versa conversion
---
 Documentation/watchdog/mlx-wdt.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/watchdog/mlx-wdt.rst b/Documentation/watchdog/mlx-wdt.rst
index bf5bafac47f0..35e690dea9db 100644
--- a/Documentation/watchdog/mlx-wdt.rst
+++ b/Documentation/watchdog/mlx-wdt.rst
@@ -24,10 +24,19 @@ Type 2:
   Maximum timeout is 255 sec.
   Get time-left is supported.
 
+Type 3:
+  Same as Type 2 with extended maximum timeout period.
+  Maximum timeout is 65535 sec.
+
 Type 1 HW watchdog implementation exist in old systems and
 all new systems have type 2 HW watchdog.
 Two types of HW implementation have also different register map.
 
+Type 3 HW watchdog implementation can exist on all Mellanox systems
+with new programmer logic device.
+It's differentiated by WD capability bit.
+Old systems still have only one main watchdog.
+
 Mellanox system can have 2 watchdogs: main and auxiliary.
 Main and auxiliary watchdog devices can be enabled together
 on the same system.
@@ -54,3 +63,4 @@ The driver checks during initialization if the previous system reset
 was done by the watchdog. If yes, it makes a notification about this event.
 
 Access to HW registers is performed through a generic regmap interface.
+Programmable logic device registers have little-endian order.
-- 
2.11.0

