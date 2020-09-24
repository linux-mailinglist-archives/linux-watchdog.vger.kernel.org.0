Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E13276F0E
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Sep 2020 12:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgIXKxF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 24 Sep 2020 06:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgIXKxF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 24 Sep 2020 06:53:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCCEC0613CE
        for <linux-watchdog@vger.kernel.org>; Thu, 24 Sep 2020 03:53:04 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kLOs0-00062Q-SC; Thu, 24 Sep 2020 12:53:00 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kLOry-0005Cb-PO; Thu, 24 Sep 2020 12:52:58 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/2] rtc: pcf2127: only use watchdog when explicitly available
Date:   Thu, 24 Sep 2020 12:52:54 +0200
Message-Id: <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924074715.GT9675@piout.net>
References: <20200924074715.GT9675@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

now that there are two people stumbling over the pcf2127 driver
providing a non-functional watchdog device, here comes an RFC patch to
address this.

Note this is only compile tested and dt-documentation is still missing.
Still send this series because the cleanup is nice independent of this
discussion and to have something to argue about.

Does someone can offer a better name than "has-watchdog", is there a
scheme that could be used already that I'm not aware of?

Best regards
Uwe

Uwe Kleine-König (2):
  rtc: pcf2127: move watchdog initialisation to a separate function
  [RFC] rtc: pcf2127: only use watchdog when explicitly available

 drivers/rtc/rtc-pcf2127.c | 57 ++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 25 deletions(-)

-- 
2.28.0

