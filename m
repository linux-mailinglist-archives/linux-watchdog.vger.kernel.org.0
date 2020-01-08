Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9364D133EB4
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jan 2020 10:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgAHJ5N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jan 2020 04:57:13 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46723 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgAHJ5N (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jan 2020 04:57:13 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip85L-0003Iq-1U; Wed, 08 Jan 2020 10:57:07 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip85K-000678-3E; Wed, 08 Jan 2020 10:57:06 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, linux@roeck-us.net,
        robh+dt@kernel.org, lee.jones@linaro.org,
        stwiss.opensource@diasemi.com, Adam.Thomson.Opensource@diasemi.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/3] dt-bindings: watchdog: da9062: add suspend disable option
Date:   Wed,  8 Jan 2020 10:57:03 +0100
Message-Id: <20200108095704.23233-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108095704.23233-1-m.felsch@pengutronix.de>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Document the watchdog disable option which can be used if the hardware
automatic suspend option is broken.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/watchdog/da9062-wdt.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt b/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
index b935b526d2f3..950e4fba8dbc 100644
--- a/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
@@ -6,6 +6,11 @@ Required properties:
 	"dlg,da9061-watchdog", "dlg,da9062-watchdog"
 	"dlg,da9062-watchdog"
 
+Optional properties:
+- dlg,use-sw-pm: Add this property to disable the watchdog during suspend.
+	Only use this option if you can't use the watchdog automatic suspend
+	function during a suspend (see register CONTROL_B).
+
 Example: DA9062
 
 	pmic0: da9062@58 {
-- 
2.20.1

