Return-Path: <linux-watchdog+bounces-296-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EA8810D98
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 10:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AD71B20BDB
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 09:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86987200BC;
	Wed, 13 Dec 2023 09:45:39 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from srv.wefi.net (srv.wefi.net [80.66.63.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB7B7D0
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 01:45:34 -0800 (PST)
Received: from x390.thomas-krenn.com (unknown [91.223.201.37])
	by srv.wefi.net (Postfix) with ESMTPA id 3C8725A358C;
	Wed, 13 Dec 2023 10:45:33 +0100 (CET)
From: Werner Fischer <devlists@wefi.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org,
	Werner Fischer <devlists@wefi.net>
Subject: [PATCH 1/4] watchdog: it87_wdt: add blank line after variable declaration
Date: Wed, 13 Dec 2023 10:45:22 +0100
Message-Id: <20231213094525.11849-1-devlists@wefi.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

WARNING: Missing a blank line after declarations

Signed-off-by: Werner Fischer <devlists@wefi.net>
---
 drivers/watchdog/it87_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index e888b1bdd1f2..6b7f7ec03633 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -146,6 +146,7 @@ static inline void superio_outb(int val, int reg)
 static inline int superio_inw(int reg)
 {
 	int val;
+
 	outb(reg++, REG);
 	val = inb(VAL) << 8;
 	outb(reg, REG);
-- 
2.39.2


