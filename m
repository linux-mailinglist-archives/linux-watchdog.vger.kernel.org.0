Return-Path: <linux-watchdog+bounces-299-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 437AB810D99
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 10:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED7D81F21197
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 09:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF430208C0;
	Wed, 13 Dec 2023 09:45:41 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from srv.wefi.net (srv.wefi.net [80.66.63.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB9A2DB
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 01:45:34 -0800 (PST)
Received: from x390.thomas-krenn.com (unknown [91.223.201.37])
	by srv.wefi.net (Postfix) with ESMTPA id 824415A358D;
	Wed, 13 Dec 2023 10:45:33 +0100 (CET)
From: Werner Fischer <devlists@wefi.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	Werner Fischer <devlists@wefi.net>
Subject: [PATCH 2/4] watchdog: it87_wdt: Remove redundant max_units setting
Date: Wed, 13 Dec 2023 10:45:23 +0100
Message-Id: <20231213094525.11849-2-devlists@wefi.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213094525.11849-1-devlists@wefi.net>
References: <20231213094525.11849-1-devlists@wefi.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 893dc8b5c978 ("watchdog: it87: Drop support for resetting watchdog
though CIR and Game port") removed the try_gameport variable, and left
max_units setting redundant.

To clean up the code, this patch removes this redundant setting.

Signed-off-by: Werner Fischer <devlists@wefi.net>
---
 drivers/watchdog/it87_wdt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 6b7f7ec03633..ca377096bdd7 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -274,10 +274,6 @@ static int __init it87_wdt_init(void)
 	case IT8712_ID:
 		max_units = (chip_rev < 8) ? 255 : 65535;
 		break;
-	case IT8716_ID:
-	case IT8726_ID:
-		max_units = 65535;
-		break;
 	case IT8607_ID:
 	case IT8613_ID:
 	case IT8620_ID:
@@ -287,9 +283,11 @@ static int __init it87_wdt_init(void)
 	case IT8655_ID:
 	case IT8665_ID:
 	case IT8686_ID:
+	case IT8716_ID:
 	case IT8718_ID:
 	case IT8720_ID:
 	case IT8721_ID:
+	case IT8726_ID:
 	case IT8728_ID:
 	case IT8772_ID:
 	case IT8783_ID:
-- 
2.39.2


