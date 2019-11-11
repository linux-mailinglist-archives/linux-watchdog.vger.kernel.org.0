Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87657F73A4
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Nov 2019 13:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKKMNk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 11 Nov 2019 07:13:40 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:15319 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfKKMNj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 11 Nov 2019 07:13:39 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: qwjK2+IWwtc7LTALAxmEz4Kb71cQg7OUIAl+/XeFO6hdOFTFPP5qF91dzPffmGZY8+1LD0ecm+
 GkNbJZT2/Gb1NY1GwaDtft9c7+w3qTLXWIn00CWQyQtmDc1Guc+5ZVBhscfeJ4zCa5RMXy2+FY
 izIoB+VfHifwWLLFwTJge5oW7L3NyIoaBXB0j9VXeXnxuwTGQ16Z0s+3rL9jNRLs1k5hvJfMyb
 DNP8/cEDlHP4iLKpMHwYVfsSMFQf1k9wh3oaRYr2CVbbXffYm0+wXIMTjfZ6hqsT1JREWhgnJA
 TnE=
X-IronPort-AV: E=Sophos;i="5.68,292,1569308400"; 
   d="scan'208";a="56481279"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Nov 2019 05:13:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 05:13:37 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 11 Nov 2019 05:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z74VyIRRPE6WPnpH2OgpZlALYh7gf0Nh2kgMCzlYdqhsrlyabYFBeIr6Kz4Nq0C29Wqt24dlu6ze75wqT6T/ByC8dlzL1TiABcdhG1ZT/Fl+Huf9ldAXOhm+mU6gyJEaGmlA8IvLvn1eL6loCVOTDULEJJnswtFi1ZxFWdNJoNxOgrKBOGItToXxFp2XH9SrrrHQYxLve0dHh3v8tGZ23Ontxc7xBkVosnuWOZYp+EVqW/+iXH+q2aIR0iZVHYEBaC/vq8g0772CUhGkq31bmVn0d3qUVLtZ85w6YujtrGmu+ETSSeNHpHtc9oITleizFoI2qFKFB4z4LpNqZdV8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNnWP6bwXx0QCUdcTEkrMOygbxT2Al6WEleJksYj0Nw=;
 b=V1omOHt2v/qGeKI39RLM8PCVlq8jeI/59CloAP4ECRNhixN9TtOsRCswqv6qJW14fAUMOwiCx5odRLiGdlId53T6EmaJbTjmPCK4DOKM/h4Nw3y6tCBSmPsTJ2zWt2HsgA9Z2Xge0w3ORoqewkHVVr1OWYv375Zlf0bgFBETwPsUwX1oswK0UWgdLeKd2PRlATTX4+Ukh8E1fX41jMOAhWEHdjpUQcQ7NGgR9y6VncPpfz8SxtoZfqWCtNVZqbLvU0Z2mM+np8rsu35OD9w01rUxneupsdpY6P/teMRx09S4J/nnz/A8+Z11+xMGXNWCslvpsGYHXNsrjeKTVI8n4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNnWP6bwXx0QCUdcTEkrMOygbxT2Al6WEleJksYj0Nw=;
 b=Az3DC4D+QuRq+FgAmW6rCb5k+3FnIfVwhkfw7/EQO3XraldSz2oL2IvUlBZtpd9qSmMJQH2bJoQr7E2FuD4+7KjhGDQzh2mbfIxQ21vxg7tzSZuGCkir31tvK51n0ecz+mNfrdhTsUSf4sJQZMJKYnoEAfni09K1IpNHhyKL0VU=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0073.namprd11.prod.outlook.com (10.164.155.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 12:13:36 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8%4]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 12:13:36 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <linux@roeck-us.net>,
        <wim@linux-watchdog.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 3/3] watchdog: sama5d4_wdt: addition of sam9x60 compatible
 watchdog
Thread-Topic: [PATCH v3 3/3] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Thread-Index: AQHVmIlx5k8vbeXivkS0+eMZks/KTQ==
Date:   Mon, 11 Nov 2019 12:13:35 +0000
Message-ID: <1573474383-21915-3-git-send-email-eugen.hristev@microchip.com>
References: <1573474383-21915-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1573474383-21915-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0060.eurprd05.prod.outlook.com
 (2603:10a6:208:be::37) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f2633ab-b5bd-45d1-e301-08d766a093df
x-ms-traffictypediagnostic: DM5PR11MB0073:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB0073347EA339960387144FBAE8740@DM5PR11MB0073.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:257;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(396003)(39860400002)(346002)(136003)(199004)(189003)(14454004)(6506007)(386003)(76176011)(110136005)(102836004)(66476007)(66556008)(64756008)(66446008)(478600001)(3846002)(99286004)(36756003)(6116002)(6436002)(66946007)(305945005)(66066001)(7736002)(5660300002)(25786009)(6486002)(86362001)(52116002)(316002)(71200400001)(71190400001)(2201001)(6512007)(256004)(446003)(11346002)(2906002)(81166006)(81156014)(4326008)(186003)(50226002)(8936002)(8676002)(107886003)(476003)(2616005)(486006)(26005)(2501003)(14444005);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0073;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MAPmnya7PjFrlrUqsMWNDk3OLjaaJrv7Px2nfcKrABAK/kiwMwK4UY8xOgBc4Qzmng5ifvWVFo8mWZx7FdbkRl/q9Rx50TVGXcXoFD/O9NYQ5yIYvVyZXptBsIxHRCixVZa2XRpgW/rokT7uLy6k/EhPDqL4jQwp9eE9xiDD9HziSPxR2SnDoNtDcvH+scTIk93rJdENyl1kuQ+aLQ8E2RYDjKkn02HBaWWSPPYukOu5GmXNe5FcmrfXt1AhpeZ+Ee/y1jVro3IiwOy2/LJgL5tCiw4cNhJvZuDcWxEOAqfVX78/NFOPmdwCIhdBBJ/4FTgnoFdoCe+nkmgiCbJuBaokd82QP7052zWDawgdOdq9rkbQG3sr6ZhdEsgSAw9m6X1rHrSsRjM4rtPHqyQ64M5pGmn6jNcD705+5VMT3e7/NzB436VnC8K1psNFd5Rs
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2633ab-b5bd-45d1-e301-08d766a093df
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 12:13:35.9617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4L9wPxQJLeCH4HXvj1NLzWBrfJYPo3PDO/6ddeQlS3S3uTi255ogqdvZdNsM5kLlQHsak0kTG4uPX27BN8ce+NPLTfwEfOwB8cTUZjLSKAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add support for SAM9X60 WDT into sama5d4_wdt.
This means that this driver gets a flag inside the data struct
that represents the sam9x60 support.
This flag differentiates between the two hardware blocks, and is set
according to the compatible of the driver instantiation.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- changed need_irq to bool, instead of a single bit variable.
- the platform data config struct is gone now, changed to a pointer to a bo=
ol
to have the sam9x60_support as 'true', pointing to a static bool with true =
value.
Can have a better solution than this ?
- the specific sam9x60_support flag is assigned at probe time, correspondin=
g
to the flag value in .data


 drivers/watchdog/at91sam9_wdt.h |  14 +++++
 drivers/watchdog/sama5d4_wdt.c  | 120 ++++++++++++++++++++++++++++++------=
----
 2 files changed, 105 insertions(+), 29 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wd=
t.h
index 2ca5fc5..2a85135 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -20,7 +20,10 @@
 #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
 #define  AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
 #define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
+#define  AT91_SAM9X60_PERIODRST	BIT(4)		/* Period Reset */
+#define  AT91_SAM9X60_RPTHRST	BIT(5)		/* Minimum Restart Period */
 #define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
+#define  AT91_SAM9X60_WDDIS	BIT(12)		/* Watchdog Disable */
 #define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
 #define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
 #define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
@@ -33,4 +36,15 @@
 #define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
 #define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
=20
+#define AT91_SAM9X60_VR		0x08			/* Watchdog Timer Value Register */
+
+#define AT91_SAM9X60_WLR		0x0c
+#define  AT91_SAM9X60_COUNTER	(0xfff << 0)		/* Watchdog Period Value */
+#define  AT91_SAM9X60_SET_COUNTER(x)	((x) & AT91_SAM9X60_COUNTER)
+
+#define AT91_SAM9X60_IER		0x14		/* Interrupt Enable Register */
+#define  AT91_SAM9X60_PERINT		BIT(0)		/* Period Interrupt Enable */
+#define AT91_SAM9X60_IDR		0x18		/* Interrupt Disable Register */
+#define AT91_SAM9X60_ISR		0x1c		/* Interrupt Status Register */
+
 #endif
diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.=
c
index d193a60..cf53354 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -2,7 +2,7 @@
 /*
  * Driver for Atmel SAMA5D4 Watchdog Timer
  *
- * Copyright (C) 2015 Atmel Corporation
+ * Copyright (C) 2015-2019 Microchip Technology Inc. and its subsidiaries
  */
=20
 #include <linux/delay.h>
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
@@ -26,10 +27,13 @@
 #define WDT_SEC2TICKS(s)	((s) ? (((s) << 8) - 1) : 0)
=20
 struct sama5d4_wdt {
-	struct watchdog_device	wdd;
-	void __iomem		*reg_base;
-	u32			mr;
-	unsigned long		last_ping;
+	struct watchdog_device		wdd;
+	void __iomem			*reg_base;
+	u32				mr;
+	u32				ir;
+	unsigned long			last_ping;
+	bool				need_irq;
+	bool				sam9x60_support;
 };
=20
 static int wdt_timeout;
@@ -78,7 +82,12 @@ static int sama5d4_wdt_start(struct watchdog_device *wdd=
)
 {
 	struct sama5d4_wdt *wdt =3D watchdog_get_drvdata(wdd);
=20
-	wdt->mr &=3D ~AT91_WDT_WDDIS;
+	if (wdt->sam9x60_support) {
+		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IER);
+		wdt->mr &=3D ~AT91_SAM9X60_WDDIS;
+	} else {
+		wdt->mr &=3D ~AT91_WDT_WDDIS;
+	}
 	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
=20
 	return 0;
@@ -88,7 +97,12 @@ static int sama5d4_wdt_stop(struct watchdog_device *wdd)
 {
 	struct sama5d4_wdt *wdt =3D watchdog_get_drvdata(wdd);
=20
-	wdt->mr |=3D AT91_WDT_WDDIS;
+	if (wdt->sam9x60_support) {
+		writel_relaxed(wdt->ir, wdt->reg_base + AT91_SAM9X60_IDR);
+		wdt->mr |=3D AT91_SAM9X60_WDDIS;
+	} else {
+		wdt->mr |=3D AT91_WDT_WDDIS;
+	}
 	wdt_write(wdt, AT91_WDT_MR, wdt->mr);
=20
 	return 0;
@@ -109,6 +123,14 @@ static int sama5d4_wdt_set_timeout(struct watchdog_dev=
ice *wdd,
 	struct sama5d4_wdt *wdt =3D watchdog_get_drvdata(wdd);
 	u32 value =3D WDT_SEC2TICKS(timeout);
=20
+	if (wdt->sam9x60_support) {
+		wdt_write(wdt, AT91_SAM9X60_WLR,
+			  AT91_SAM9X60_SET_COUNTER(value));
+
+		wdd->timeout =3D timeout;
+		return 0;
+	}
+
 	wdt->mr &=3D ~AT91_WDT_WDV;
 	wdt->mr |=3D AT91_WDT_SET_WDV(value);
=20
@@ -143,8 +165,14 @@ static const struct watchdog_ops sama5d4_wdt_ops =3D {
 static irqreturn_t sama5d4_wdt_irq_handler(int irq, void *dev_id)
 {
 	struct sama5d4_wdt *wdt =3D platform_get_drvdata(dev_id);
+	u32 reg;
=20
-	if (wdt_read(wdt, AT91_WDT_SR)) {
+	if (wdt->sam9x60_support)
+		reg =3D wdt_read(wdt, AT91_SAM9X60_ISR);
+	else
+		reg =3D wdt_read(wdt, AT91_WDT_SR);
+
+	if (reg) {
 		pr_crit("Atmel Watchdog Software Reset\n");
 		emergency_restart();
 		pr_crit("Reboot didn't succeed\n");
@@ -157,13 +185,14 @@ static int of_sama5d4_wdt_init(struct device_node *np=
, struct sama5d4_wdt *wdt)
 {
 	const char *tmp;
=20
-	wdt->mr =3D AT91_WDT_WDDIS;
+	if (wdt->sam9x60_support)
+		wdt->mr =3D AT91_SAM9X60_WDDIS;
+	else
+		wdt->mr =3D AT91_WDT_WDDIS;
=20
 	if (!of_property_read_string(np, "atmel,watchdog-type", &tmp) &&
 	    !strcmp(tmp, "software"))
-		wdt->mr |=3D AT91_WDT_WDFIEN;
-	else
-		wdt->mr |=3D AT91_WDT_WDRSTEN;
+		wdt->need_irq =3D true;
=20
 	if (of_property_read_bool(np, "atmel,idle-halt"))
 		wdt->mr |=3D AT91_WDT_WDIDLEHLT;
@@ -176,21 +205,46 @@ static int of_sama5d4_wdt_init(struct device_node *np=
, struct sama5d4_wdt *wdt)
=20
 static int sama5d4_wdt_init(struct sama5d4_wdt *wdt)
 {
-	u32 reg;
+	u32 reg, val;
+
+	val =3D WDT_SEC2TICKS(WDT_DEFAULT_TIMEOUT);
 	/*
 	 * When booting and resuming, the bootloader may have changed the
 	 * watchdog configuration.
 	 * If the watchdog is already running, we can safely update it.
 	 * Else, we have to disable it properly.
 	 */
-	if (wdt_enabled) {
-		wdt_write_nosleep(wdt, AT91_WDT_MR, wdt->mr);
-	} else {
+	if (!wdt_enabled) {
 		reg =3D wdt_read(wdt, AT91_WDT_MR);
-		if (!(reg & AT91_WDT_WDDIS))
+		if (wdt->sam9x60_support && (!(reg & AT91_SAM9X60_WDDIS)))
+			wdt_write_nosleep(wdt, AT91_WDT_MR,
+					  reg | AT91_SAM9X60_WDDIS);
+		else if (!wdt->sam9x60_support &&
+			 (!(reg & AT91_WDT_WDDIS)))
 			wdt_write_nosleep(wdt, AT91_WDT_MR,
 					  reg | AT91_WDT_WDDIS);
 	}
+
+	if (wdt->sam9x60_support) {
+		if (wdt->need_irq)
+			wdt->ir =3D AT91_SAM9X60_PERINT;
+		else
+			wdt->mr |=3D AT91_SAM9X60_PERIODRST;
+
+		wdt_write(wdt, AT91_SAM9X60_IER, wdt->ir);
+		wdt_write(wdt, AT91_SAM9X60_WLR, AT91_SAM9X60_SET_COUNTER(val));
+	} else {
+		wdt->mr |=3D AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
+		wdt->mr |=3D AT91_WDT_SET_WDV(val);
+
+		if (wdt->need_irq)
+			wdt->mr |=3D AT91_WDT_WDFIEN;
+		else
+			wdt->mr |=3D AT91_WDT_WDRSTEN;
+	}
+
+	wdt_write_nosleep(wdt, AT91_WDT_MR, wdt->mr);
+
 	return 0;
 }
=20
@@ -200,14 +254,16 @@ static int sama5d4_wdt_probe(struct platform_device *=
pdev)
 	struct watchdog_device *wdd;
 	struct sama5d4_wdt *wdt;
 	void __iomem *regs;
+	const void *data;
 	u32 irq =3D 0;
-	u32 timeout;
 	int ret;
=20
 	wdt =3D devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
 		return -ENOMEM;
=20
+	data =3D of_device_get_match_data(&pdev->dev);
+
 	wdd =3D &wdt->wdd;
 	wdd->timeout =3D WDT_DEFAULT_TIMEOUT;
 	wdd->info =3D &sama5d4_wdt_info;
@@ -215,6 +271,7 @@ static int sama5d4_wdt_probe(struct platform_device *pd=
ev)
 	wdd->min_timeout =3D MIN_WDT_TIMEOUT;
 	wdd->max_timeout =3D MAX_WDT_TIMEOUT;
 	wdt->last_ping =3D jiffies;
+	wdt->sam9x60_support =3D data ? *(bool *)data : false;
=20
 	watchdog_set_drvdata(wdd, wdt);
=20
@@ -224,15 +281,17 @@ static int sama5d4_wdt_probe(struct platform_device *=
pdev)
=20
 	wdt->reg_base =3D regs;
=20
-	irq =3D irq_of_parse_and_map(dev->of_node, 0);
-	if (!irq)
-		dev_warn(dev, "failed to get IRQ from DT\n");
-
 	ret =3D of_sama5d4_wdt_init(dev->of_node, wdt);
 	if (ret)
 		return ret;
=20
-	if ((wdt->mr & AT91_WDT_WDFIEN) && irq) {
+	irq =3D irq_of_parse_and_map(dev->of_node, 0);
+	if (!irq) {
+		dev_warn(dev, "failed to get IRQ from DT\n");
+		wdt->need_irq =3D false;
+	}
+
+	if (wdt->need_irq) {
 		ret =3D devm_request_irq(dev, irq, sama5d4_wdt_irq_handler,
 				       IRQF_SHARED | IRQF_IRQPOLL |
 				       IRQF_NO_SUSPEND, pdev->name, pdev);
@@ -244,11 +303,6 @@ static int sama5d4_wdt_probe(struct platform_device *p=
dev)
=20
 	watchdog_init_timeout(wdd, wdt_timeout, dev);
=20
-	timeout =3D WDT_SEC2TICKS(wdd->timeout);
-
-	wdt->mr |=3D AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
-	wdt->mr |=3D AT91_WDT_SET_WDV(timeout);
-
 	ret =3D sama5d4_wdt_init(wdt);
 	if (ret)
 		return ret;
@@ -268,8 +322,16 @@ static int sama5d4_wdt_probe(struct platform_device *p=
dev)
 	return 0;
 }
=20
+static bool sam9x60_config =3D true;
+
 static const struct of_device_id sama5d4_wdt_of_match[] =3D {
-	{ .compatible =3D "atmel,sama5d4-wdt", },
+	{
+		.compatible =3D "atmel,sama5d4-wdt",
+	},
+	{
+		.compatible =3D "microchip,sam9x60-wdt",
+		.data =3D &sam9x60_config,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sama5d4_wdt_of_match);
--=20
2.7.4

