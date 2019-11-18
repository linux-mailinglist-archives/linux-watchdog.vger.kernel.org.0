Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 788351000B6
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 09:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfKRIuf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 03:50:35 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:30090 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfKRIuf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 03:50:35 -0500
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
IronPort-SDR: w4WOixnmb66IcClAG9jQECsqCKxJ5bYoPFKnEQjQH+Y9K7VbHAvMV9q40OTwmH1W6uoMRFuuqf
 wT+lwNBoWphWErR21l3TCWI5g+PU5AkiBTJi5vwDoPyXF8eZVdPhuxL/OylHNgZ2CLdZvHmG9X
 FWRcPhx6Y7uXTCjDjPeoWSVYe69eK/7GsLvJ4e91zxsFOhH708xrWUVqEF4kRjAf4GlsY8YWHm
 nAbAqkpoXfIvrYB5Q4O/x37FnLxPfgisWq8itSrv1K+LfDIO7lCRs1a3D2pWflt/PPG3aKkEnS
 9EA=
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; 
   d="scan'208";a="54693688"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2019 01:50:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 Nov 2019 01:50:34 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 18 Nov 2019 01:50:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtLq3Y/6VaLrNP3UVPcvEmOHuUpz3kIBZ4YqJY01VaC75Y3Ned0CwJN8uLTOWxuZTrb2ZCx6GNc172FiDy5GgZP+s6vE5ZUDGXRidx1VrzJOg6BeXUUOfUQAv7Cfdq7qlNq8rGIfHelRnM3JgyeIxMXijC5slMg/8pXMjQxJONr128qhDhaR6hzw7OasNLuXMv1WKLsbCKzxczdydF7iDzL0TYdFatJg873GP1WiQthJ6k49TGb0Ff/DrHGLnUg0wDZkX4+57AEJhJOZJQJdld49sVz1OZg6NA2TehKOSZw3TW5MO3GMt9DJTEeEx6P7jEV1pkFvrkG1lF4/9HfJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJrAModIrm3Z/kNB5qegFC3pxcQgen6WBoyZCpYQp9M=;
 b=m4V7YRUlhFW2ZG7OxO6LD5nNg52dEmTlD7NKOgHoW3pwXGdYXv2BpUkld5DD6HQ/6rep3xk1UhMvtNkQWYTlMaIMFYP8knJwxCF/7ATWwT37hTgxO6OHM2LynmVccdym/+3fWlAEK29TPpQgH8Hw20tjS6PIyMvInNXWuK658xKXaDRFQ/mFurUDdCKgAN72sw8abvkl8beBThTPtF6wFPDZNmp5tOf7Kw0pTRgGsVqAKN+ib7BaliBNuR/qb2uL9gOyGg/ma+Uq49Dtgu+n+UUq6u7vD/slkYBJ4R5LMq7kzOqT9SEDAgxHk6opCJ1Z+uRRrHIZJ9Wa/eT9VjGbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJrAModIrm3Z/kNB5qegFC3pxcQgen6WBoyZCpYQp9M=;
 b=KgASIq2WyCon8VcXkIaZpV9Ca24dSGXl5uAFf/J4dMPxMgYdiyH7iNfn/EjvvzxJa6mot+7hgJONjBN/Qogm74QmKUoc8oJtKC/WBbgtg18imsktrtLHCqqJM4e7XKzy3CUtAdYVDtrWAoSEO0RPRFgzkv6UrQPNbRaybArcymw=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1659.namprd11.prod.outlook.com (10.172.35.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 08:50:31 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8%4]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 08:50:31 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <linux-watchdog@vger.kernel.org>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH v5 1/3] watchdog: sama5d4_wdt: cleanup the bit definitions
Thread-Topic: [PATCH v5 1/3] watchdog: sama5d4_wdt: cleanup the bit
 definitions
Thread-Index: AQHVne07BiorG6D1ck2PFwW2YCEuIg==
Date:   Mon, 18 Nov 2019 08:50:31 +0000
Message-ID: <1574067012-18559-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0030.eurprd05.prod.outlook.com
 (2603:10a6:208:55::43) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ea24f67-9149-4f66-69dc-08d76c045e05
x-ms-traffictypediagnostic: DM5PR11MB1659:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB165926067160C384B644811DE84D0@DM5PR11MB1659.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(396003)(366004)(346002)(136003)(39860400002)(376002)(189003)(199004)(5660300002)(50226002)(478600001)(81166006)(81156014)(4326008)(8676002)(2906002)(36756003)(486006)(6486002)(8936002)(66066001)(14444005)(256004)(6116002)(6512007)(54906003)(3846002)(2201001)(7736002)(305945005)(71190400001)(316002)(71200400001)(6436002)(52116002)(25786009)(110136005)(476003)(102836004)(6506007)(386003)(186003)(2501003)(86362001)(99286004)(66476007)(66556008)(64756008)(66446008)(66946007)(2616005)(107886003)(26005)(14454004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1659;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 23vn/+jweFtIBeQZ8vhndfqM3UsY+KSL7yPIfLkcKN0kYBa/67voIG30sC3/RfRUS2j4Ud8qHlz/v+WPtJOn6JhD4P7C9/uXsjalz5MRJdO5pLYlhOSQN1tfB7Ry8OW+FtkBgU19HLch75ZAHd6E5xozkwoGb1OH36NnM8rWGgy7BXN2HBbaSr7TwVYrh0z+pakGlMxQvYPH+mISBU0bfSWks3AP/Q1LCRDUjVbfwwkrKZ03VSUzJWwqF4hY/qDZvR9pemKupL3M/oEweWfupY/T4s2NHmpJM4RJS6ZMwN9O7CpekG2jkglCi9TMp5HfPK8ZR0PzNyV6vOcqplK5QrC79Kqe7a87co/1LQ+SvoOhYtJNeau218FeYnQxteGxcKUHZiYsBNA7LkSxu3ASvHqj9gLN+xwJBcvQFRz97ezijooFIGK5zfu1xVsUC+c7
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea24f67-9149-4f66-69dc-08d76c045e05
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 08:50:31.2645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqG9/VNW4wq3GfPQYSP39hMvixaSmSOTY5SxDW76iv7vi91CjpWAFXKcXiqQMD5FeENbkoztGnLPD++DbsYBcjULHi+KNLdG1k+c60EYAHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1659
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Cleanup the macro definitions to use BIT and align with two spaces.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
- added UL suffix to value macros to avoid compile warnings
- modified file header to include new copyright and datasheet
- include linux/bits.h

Changes in v3:
- new patch as requested from review on ML

 drivers/watchdog/at91sam9_wdt.h | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wd=
t.h
index 390941c..abfe34d 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -4,33 +4,37 @@
  *
  * Copyright (C) 2007 Andrew Victor
  * Copyright (C) 2007 Atmel Corporation.
+ * Copyright (C) 2019 Microchip Technology Inc. and its subsidiaries
  *
  * Watchdog Timer (WDT) - System peripherals regsters.
  * Based on AT91SAM9261 datasheet revision D.
+ * Based on SAM9X60 datasheet.
  *
  */
=20
 #ifndef AT91_WDT_H
 #define AT91_WDT_H
=20
+#include <linux/bits.h>
+
 #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
-#define		AT91_WDT_WDRSTT		(1    << 0)		/* Restart */
-#define		AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
+#define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
+#define  AT91_WDT_KEY		(0xa5UL << 24)		/* KEY Password */
=20
 #define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
-#define		AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
-#define			AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
-#define		AT91_WDT_WDFIEN		(1     << 12)		/* Fault Interrupt Enable */
-#define		AT91_WDT_WDRSTEN	(1     << 13)		/* Reset Processor */
-#define		AT91_WDT_WDRPROC	(1     << 14)		/* Timer Restart */
-#define		AT91_WDT_WDDIS		(1     << 15)		/* Watchdog Disable */
-#define		AT91_WDT_WDD		(0xfff << 16)		/* Delta Value */
-#define			AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
-#define		AT91_WDT_WDDBGHLT	(1     << 28)		/* Debug Halt */
-#define		AT91_WDT_WDIDLEHLT	(1     << 29)		/* Idle Halt */
+#define  AT91_WDT_WDV		(0xfffUL << 0)		/* Counter Value */
+#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
+#define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
+#define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
+#define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
+#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
+#define  AT91_WDT_WDD		(0xfffUL << 16)		/* Delta Value */
+#define  AT91_WDT_SET_WDD(x)	(((x) << 16) & AT91_WDT_WDD)
+#define  AT91_WDT_WDDBGHLT	BIT(28)		/* Debug Halt */
+#define  AT91_WDT_WDIDLEHLT	BIT(29)		/* Idle Halt */
=20
-#define AT91_WDT_SR		0x08			/* Watchdog Status Register */
-#define		AT91_WDT_WDUNF		(1 << 0)		/* Watchdog Underflow */
-#define		AT91_WDT_WDERR		(1 << 1)		/* Watchdog Error */
+#define AT91_WDT_SR		0x08		/* Watchdog Status Register */
+#define  AT91_WDT_WDUNF		BIT(0)		/* Watchdog Underflow */
+#define  AT91_WDT_WDERR		BIT(1)		/* Watchdog Error */
=20
 #endif
--=20
2.7.4

