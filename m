Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B597825496
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 17:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728906AbfEUPxf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 11:53:35 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:42844 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbfEUPxe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 11:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558454013; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W3efaCyaqeEOHgt5ziqzD9a8ipNVrHVSuLJfa6CN/oM=;
        b=LsNQaXgRQiARFiOYYKFKXoXUPaJaLfiXXXpJebgLfxB9uzu99dQvI/sc7S5lFaAH5E5g8f
        yOGncKtWkScyhrms9oDUTQlCt/ay4+4X0zbYLAHEZXvSKGVlR1/MduQTUJg7Iakb546pvs
        gDqIKWw6awkh9qKv3cOAnE8VqpsxCvU=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/4] watchdog: jz4740: Switch to SPDX license identifier
Date:   Tue, 21 May 2019 17:53:13 +0200
Message-Id: <20190521155313.19326-4-paul@crapouillou.net>
In-Reply-To: <20190521155313.19326-1-paul@crapouillou.net>
References: <20190521155313.19326-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use a SPDX license identifier instead of a wall of text.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/watchdog/jz4740_wdt.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
index f970a7a53084..c5b369152e70 100644
--- a/drivers/watchdog/jz4740_wdt.c
+++ b/drivers/watchdog/jz4740_wdt.c
@@ -1,16 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *  Copyright (C) 2010, Paul Cercueil <paul@crapouillou.net>
  *  JZ4740 Watchdog driver
- *
- *  This program is free software; you can redistribute it and/or modify it
- *  under  the terms of the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the License, or (at your
- *  option) any later version.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- *
  */
 
 #include <linux/mfd/ingenic-tcu.h>
-- 
2.21.0.593.g511ec345e18

