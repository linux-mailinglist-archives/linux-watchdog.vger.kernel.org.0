Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366A61ACDD0
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Apr 2020 18:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732541AbgDPQff (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Apr 2020 12:35:35 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:36825 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1733211AbgDPQfa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Apr 2020 12:35:30 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from michaelsh@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 16 Apr 2020 19:35:26 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 03GGZIjH013255;
        Thu, 16 Apr 2020 19:35:25 +0300
From:   michaelsh@mellanox.com
To:     linux@roeck-us.net, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com,
        Michael Shych <michaelsh@mellanox.com>
Subject: [PATCH v1 4/4] Documentation/watchdog: Add description of new watchdog type 3
Date:   Thu, 16 Apr 2020 19:35:14 +0300
Message-Id: <20200416163514.7334-5-michaelsh@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200416163514.7334-1-michaelsh@mellanox.com>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Michael Shych <michaelsh@mellanox.com>

Add documentation with details of new type of Mellanox watchdog driver.

Signed-off-by: Michael Shych <michaelsh@mellanox.com>

Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/watchdog/mlx-wdt.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/watchdog/mlx-wdt.rst b/Documentation/watchdog/mlx-wdt.rst
index bf5bafac47f0..fa0a94e5c82e 100644
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
-- 
2.11.0

