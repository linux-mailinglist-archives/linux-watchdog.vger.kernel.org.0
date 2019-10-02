Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86CE7C489F
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 09:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfJBHfa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Oct 2019 03:35:30 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:51916 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfJBHf3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Oct 2019 03:35:29 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: GmVaz8JCo8Ek6wEL2YZuaA1Cb5HINR8S8yhsduACd5SqUcnE8uoLmo6IP75ZOGvPjL9+pgecxL
 Gc3xJaBO8//tDOtE6QJaV2DjeWw79k6y4y5X+NnUEEvfEwqKo2hAoGQOastM3GvcsQQOiWIGxq
 C4bcpEDmC/uB1kVD50gwCMrYOT11F9SwXiUzPUdw+nZLT0k1TJVGkgAnb+gRmGBViOJFgYVSSc
 +glMgi4RGR203P4IkKWSrKIWyWFbr2/kN4A4KGsyLap/alAjWC6NIzOA2j+H8wvufqandyk2J+
 +iA=
X-IronPort-AV: E=Sophos;i="5.64,573,1559545200"; 
   d="scan'208";a="48456633"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Oct 2019 00:35:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Oct 2019 00:35:27 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 2 Oct 2019 00:35:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epUpH98SmvAwTSuKLHtCifhO29HYJiGRckFxy1htSTeikE3wzHidIsLmf+WsBNcON7EetqDzyWgcXg/OSt2Ux0RoUPMJD2RJYcB6oTZMnZcLAq+zQ6zVFvyTpP4BcTeQw6IOYHR3EztvKXL/ky/ehYMjQdYs8+lwIW3sM3av1FHT6Aq5FjrD6CaO1BoSywR1QZNTe3ZfQfyyvlMVok+8pSjNq7ctVdNJgDaE17WbkLd7zKkKglOI5krHOnfZyPbnKKIzg8lkHTGsF68Fy/gu3Ofy4JUETutH3iEyMZxb/AzZpPVWP/6H9NXlLww1AT937mHT80cQGxYdRrEGaTke5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H58Knc5bLxImgSogul4h7ahs2TxO49+5+Y6rfSKJHUg=;
 b=X29peGispt0kGCYctTMBAGZVzEbw4xSxUT3eaxeszSvopReaTkiduzvLp/FldwMscY0J9bsJQsFjhb6JHJPwILLIDEtTgGPXjJdTNxzUdacdvuUwJzfv+o9fkUz+vg8GfHtOgiY+aeLc1zgYGH/tfB1edgjX8y92nCyg5Zj5rMw3NyMx2gS9vPnWcP7GwKA7aF+pO3rzlevBHs2M3afXuYkAHEGx2zx6U6IYas0tGSTrJmiIx5uhyN9t0oeLlVzKkLh2lap8X4t/31H814e4qooJs7NQ7rDVU+aL32B2GHo7xn0xIBXcojk+vgPcbvKi99Zs8yAQRCpFJywVMp/pog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H58Knc5bLxImgSogul4h7ahs2TxO49+5+Y6rfSKJHUg=;
 b=eSVcxD+Bf2yVFrIXMkGveah/pfAvOxEto1Q7BnTDGv6czaMIvycm2/VXQEmS6EpzShOruDhuQekdMFCUZuUm+Mc3w+1EH2/pfjwjIubuUnX+V3UpqN5pKAycTDmb/ugiSvgPRJ7EQdfe65V2G4EFIbWv3g/xV3V6DfAdXAPJtR8=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1434.namprd11.prod.outlook.com (10.172.36.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 07:35:26 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 07:35:26 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.or>
CC:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH 2/3] watchdog: sam9x60_wdt: introduce sam9x60 watchdog timer
 driver
Thread-Topic: [PATCH 2/3] watchdog: sam9x60_wdt: introduce sam9x60 watchdog
 timer driver
Thread-Index: AQHVePP1mVCAVHNqYEKA4n6lujXEMQ==
Date:   Wed, 2 Oct 2019 07:35:26 +0000
Message-ID: <1570001371-8174-2-git-send-email-eugen.hristev@microchip.com>
References: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0003.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::13) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e1df5c1-4e4f-4df7-2d74-08d7470b178a
x-ms-traffictypediagnostic: DM5PR11MB1434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1434658FF011A13FDE2E657CE89C0@DM5PR11MB1434.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(376002)(396003)(366004)(136003)(199004)(189003)(3846002)(66066001)(7736002)(6116002)(6486002)(256004)(14444005)(2201001)(25786009)(305945005)(26005)(36756003)(2501003)(486006)(86362001)(8936002)(446003)(6436002)(11346002)(186003)(2616005)(476003)(81166006)(81156014)(71190400001)(71200400001)(99286004)(110136005)(316002)(102836004)(8676002)(2906002)(5660300002)(66476007)(6512007)(64756008)(66446008)(66556008)(54906003)(66946007)(478600001)(107886003)(30864003)(4326008)(76176011)(14454004)(6506007)(386003)(50226002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1434;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MuZRZki8seKVkJQPx3rxZ/nxYuqoEwKwZEh2Tgu5jVHb4BEg+Z5Jjc+mhTSPWkVTgS8IG6QT1bvetUP5n7TYvvHatfi1KM9CnK9Xw5IpQiF1EEBEM9ZjWUckT9rVmRAlcv+5J+9BkJCZVKXnXQA2a+HldA+Ei2wTiqvHbIQVSKgFrjaI3yilcOvtH9NeuqbnWhT5jNBbEcf5U1gXc/fkESsD2T+TMtAQz241PvG2C/DUGrPu1H8/NM0kxvbXtGh9uguu6YSBQdCPcO2u7X6gh4/IMK6pqezPYUP8xhyMdDi4CIXytMUuvjPgiH4AswJTwWE36/OSzmbdX/vW8xMfprpOn9spbW0xQFlEYbn0irKPIBa8B+ldsi7unOjjJvqLHE3RzP34gHf2ggulbrAqQOqH14pBY/7NSHWR16TVWhg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1df5c1-4e4f-4df7-2d74-08d7470b178a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 07:35:26.3657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/X6Nk9G+6wUh5mAhhUH5MK8eYSgiS2fWTR3HDdVbi5coB7DcgUYvaJwu5JC9/MlGe5VTLaWH2ik0B3AkEeaKMN9P8dovmeQ0sOxpQ/0b4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1434
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

This is the driver for SAM9X60 watchdog timer.
The offered functionality is the same as sama5d4_wdt.
The difference comes in register map, way to configure the timeout and
interrupts.
Developed starting from sama5d4_wdt.c

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/watchdog/Kconfig       |   9 ++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/sam9x60_wdt.c | 335 +++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 345 insertions(+)
 create mode 100644 drivers/watchdog/sam9x60_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 58e7c10..3562e26 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -416,6 +416,15 @@ config SAMA5D4_WATCHDOG
 	  Its Watchdog Timer Mode Register can be written more than once.
 	  This will reboot your system when the timeout is reached.
=20
+config SAM9X60_WATCHDOG
+	tristate "Microchip SAM9X60 Watchdog Timer"
+	depends on ARCH_AT91 || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  Microchip SAM9X60 watchdog timer is embedded into SAM9X60 chips.
+	  Its Watchdog Timer Mode Register can be written more than once.
+	  This will reboot your system when the timeout is reached.
+
 config CADENCE_WATCHDOG
 	tristate "Cadence Watchdog Timer"
 	depends on HAS_IOMEM
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 2ee352b..93ba599 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_IXP4XX_WATCHDOG) +=3D ixp4xx_wdt.o
 obj-$(CONFIG_S3C2410_WATCHDOG) +=3D s3c2410_wdt.o
 obj-$(CONFIG_SA1100_WATCHDOG) +=3D sa1100_wdt.o
 obj-$(CONFIG_SAMA5D4_WATCHDOG) +=3D sama5d4_wdt.o
+obj-$(CONFIG_SAM9X60_WATCHDOG) +=3D sam9x60_wdt.o
 obj-$(CONFIG_DW_WATCHDOG) +=3D dw_wdt.o
 obj-$(CONFIG_EP93XX_WATCHDOG) +=3D ep93xx_wdt.o
 obj-$(CONFIG_PNX4008_WATCHDOG) +=3D pnx4008_wdt.o
diff --git a/drivers/watchdog/sam9x60_wdt.c b/drivers/watchdog/sam9x60_wdt.=
c
new file mode 100644
index 00000000..f612230
--- /dev/null
+++ b/drivers/watchdog/sam9x60_wdt.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Microchip SAM9X60 Watchdog Timer
+ *
+ * Copyright (C) 2019 Microchip Technology, Inc.
+ * Author: Eugen Hristev <eugen.hristev@microchip.com>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/watchdog.h>
+
+#define AT91_WDT_CR		0x00			/* Watchdog Control Register */
+#define		AT91_WDT_WDRSTT		BIT(0)		/* Restart */
+#define		AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
+
+#define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
+#define		AT91_WDT_PERIODRST	BIT(4)		/* Period Reset */
+#define		AT91_WDT_RPTHRST	BIT(5)		/* Minimum Restart Period */
+#define		AT91_WDT_WDDIS		BIT(12)		/* Disable */
+#define		AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
+#define		AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
+
+#define AT91_WDT_VR		0x08			/* Watchdog Timer Value Register */
+
+#define AT91_WDT_WLR		0x0c
+#define		AT91_WDT_COUNTER	(0xfff << 0)		/* Watchdog Period Value */
+#define		AT91_WDT_SET_COUNTER(x)	((x) & AT91_WDT_COUNTER)
+
+#define AT91_WDT_IER		0x14			/* Interrupt Enable Register */
+#define		AT91_WDT_PERINT		BIT(0)		/* Period Interrupt Enable */
+#define AT91_WDT_IDR		0x18			/* Interrupt Disable Register */
+#define AT91_WDT_ISR		0x1c			/* Interrupt Status Register */
+
+/* minimum and maximum watchdog timeout, in seconds */
+#define MIN_WDT_TIMEOUT		1
+#define MAX_WDT_TIMEOUT		16
+#define WDT_DEFAULT_TIMEOUT	MAX_WDT_TIMEOUT
+
+#define WDT_SEC2TICKS(s)	((s) ? (((s) << 8) - 1) : 0)
+
+struct sam9x60_wdt {
+	struct watchdog_device	wdd;
+	void __iomem		*reg_base;
+	u32			mr;
+	u32			ir;
+	unsigned long		last_ping;
+};
+
+static int wdt_timeout;
+static bool nowayout =3D WATCHDOG_NOWAYOUT;
+
+module_param(wdt_timeout, int, 0);
+MODULE_PARM_DESC(wdt_timeout,
+		 "Watchdog timeout in seconds. (default =3D "
+		 __MODULE_STRING(WDT_DEFAULT_TIMEOUT) ")");
+
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		 "Watchdog cannot be stopped once started (default=3D"
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+#define wdt_enabled (!(wdt->mr & AT91_WDT_WDDIS))
+
+#define wdt_read(wdt, field) \
+	readl_relaxed((wdt)->reg_base + (field))
+
+/* 4 slow clock periods is 4/32768 =3D 122.07us*/
+#define WDT_DELAY	usecs_to_jiffies(123)
+
+static void wdt_write(struct sam9x60_wdt *wdt, u32 field, u32 val)
+{
+	/*
+	 * WDT_CR and WDT_MR must not be modified within three slow clock
+	 * periods following a restart of the watchdog performed by a write
+	 * access in WDT_CR.
+	 */
+	while (time_before(jiffies, wdt->last_ping + WDT_DELAY))
+		usleep_range(30, 125);
+	writel_relaxed(val, wdt->reg_base + field);
+	wdt->last_ping =3D jiffies;
+}
+
+static void wdt_write_nosleep(struct sam9x60_wdt *wdt, u32 field, u32 val)
+{
+	if (time_before(jiffies, wdt->last_ping + WDT_DELAY))
+		usleep_range(123, 250);
+	writel_relaxed(val, wdt->reg_base + field);
+	wdt->last_ping =3D jiffies;
+}
+
+static int sam9x60_wdt_start(struct watchdog_device *wdd)
+{
+	struct sam9x60_wdt *wdt =3D watchdog_get_drvdata(wdd);
+
+	wdt->mr &=3D ~AT91_WDT_WDDIS;
+	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
+	wdt_write_nosleep(wdt, AT91_WDT_IER, wdt->ir);
+
+	return 0;
+}
+
+static int sam9x60_wdt_stop(struct watchdog_device *wdd)
+{
+	struct sam9x60_wdt *wdt =3D watchdog_get_drvdata(wdd);
+
+	wdt->mr |=3D AT91_WDT_WDDIS;
+	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
+	wdt_write_nosleep(wdt, AT91_WDT_IDR, wdt->ir);
+
+	return 0;
+}
+
+static int sam9x60_wdt_ping(struct watchdog_device *wdd)
+{
+	struct sam9x60_wdt *wdt =3D watchdog_get_drvdata(wdd);
+
+	wdt_write(wdt, AT91_WDT_CR, AT91_WDT_KEY | AT91_WDT_WDRSTT);
+
+	return 0;
+}
+
+static int sam9x60_wdt_set_timeout(struct watchdog_device *wdd,
+				   unsigned int timeout)
+{
+	struct sam9x60_wdt *wdt =3D watchdog_get_drvdata(wdd);
+
+	wdt_write(wdt, AT91_WDT_WLR,
+		  AT91_WDT_SET_COUNTER(WDT_SEC2TICKS(timeout)));
+
+	wdd->timeout =3D timeout;
+
+	return 0;
+}
+
+static const struct watchdog_info sam9x60_wdt_info =3D {
+	.options =3D WDIOF_SETTIMEOUT | WDIOF_MAGICCLOSE | WDIOF_KEEPALIVEPING,
+	.identity =3D "Microchip SAM9X60 Watchdog",
+};
+
+static const struct watchdog_ops sam9x60_wdt_ops =3D {
+	.owner =3D THIS_MODULE,
+	.start =3D sam9x60_wdt_start,
+	.stop =3D sam9x60_wdt_stop,
+	.ping =3D sam9x60_wdt_ping,
+	.set_timeout =3D sam9x60_wdt_set_timeout,
+};
+
+static irqreturn_t sam9x60_wdt_irq_handler(int irq, void *dev_id)
+{
+	struct sam9x60_wdt *wdt =3D platform_get_drvdata(dev_id);
+
+	if (wdt_read(wdt, AT91_WDT_ISR)) {
+		pr_crit("Microchip Watchdog Software Reset\n");
+		emergency_restart();
+		pr_crit("Reboot didn't succeed\n");
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int of_sam9x60_wdt_init(struct device_node *np, struct sam9x60_wdt =
*wdt)
+{
+	const char *tmp;
+
+	wdt->mr =3D AT91_WDT_WDDIS;
+
+	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
+	    !strcmp(tmp, "software"))
+		wdt->ir =3D AT91_WDT_PERINT;
+	else
+		wdt->mr |=3D AT91_WDT_PERIODRST;
+
+	if (of_property_read_bool(np, "atmel,idle-halt"))
+		wdt->mr |=3D AT91_WDT_WDIDLEHLT;
+
+	if (of_property_read_bool(np, "atmel,dbg-halt"))
+		wdt->mr |=3D AT91_WDT_WDDBGHLT;
+
+	return 0;
+}
+
+static int sam9x60_wdt_init(struct sam9x60_wdt *wdt)
+{
+	u32 reg;
+	/*
+	 * When booting and resuming, the bootloader may have changed the
+	 * watchdog configuration.
+	 * If the watchdog is already running, we can safely update it.
+	 * Else, we have to disable it properly.
+	 */
+	if (wdt_enabled) {
+		wdt_write_nosleep(wdt, AT91_WDT_MR, wdt->mr);
+		wdt_write_nosleep(wdt, AT91_WDT_IER, wdt->ir);
+		wdt_write(wdt, AT91_WDT_WLR,
+			  AT91_WDT_SET_COUNTER(WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT)));
+
+	} else {
+		reg =3D wdt_read(wdt, AT91_WDT_MR);
+		if (!(reg & AT91_WDT_WDDIS))
+			wdt_write_nosleep(wdt, AT91_WDT_MR,
+					  reg | AT91_WDT_WDDIS);
+	}
+	return 0;
+}
+
+static int sam9x60_wdt_probe(struct platform_device *pdev)
+{
+	struct watchdog_device *wdd;
+	struct sam9x60_wdt *wdt;
+	struct resource *res;
+	void __iomem *regs;
+	u32 irq =3D 0;
+	int ret;
+
+	wdt =3D devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	wdd =3D &wdt->wdd;
+	wdd->timeout =3D WDT_DEFAULT_TIMEOUT;
+	wdd->info =3D &sam9x60_wdt_info;
+	wdd->ops =3D &sam9x60_wdt_ops;
+	wdd->min_timeout =3D MIN_WDT_TIMEOUT;
+	wdd->max_timeout =3D MAX_WDT_TIMEOUT;
+	wdt->last_ping =3D jiffies;
+
+	watchdog_set_drvdata(wdd, wdt);
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs =3D devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	wdt->reg_base =3D regs;
+
+	irq =3D irq_of_parse_and_map(pdev->dev.of_node, 0);
+	if (!irq)
+		dev_warn(&pdev->dev, "failed to get IRQ from DT\n");
+
+	ret =3D of_sam9x60_wdt_init(pdev->dev.of_node, wdt);
+	if (ret)
+		return ret;
+
+	if ((wdt->ir & AT91_WDT_PERINT) && irq) {
+		ret =3D devm_request_irq(&pdev->dev, irq, sam9x60_wdt_irq_handler,
+				       IRQF_SHARED | IRQF_IRQPOLL |
+				       IRQF_NO_SUSPEND, pdev->name, pdev);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"cannot register interrupt handler\n");
+			return ret;
+		}
+	}
+
+	watchdog_init_timeout(wdd, wdt_timeout, &pdev->dev);
+
+	ret =3D sam9x60_wdt_init(wdt);
+	if (ret)
+		return ret;
+
+	watchdog_set_nowayout(wdd, nowayout);
+
+	ret =3D watchdog_register_device(wdd);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register watchdog device\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, wdt);
+
+	dev_info(&pdev->dev, "initialized (timeout =3D %d sec, nowayout =3D %d)\n=
",
+		 wdd->timeout, nowayout);
+
+	return 0;
+}
+
+static int sam9x60_wdt_remove(struct platform_device *pdev)
+{
+	struct sam9x60_wdt *wdt =3D platform_get_drvdata(pdev);
+
+	sam9x60_wdt_stop(&wdt->wdd);
+
+	watchdog_unregister_device(&wdt->wdd);
+
+	return 0;
+}
+
+static const struct of_device_id sam9x60_wdt_of_match[] =3D {
+	{ .compatible =3D "microchip,sam9x60-wdt", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sam9x60_wdt_of_match);
+
+#ifdef CONFIG_PM_SLEEP
+static int sam9x60_wdt_resume(struct device *dev)
+{
+	struct sam9x60_wdt *wdt =3D dev_get_drvdata(dev);
+
+	/*
+	 * FIXME: writing MR also pings the watchdog which may not be desired.
+	 * This should only be done when the registers are lost on suspend but
+	 * there is no way to get this information right now.
+	 */
+	sam9x60_wdt_init(wdt);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(sam9x60_wdt_pm_ops, NULL,
+			 sam9x60_wdt_resume);
+
+static struct platform_driver sam9x60_wdt_driver =3D {
+	.probe		=3D sam9x60_wdt_probe,
+	.remove		=3D sam9x60_wdt_remove,
+	.driver		=3D {
+		.name	=3D "sam9x60_wdt",
+		.pm	=3D &sam9x60_wdt_pm_ops,
+		.of_match_table =3D sam9x60_wdt_of_match,
+	}
+};
+module_platform_driver(sam9x60_wdt_driver);
+
+MODULE_AUTHOR("Eugen Hristev");
+MODULE_DESCRIPTION("Microchip SAM9X60 Watchdog Timer driver");
+MODULE_LICENSE("GPL v2");
--=20
2.7.4

