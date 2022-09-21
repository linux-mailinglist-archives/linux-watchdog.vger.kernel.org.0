Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41775BFF71
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Sep 2022 16:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiIUOBQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Sep 2022 10:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiIUOBC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Sep 2022 10:01:02 -0400
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C5B8673F
        for <linux-watchdog@vger.kernel.org>; Wed, 21 Sep 2022 07:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=C+EGZMzTeXqdN3NfIzPf0rzBIQPXMtI5TJQ9gj0c6Q4=; b=DcpIYXEIQqF4i7WCjJPEIQG+/d
        wWczPNkrhSHsMzdEDhMwfuvwntAldsIcHFbwIc8bQRlwWUZ7DEFEi0dbp91ejjvZEG8XbMHV00s4h
        oP+lO5jVGz85USsmK30n+gxTdydKUmWaiBrqLd2sC2xWTUz1Ow6zMJQljkqUXdW+0qs0DOvDkkwBP
        T7tKNUUtogVSqqXSIy9slaYsbvYniVnpVHKCESElEpC2EMvmlmdg+0Ccjra3N7wsDT3U1gGx9uKi5
        4GcYoN2Aen13HPuKzwlYrpcsDn4/bO/iLXj9oCff3hEs9foDJr16BUPChiDkHBjBjW+p8srtVM6IU
        FQHB1KQA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50376 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.95)
        (envelope-from <andrej.picej@norik.com>)
        id 1oaz7u-00Etmy-UI;
        Wed, 21 Sep 2022 14:46:54 +0200
From:   Andrej Picej <andrej.picej@norik.com>
To:     linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
Subject: [RFC PATCH 0/1] Suspending i.MX watchdog in WAIT mode
Date:   Wed, 21 Sep 2022 14:46:46 +0200
Message-Id: <20220921124647.1521667-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi all,

we are using i.MX6UL with its watchdog WDOG1 and kernel 5.15.62. It was
discovered that the watchdog triggers reset when the device is put into
'Suspend-To-Idle' (WAIT) state.

i.MX6UL watchdog has a WDW (Watchdog Disable for Wait) bit in WCR
(Watchdog Control Register) which can put the watchdog in suspend when
the device is put to WAIT mode. Similarly, WDZST bit is already set in
imx2_wdt driver by default, which suspends the watchdog in STOP and DOZE
modes.

This RFC patch suspends watchdog when the device is in WAIT mode, which
fixes our problem. During development, we noticed some reports where
setting WDW bit caused inconsistent timeout events or inability of
watchdog to reset the board. We didn't have these problems but I am
curious if there is a case where device is put into WAIT mode and
watchdog should be enabled?

Maybe for cases where watchdog is used for WAIT mode supervision? So
basically to reset the system if device doesn't exit WAIT mode on its
own?

The problem can be recreated with:

	imx6ul-dev:~# echo freeze > /sys/power/state 
	[  101.093336] PM: suspend entry (s2idle)
	[  101.097785] Filesystems sync: 0.000 seconds
	[  101.122295] Freezing user space processes ... (elapsed 0.001 seconds) done.
	[  101.130637] OOM killer disabled.
	[  101.133998] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
	[  101.142941] printk: Suspending console(s) (use no_console_suspend to debug)
	...
Device resets after watchdog timeout expires! ~105s

Thank you for your feedback.

Best regards,
Andrej

Andrej Picej (1):
  watchdog: imx2_wdg: suspend watchdog in WAIT mode

 drivers/watchdog/imx2_wdt.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1

