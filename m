Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B3C2ECA8F
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Jan 2021 07:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbhAGGiP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Jan 2021 01:38:15 -0500
Received: from mail-lf1-f54.google.com ([209.85.167.54]:43834 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbhAGGiP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Jan 2021 01:38:15 -0500
Received: by mail-lf1-f54.google.com with SMTP id 23so12105971lfg.10;
        Wed, 06 Jan 2021 22:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ck++y5Feh91jiOvRScUEvnGd3M5vPkF/bZjgY6vW3Q8=;
        b=i6jTleOuNSBo7FJBBu0TlmGFbmq1rZzBr6ucciz70e3p7ST5C0+rwpS+/ZrcXJOElZ
         hoAFJWUtN2K1r4eeLZ1n5Zt7oU8BaBYjJ97XoalM9fm/sOFl+8MPckM30hmIIR2m0diN
         ewONjKS5KN1YNpRSs4ZmISs17ypr0nCSSKDnWNPWyM8mHoqAt5CggCV4A8Sv8a6CfVq3
         cRffdOC6XsFsj1Zn5/A46wON5+YyBgUBATzoEtswyuflrvIzhdC1ePwkXRqYN86UtS0g
         p5lKJo7gZFaLgdhvicvqCMAiPR8zECGChEXpg5JERFZEVU2oadmUzI5gtDAoSTqk2EiN
         dFlQ==
X-Gm-Message-State: AOAM531l/slUvu6QpUrKXYVyiUzE40CWtuPY10PfC6OtMlxepv0w8FHF
        ps06t+EmJuBDr/KXMjcmhn+ZP4cJVPY=
X-Google-Smtp-Source: ABdhPJwLZv/Co8Bk6wTUARStsieeclPeKUBRVY217meVgJzXiTVacF8B/i0KL6vJ7fBEqel58E3lnA==
X-Received: by 2002:a2e:870d:: with SMTP id m13mr3346818lji.136.1610001452821;
        Wed, 06 Jan 2021 22:37:32 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id z23sm912912lfi.1.2021.01.06.22.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 22:37:32 -0800 (PST)
Date:   Thu, 7 Jan 2021 08:37:25 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] watchdog: BD70528: conditionally allow BD70528 module
Message-ID: <019c196041600a00143fe16bda19b2a8f060e9a9.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
References: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <671ac57ad53ab1614da7fe9a3d0f78bdb5b51fda.1610001365.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The BD70528 watchdog module provides start/stop interface for RTC
driver because the BD70528 watchdog must be stopped when RTC time
is set. (WDG uses RTC counter and setting RTC may accidentally trigger
WDG if WDG is enabled). The BD71828 use same RTC driver as BD70528 but
don't share same WDG logic. When BD70528 is not configured a stub call
to "stop WDG" is implemented and in case when BD71828 is used, this
stub function should be called. Prevent configuring in the BD70528
watchdog when BD71828 is configured to avoid access to real WDG
functions when WDG does not exist in HW.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index fd7968635e6d..40e1b4c69537 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -163,6 +163,7 @@ config SOFT_WATCHDOG_PRETIMEOUT
 config BD70528_WATCHDOG
 	tristate "ROHM BD70528 PMIC Watchdog"
 	depends on MFD_ROHM_BD70528
+	depends on MFD_ROHM_BD71828 = n
 	select WATCHDOG_CORE
 	help
 	  Support for the watchdog in the ROHM BD70528 PMIC. Watchdog trigger
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
