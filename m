Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21AB0A2939
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2019 23:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbfH2Vwd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Aug 2019 17:52:33 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:36628 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbfH2Vwd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Aug 2019 17:52:33 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D8D7780719;
        Fri, 30 Aug 2019 09:52:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1567115548;
        bh=igW2Ks2efuhxj+CLPFiKe1nMvLY5OJpsKarMZTuKmBo=;
        h=From:To:Cc:Subject:Date;
        b=saB6woctGoUhDsGmNwQLhuOGOBNOB7Ko40dEPgraJ06bq9Xw4KCAiZZaieLupumvx
         OZ+y1FMKw1vkagcSN3xTn/TzDNxySKzKL9u45URKJhT7k+I85dph2xdTTXotO4sRaa
         GQl+3d3T2cyiWPPLaZoHL1me80aj7omfF3qva4jTXzo0vXbR405WtwLUhbqaCB8lVh
         M1izqPHeaxjGMU3X2ApFBJQYiDcVTAPgk4f8c/pzFgfqVlsxyVfH6QBozO+rTWun1Z
         JIQrVB4hCwu1tMG8EK7/WmOnMNx9hCPPBS/CADzRJdJH452ZI/QoIU8fYgsKjd4NRI
         1OT6Qv5RIbdJQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d68491c0000>; Fri, 30 Aug 2019 09:52:28 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id AAC7913EECA;
        Fri, 30 Aug 2019 09:52:31 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 9BA412819B1; Fri, 30 Aug 2019 09:52:28 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6] watchdog: orion_wdt: use timer1 as a pretimeout
Date:   Fri, 30 Aug 2019 09:52:24 +1200
Message-Id: <20190829215224.27956-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The orion watchdog can either reset the CPU or generate an interrupt.
The interrupt would be useful for debugging as it provides panic()
output about the watchdog expiry, however if the interrupt is used the
watchdog can't reset the CPU in the event of being stuck in a loop with
interrupts disabled or if the CPU is prevented from accessing memory
(e.g. an unterminated DMA).

The Armada SoCs have spare timers that aren't currently used by the
Linux kernel. We can use timer1 to provide a pre-timeout ahead of the
watchdog timer and provide the possibility of gathering debug before the
reset triggers.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v6:
- Fix bitwise operation in armada375_stop()
- Add comment about 2nd interrupt being optional
Changes in v5:
- Group bit values with register addresses
- Address review comments from Gunter
Changes in v3:
- rebase against linux/master
Changes in v2:
- apply changes to armada-38x only

 drivers/watchdog/orion_wdt.c | 66 +++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index cdb0d174c5e2..1cccf8eb1c5d 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -35,7 +35,15 @@
  * Watchdog timer block registers.
  */
 #define TIMER_CTRL		0x0000
-#define TIMER_A370_STATUS	0x04
+#define TIMER1_FIXED_ENABLE_BIT	BIT(12)
+#define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
+#define TIMER1_ENABLE_BIT	BIT(2)
+
+#define TIMER_A370_STATUS	0x0004
+#define WDT_A370_EXPIRED	BIT(31)
+#define TIMER1_STATUS_BIT	BIT(8)
+
+#define TIMER1_VAL_OFF		0x001c
=20
 #define WDT_MAX_CYCLE_COUNT	0xffffffff
=20
@@ -43,9 +51,6 @@
 #define WDT_A370_RATIO_SHIFT	5
 #define WDT_A370_RATIO		(1 << WDT_A370_RATIO_SHIFT)
=20
-#define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
-#define WDT_A370_EXPIRED	BIT(31)
-
 static bool nowayout =3D WATCHDOG_NOWAYOUT;
 static int heartbeat =3D -1;		/* module parameter (seconds) */
=20
@@ -158,6 +163,7 @@ static int armadaxp_wdt_clock_init(struct platform_de=
vice *pdev,
 				   struct orion_watchdog *dev)
 {
 	int ret;
+	u32 val;
=20
 	dev->clk =3D of_clk_get_by_name(pdev->dev.of_node, "fixed");
 	if (IS_ERR(dev->clk))
@@ -168,10 +174,9 @@ static int armadaxp_wdt_clock_init(struct platform_d=
evice *pdev,
 		return ret;
 	}
=20
-	/* Enable the fixed watchdog clock input */
-	atomic_io_modify(dev->reg + TIMER_CTRL,
-			 WDT_AXP_FIXED_ENABLE_BIT,
-			 WDT_AXP_FIXED_ENABLE_BIT);
+	/* Fix the wdt and timer1 clock freqency to 25MHz */
+	val =3D WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
+	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
=20
 	dev->clk_rate =3D clk_get_rate(dev->clk);
 	return 0;
@@ -183,6 +188,10 @@ static int orion_wdt_ping(struct watchdog_device *wd=
t_dev)
 	/* Reload watchdog duration */
 	writel(dev->clk_rate * wdt_dev->timeout,
 	       dev->reg + dev->data->wdt_counter_offset);
+	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
+		writel(dev->clk_rate * (wdt_dev->timeout - wdt_dev->pretimeout),
+		       dev->reg + TIMER1_VAL_OFF);
+
 	return 0;
 }
=20
@@ -194,13 +203,18 @@ static int armada375_start(struct watchdog_device *=
wdt_dev)
 	/* Set watchdog duration */
 	writel(dev->clk_rate * wdt_dev->timeout,
 	       dev->reg + dev->data->wdt_counter_offset);
+	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
+		writel(dev->clk_rate * (wdt_dev->timeout - wdt_dev->pretimeout),
+		       dev->reg + TIMER1_VAL_OFF);
=20
 	/* Clear the watchdog expiration bit */
 	atomic_io_modify(dev->reg + TIMER_A370_STATUS, WDT_A370_EXPIRED, 0);
=20
 	/* Enable watchdog timer */
-	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit,
-						dev->data->wdt_enable_bit);
+	reg =3D dev->data->wdt_enable_bit;
+	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
+		reg |=3D TIMER1_ENABLE_BIT;
+	atomic_io_modify(dev->reg + TIMER_CTRL, reg, reg);
=20
 	/* Enable reset on watchdog */
 	reg =3D readl(dev->rstout);
@@ -277,7 +291,7 @@ static int orion_stop(struct watchdog_device *wdt_dev=
)
 static int armada375_stop(struct watchdog_device *wdt_dev)
 {
 	struct orion_watchdog *dev =3D watchdog_get_drvdata(wdt_dev);
-	u32 reg;
+	u32 reg, mask;
=20
 	/* Disable reset on watchdog */
 	atomic_io_modify(dev->rstout_mask, dev->data->rstout_mask_bit,
@@ -287,7 +301,10 @@ static int armada375_stop(struct watchdog_device *wd=
t_dev)
 	writel(reg, dev->rstout);
=20
 	/* Disable watchdog timer */
-	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit, 0);
+	mask =3D dev->data->wdt_enable_bit;
+	if (wdt_dev->info->options & WDIOF_PRETIMEOUT)
+		mask |=3D TIMER1_ENABLE_BIT;
+	atomic_io_modify(dev->reg + TIMER_CTRL, mask, 0);
=20
 	return 0;
 }
@@ -349,7 +366,7 @@ static unsigned int orion_wdt_get_timeleft(struct wat=
chdog_device *wdt_dev)
 	return readl(dev->reg + dev->data->wdt_counter_offset) / dev->clk_rate;
 }
=20
-static const struct watchdog_info orion_wdt_info =3D {
+static struct watchdog_info orion_wdt_info =3D {
 	.options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
 	.identity =3D "Orion Watchdog",
 };
@@ -368,6 +385,16 @@ static irqreturn_t orion_wdt_irq(int irq, void *devi=
d)
 	return IRQ_HANDLED;
 }
=20
+static irqreturn_t orion_wdt_pre_irq(int irq, void *devid)
+{
+	struct orion_watchdog *dev =3D devid;
+
+	atomic_io_modify(dev->reg + TIMER_A370_STATUS,
+			 TIMER1_STATUS_BIT, 0);
+	watchdog_notify_pretimeout(&dev->wdt);
+	return IRQ_HANDLED;
+}
+
 /*
  * The original devicetree binding for this driver specified only
  * one memory resource, so in order to keep DT backwards compatibility
@@ -589,6 +616,19 @@ static int orion_wdt_probe(struct platform_device *p=
dev)
 		}
 	}
=20
+	/* Optional 2nd interrupt for pretimeout */
+	irq =3D platform_get_irq(pdev, 1);
+	if (irq > 0) {
+		orion_wdt_info.options |=3D WDIOF_PRETIMEOUT;
+		ret =3D devm_request_irq(&pdev->dev, irq, orion_wdt_pre_irq,
+				       0, pdev->name, dev);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to request IRQ\n");
+			goto disable_clk;
+		}
+	}
+
+
 	watchdog_set_nowayout(&dev->wdt, nowayout);
 	ret =3D watchdog_register_device(&dev->wdt);
 	if (ret)
--=20
2.23.0

