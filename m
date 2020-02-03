Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB60150A88
	for <lists+linux-watchdog@lfdr.de>; Mon,  3 Feb 2020 17:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgBCQKf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 3 Feb 2020 11:10:35 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:56340 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbgBCQKf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 3 Feb 2020 11:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=iQiWPAzdorVrbV0wQae916JQuzrnEd67qY6JDJtYWaw=; b=VEouXGI9u0eOThKqOvcmjEYx2r
        Q3TKm7qc6jddQj9Af+39I1uHazC9qTqIxhEIpOmtPdiY4WTw38NIaYxt+DPa0x3vnLcJ+o2IqPB1T
        HK3s99nnvFnx63QCcmR1pa5xO9vlj51ndvSDvgA7IZQz6cwvSvMDokagZdBUUTWXiyV+J3QChQP9c
        xJbior5x2ywe6r9opBBY/oYfm0RUFjN3LZCZC8ns5tnN2tFMrMknVvWMx6NhOQA54pOWAcmh7FMf/
        8WKUsLsgHsJ+S7rxW2LR3XUsTPf+aTOvMuR3bnS2mb3K6xdCJ5Veob4FtHRZQgj0BnddmR02dtADh
        XdKjyFlg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iyeIx-00031V-JY; Mon, 03 Feb 2020 16:10:31 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Brugger <matthias.bgg@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] watchdog: fix mtk_wdt.c RESET_CONTROLLER build error
Message-ID: <77c1e557-4941-3806-2933-6c3583576390@infradead.org>
Date:   Mon, 3 Feb 2020 08:10:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error when CONFIG_RESET_CONTROLLER is not set by
selecting RESET_CONTROLLER.

ld: drivers/watchdog/mtk_wdt.o: in function `mtk_wdt_probe':
mtk_wdt.c:(.text+0x3ec): undefined reference to `devm_reset_controller_register'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-watchdog@vger.kernel.org
---
 drivers/watchdog/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20200203.orig/drivers/watchdog/Kconfig
+++ linux-next-20200203/drivers/watchdog/Kconfig
@@ -841,6 +841,7 @@ config MEDIATEK_WATCHDOG
 	tristate "Mediatek SoCs watchdog support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select WATCHDOG_CORE
+	select RESET_CONTROLLER
 	help
 	  Say Y here to include support for the watchdog timer
 	  in Mediatek SoCs.


