Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5BC797F83
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 17:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfHUP5t (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Aug 2019 11:57:49 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:58328 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727554AbfHUP5r (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Aug 2019 11:57:47 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id BA4B042ED0;
        Wed, 21 Aug 2019 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:date:date:from:from:subject:subject
        :message-id:received:received:received; s=mta-01; t=1566403064;
         x=1568217465; bh=cUjJrAB3OomH4KewIUgBh/9D64kXv5bgtvG9RSiYgKo=; b=
        NjpiNNiB5Yy83fB0V2C9/T1tieBZ9CXFUSnI+CZsrQcXFjbCfKXVXs6dPoS/CbQl
        QcHcLUIYSQxeTnJWBro3TCyFxonJyGcG6G9WmDsa3/+joAi4f36z/eqyfxSA2hvp
        SKdR4ClCZ+QBkhrlS3bul8MLPluqAQueUhC9fhGy7I0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kvGBZuanyL5B; Wed, 21 Aug 2019 18:57:44 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 845234120B;
        Wed, 21 Aug 2019 18:57:44 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 21 Aug 2019 18:57:43 +0300
Message-ID: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
Subject: [PATCH 3/3] watchdog/aspeed: add support for dual boot
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        "Alexander Amelkin" <a.amelkin@yadro.com>
Date:   Wed, 21 Aug 2019 18:57:43 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
to clear out boot code source and re-enable access to the primary SPI flash
chip while booted via wdt2 from the alternate chip.

AST2400 datasheet says:
"In the 2nd flash booting mode, all the address mapping to CS0# would be
re-directed to CS1#. And CS0# is not accessable under this mode. To access
CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
register WDT30.bit[1]."

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 drivers/watchdog/aspeed_wdt.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index cc71861e033a..858e62f1c7ba 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -53,6 +53,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CTRL_ENABLE		BIT(0)
 #define WDT_TIMEOUT_STATUS	0x10
 #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
+#define WDT_CLEAR_TIMEOUT_STATUS	0x14
+#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -165,6 +167,29 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	return 0;
 }
 
+static ssize_t access_cs0_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
+
+	if (unlikely(!wdt))
+		return -ENODEV;
+
+	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
+			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
+	wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+
+	return size;
+}
+static DEVICE_ATTR_WO(access_cs0);
+
+static struct attribute *bswitch_attrs[] = {
+	&dev_attr_access_cs0.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(bswitch);
+
 static const struct watchdog_ops aspeed_wdt_ops = {
 	.start		= aspeed_wdt_start,
 	.stop		= aspeed_wdt_stop,
@@ -223,6 +248,9 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
 
+	if (of_property_read_bool(np, "aspeed,alt-boot"))
+		wdt->wdd.groups = bswitch_groups;
+
 	/*
 	 * Control reset on a per-device basis to ensure the
 	 * host is not affected by a BMC reboot
@@ -309,6 +337,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
 		wdt->wdd.bootstatus = WDIOF_CARDRESET;
 
+	dev_set_drvdata(dev, wdt);
+
 	return devm_watchdog_register_device(dev, &wdt->wdd);
 }
 
-- 
2.20.1


