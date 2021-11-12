Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA2C44E55F
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Nov 2021 12:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbhKLLNa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Nov 2021 06:13:30 -0500
Received: from [113.204.237.245] ([113.204.237.245]:41398 "EHLO
        test.cqplus1.com" rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234899AbhKLLNX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Nov 2021 06:13:23 -0500
X-Greylist: delayed 568 seconds by postgrey-1.27 at vger.kernel.org; Fri, 12 Nov 2021 06:13:22 EST
X-MailGates: (compute_score:DELIVER,40,3)
Received: from 172.28.114.216
        by cqmailgates with MailGates ESMTP Server V5.0(16723:0:AUTH_RELAY)
        (envelope-from <xt.hu@cqplus1.com>); Fri, 12 Nov 2021 19:00:23 +0800 (CST)
From:   Xiantao Hu <xt.hu@cqplus1.com>
To:     wim@linux-watchdog.org, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux@roeck-us.net, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     wells.lu@sunplus.com, qinjian@cqplus1.com,
        Xiantao Hu <xt.hu@cqplus1.com>
Subject: [PATCH 0/2] Add watchdog driver for Sunplus SP7021 SoC
Date:   Fri, 12 Nov 2021 18:59:50 +0800
Message-Id: <20211112105952.216280-1-xt.hu@cqplus1.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is a patch series for watchdog driver for Sunplus SP7021 SoC.

Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates
many peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD card and
etc.) into a single chip. It is designed for industrial control.

Refer to:
https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview
https://tibbo.com/store/plus1.html

Xiantao Hu (2):
  watchdog: Add watchdog driver for Sunplus SP7021
  dt-bindings: watchdog: Add Sunplus SP7021 WDT devicetree bindings
    documentation

 .../bindings/watchdog/sunplus,sp7021-wdt.yaml |  47 +++
 MAINTAINERS                                   |   7 +
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/sunplus_wdt.c                | 297 ++++++++++++++++++
 5 files changed, 363 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/sunplus,sp7021-wdt.yaml
 create mode 100644 drivers/watchdog/sunplus_wdt.c

-- 
2.33.1

