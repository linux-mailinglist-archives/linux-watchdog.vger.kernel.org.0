Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34F5B25497
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 May 2019 17:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfEUPxf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 May 2019 11:53:35 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:42826 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbfEUPxe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 May 2019 11:53:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558454012; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6ad9KcKt0opPH871665AwDyUwO5KzglyUHyM6uC8Wqc=;
        b=vT4EnlBFuk5+AlORuxuWbPfcBEW6AOiLWnIFvwP5lNFB3FrXrCXNMg9dyqdP4UdxoJ2NJD
        9KNH95ImJka3tYXAutWW4TdEvmjFyk2bMai9ZeM7uXdgdz2LB5wdvSRBUssHYdpxeE+CKV
        bseURmjW5Zeoxit7pKQigD2hkewMbYE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     od@zcrc.me, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/4] watchdog: jz4740: Drop dependency on MACH_JZ47xx
Date:   Tue, 21 May 2019 17:53:12 +0200
Message-Id: <20190521155313.19326-3-paul@crapouillou.net>
In-Reply-To: <20190521155313.19326-1-paul@crapouillou.net>
References: <20190521155313.19326-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Depending on MACH_JZ47xx prevent us from creating a generic kernel that
works on more than one MIPS board. Instead, we just depend on MIPS being
set.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7ea60371bda0..dccf22bb230c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1633,7 +1633,7 @@ config INDYDOG
 
 config JZ4740_WDT
 	tristate "Ingenic jz4740 SoC hardware watchdog"
-	depends on MACH_JZ4740 || MACH_JZ4780
+	depends on MIPS
 	select WATCHDOG_CORE
 	help
 	  Hardware driver for the built-in watchdog timer on Ingenic jz4740 SoCs.
-- 
2.21.0.593.g511ec345e18

