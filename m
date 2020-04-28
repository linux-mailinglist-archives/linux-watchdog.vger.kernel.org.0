Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CBF1BCEAC
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Apr 2020 23:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgD1Va1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 17:30:27 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:56837 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgD1Va0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 17:30:26 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MIxBc-1jjZY348cM-00KTgy; Tue, 28 Apr 2020 23:30:02 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: iTCO: fix link error
Date:   Tue, 28 Apr 2020 23:29:11 +0200
Message-Id: <20200428212959.2993304-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B67SrUqOB9QyQpNkAUnJAxyQGtbsgsRckwvq7nUOyxAa1NIaEAa
 jTyPXX3yWUsdsT/C6Vl0l27sBiboHMzExTdPQMoMK0cf2ueP2kRi7L7RzEFnPQmJxKB36v0
 7KGf1KEEL76cSNUVIGtEjcHvSlIP9oQ5gJM08uKGLizKMR2AYwE6jTHwydX5iSLGWWX+W3d
 BaCf6YkQr9U4hGu6eou4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zrj2Ds8WBsA=:bbl9HaoipUDM+RSbgDxyaz
 pSx73ot5oTpM8zGDX7AvXQ9LvyCcIXTgOQFuGbxZo9QQ/kItWb3W7o+p9p4QRw1w5FvvGvaLq
 kJGGp9W5Z/a6Df6t2QMjXYrC3Ve24DKuSo3ggEoeLEwar2mgNujTGyQei1fw1gai39Qk/G8nP
 rsDnp1aOVfXimxsiFYHUccgndsCQvjsXdXWxPh3TRtAbeGXLP8wJ9qHNYBYuLRrf59MZtzQ9S
 fdzR2GxuRwltna7U+ZmuFChhiIHCjhe2ukklLIFOWo2KkQKQXi8Rx1W0uz8vKW4cKqR93WpgZ
 r+e1i4MTjiW+hFEa3ZMkvRHzVCx2fXVdn9bno7t7UI9UHdpxPz9DFruNxgC629i8lMkS/6H1O
 aXkd4W8BoVrCmxgTwvTSULbEpvZUH0jH7KMGvNz7hTKd+JnUimDj5DvPf4QoqAdYXWYgV1OYC
 u0mRZ73AM6ZBhJNvkEX11x01yPhqYqj6ycQ5IsrrEHiEYJOxACKDC3KwtqzcuonKYVS+GslZe
 ZHhpYVpNzwvC1hLgr7fc9zpaPnKsb7G0ajLPlGk1i+lwpkXEIaE7zG+kh83miD2XhgTSnyft4
 wO+khlYfugs/+4G0Mx8fwWR4fFNTCTv0SxMgjrVk7nVJDCvWwPEELePDCxjVNQlaEfUmwEFC3
 tbtiOOP1unToBqC2ghpV3b46VLjTHkJ6Flzgbb8+PJUTYVGL9+xd3RbD+DFnXPzPsXcytnW1G
 RqmXa5+82uNPtHWGVbaT5+NVCc25uIEIWC2fbJZOXdJxwDviZ/qDiosJPHzM9sua14o0yLFIX
 H+ZrD1qpLMgkbvmBskkQw0JE/brwCvMCqjYGBYRxQrx6mWdN+M=
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When the MFD driver is a loadable module, the watchdog driver fails
to get linked into the kernel:

drivers/watchdog/iTCO_wdt.o: In function `update_no_reboot_bit_pmc':
iTCO_wdt.c:(.text+0x54f): undefined reference to `intel_pmc_gcr_update'

The code is written to support operation without the MFD driver, so
add a Kconfig dependency that allows this, while disallowing the watchdog
to be built-in when the MFD driver is a module.

Fixes: 25f1ca31e230 ("platform/x86: intel_pmc_ipc: Convert to MFD")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 66ca69f30f01..67a83578810e 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1217,6 +1217,7 @@ config ITCO_WDT
 	depends on (X86 || IA64) && PCI
 	select WATCHDOG_CORE
 	depends on I2C || I2C=n
+	depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT
 	select LPC_ICH if !EXPERT
 	select I2C_I801 if !EXPERT && I2C
 	---help---
-- 
2.26.0

