Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B67A0F49
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Aug 2019 03:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfH2Bxs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 28 Aug 2019 21:53:48 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34794 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfH2Bxs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 28 Aug 2019 21:53:48 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 087EE80719;
        Thu, 29 Aug 2019 13:53:45 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1567043625;
        bh=pp3rxRT3APMbwgJSZ/RSorT23ERlsGkaBhCe5D/Ga7U=;
        h=From:To:Cc:Subject:Date;
        b=lNJ9fe7lKUmjMV8HJqNVVY3Z8Zd6azkU/svJGPUMQ/AoUMmPAypjczCQLqj3ljD/s
         XGJgiQ7AMknk37h0dDyXocj1tiFIiXabzjwTvQIyYHHcy7MT+HmXOUmhvN3BPgAu5F
         YJye/jiAQIukgwhvJMee65WwIizjY7mnqbzZFqLRHiO1qVckjGoHORmBkQvzbS9U4/
         WCg1/yckw6WhU195O4pvz2jf2xuirg7dpo5u6iJEg18r3xljAXVAuVUuT6yNAi4tR9
         72f6B6jOkhLjNLfZ7t0sB/vjsVDzSsShh9iWb+eIv+bopJRP6O2fFYJHk3kHif2LWd
         AfgjRpZBrY7UQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d6730270000>; Thu, 29 Aug 2019 13:53:43 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 1910713EED5;
        Thu, 29 Aug 2019 13:53:46 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 125102819B0; Thu, 29 Aug 2019 13:53:43 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4] watchdog: orion_wdt: use timer1 as a pretimeout
Date:   Thu, 29 Aug 2019 13:53:39 +1200
Message-Id: <20190829015340.25323-1-chris.packham@alliedtelesis.co.nz>
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

This was submitted previously[1], the other patches two from the series h=
ave
been picked up but this one seems to have fallen through the gaps.

Changes in v3:
- rebase against linux/master
Changes in v2:
- apply changes to armada-38x only

[1] - https://lore.kernel.org/linux-watchdog/20190305201924.14853-4-chris=
.packham@alliedtelesis.co.nz/

 drivers/watchdog/orion_wdt.c | 59 ++++++++++++++++++++++++++++++------
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
index cdb0d174c5e2..f2e90bfd7186 100644
--- a/drivers/watchdog/orion_wdt.c
+++ b/drivers/watchdog/orion_wdt.c
@@ -46,6 +46,11 @@
 #define WDT_AXP_FIXED_ENABLE_BIT BIT(10)
 #define WDT_A370_EXPIRED	BIT(31)
=20
+#define TIMER1_VAL_OFF		0x001c
+#define TIMER1_ENABLE_BIT	BIT(2)
+#define TIMER1_FIXED_ENABLE_BIT	BIT(12)
+#define TIMER1_STATUS_BIT	BIT(8)
+
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
@@ -169,38 +175,48 @@ static int armadaxp_wdt_clock_init(struct platform_=
device *pdev,
 	}
=20
 	/* Enable the fixed watchdog clock input */
-	atomic_io_modify(dev->reg + TIMER_CTRL,
-			 WDT_AXP_FIXED_ENABLE_BIT,
-			 WDT_AXP_FIXED_ENABLE_BIT);
+	val =3D WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
+	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
=20
 	dev->clk_rate =3D clk_get_rate(dev->clk);
+
 	return 0;
 }
=20
 static int orion_wdt_ping(struct watchdog_device *wdt_dev)
 {
 	struct orion_watchdog *dev =3D watchdog_get_drvdata(wdt_dev);
+
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
 static int armada375_start(struct watchdog_device *wdt_dev)
 {
 	struct orion_watchdog *dev =3D watchdog_get_drvdata(wdt_dev);
-	u32 reg;
+	u32 reg, val;
=20
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
+	val =3D dev->data->wdt_enable_bit;
+	if (dev->wdt.info->options & WDIOF_PRETIMEOUT)
+		val |=3D TIMER1_ENABLE_BIT;
+	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
=20
 	/* Enable reset on watchdog */
 	reg =3D readl(dev->rstout);
@@ -277,7 +293,7 @@ static int orion_stop(struct watchdog_device *wdt_dev=
)
 static int armada375_stop(struct watchdog_device *wdt_dev)
 {
 	struct orion_watchdog *dev =3D watchdog_get_drvdata(wdt_dev);
-	u32 reg;
+	u32 reg, mask;
=20
 	/* Disable reset on watchdog */
 	atomic_io_modify(dev->rstout_mask, dev->data->rstout_mask_bit,
@@ -287,7 +303,10 @@ static int armada375_stop(struct watchdog_device *wd=
t_dev)
 	writel(reg, dev->rstout);
=20
 	/* Disable watchdog timer */
-	atomic_io_modify(dev->reg + TIMER_CTRL, dev->data->wdt_enable_bit, 0);
+	mask =3D dev->data->wdt_enable_bit;
+	if (wdt_dev->info->options & WDIOF_PRETIMEOUT)
+		mask +=3D TIMER1_ENABLE_BIT;
+	atomic_io_modify(dev->reg + TIMER_CTRL, mask, 0);
=20
 	return 0;
 }
@@ -349,7 +368,7 @@ static unsigned int orion_wdt_get_timeleft(struct wat=
chdog_device *wdt_dev)
 	return readl(dev->reg + dev->data->wdt_counter_offset) / dev->clk_rate;
 }
=20
-static const struct watchdog_info orion_wdt_info =3D {
+static struct watchdog_info orion_wdt_info =3D {
 	.options =3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
 	.identity =3D "Orion Watchdog",
 };
@@ -368,6 +387,16 @@ static irqreturn_t orion_wdt_irq(int irq, void *devi=
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
@@ -589,6 +618,18 @@ static int orion_wdt_probe(struct platform_device *p=
dev)
 		}
 	}
=20
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

