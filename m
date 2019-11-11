Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1021F739D
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Nov 2019 13:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfKKMNf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 11 Nov 2019 07:13:35 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:60994 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKKMNe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 11 Nov 2019 07:13:34 -0500
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: rPe7UUR+w4PxbCsqf1V5kPkaW0OF2vSpu67v5j5AiwXoDYUxpsg06Gw2eJ5lD4CeWoEby2q+l+
 t7P0Ed9717AAdvW/6aDoQA6HikRSZ3dQq4Pj+C3JvTpY4mLKuaknEWM6STlOxSECJEZLQgmWIn
 bzHXM05aUg+V2Y+IbW8D5CyKaHlYZq7CY5e6m1ziP19MBTXHv8u6O9CDR9o8MOYWx4PLDKH+aS
 kEyoS1YWFkkIyIUfqW4H3qwY0t12dQkl+4MYNoE/fKZbCfbAS7uP1V84ZmAdPzH3U7P09554o/
 RTk=
X-IronPort-AV: E=Sophos;i="5.68,292,1569308400"; 
   d="scan'208";a="54869699"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Nov 2019 05:13:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 05:13:32 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 11 Nov 2019 05:13:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLnj05HhKgb7gAxqtGOCe4s5Ki4YJkDxNoMhxyMOs15PD3pvDdzh5R9rkD8sSeDh4zLuljy2ULpkS1vK7t1AIyE1OgBubNwnO7pzc/zjV3vWq53mQCcQuG6ovEn8kcG6wvI6QNacFWhOMp1NEHeWiCOsXCnjBA7iuk+3Db38f19gLLF7RR6G/3jbBdgomkT4qetNfX75e8JPTAcbEgdO4h5EvtLct6i4iNdtWVVv4NaYq+MzPC6VJAmIrn/54ZhOSbePg4WrVahseZ7KrZYpIsrmNrSt/GoTnGjWBhT2bgPk0aDY1IGc+sQiWcWmbBUmBsH88Ow28WaHIsY7aJndQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7kHc9yLhMquk7WXejTeQY3rYWwu451qsyDb0SMPSyI=;
 b=lvC1gJL3U25o/N6QY0IdG2cY0OiAFZ0BILBfTTx8ebBAazcczVE9GyfqxKoVbYjc7cu/58JzXSAvLMskb0XG+NmcZSVHLZJd+S2+zytngXftoIH7Sx4G1jtdloXo71Xf7SjtjosmjS5NZtCVnsiGKrmyPCNK+aU7DiW8kt58q8C+QNv68FpdmogH1aQEWT14N7TYhOQtD32GT3K+A0G6vIFRye8iSk/m60xlvAQ6rJlmGLr9dIfvS55jIqB4lQ8Vj0tgnwJgd5mv1owELqEDgiwHuE94P5LDKI0OKg1fO6dN00HuXJTIg3QBHT9WNIsN34bBoYRl2sMGoaPLdFQfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7kHc9yLhMquk7WXejTeQY3rYWwu451qsyDb0SMPSyI=;
 b=k7SIFq9MaiSKVeEfxrvXuNIuotsirVTF+FQQ7ue4uVhHhvXYA4FZMHRI81QI3fi1cq2iGtplM2XBxEDmWWd5vNp8SLQrH8M9fZ7rSICMl7+JAPdfIdasuA5xoEh1WXZ6AREewsm4hPEKW7ib3WDLUhwVlwkki0OdSeiaq5Jom/M=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB0073.namprd11.prod.outlook.com (10.164.155.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 12:13:31 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8%4]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 12:13:30 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <robh+dt@kernel.org>, <linux@roeck-us.net>,
        <wim@linux-watchdog.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Eugen.Hristev@microchip.com>
Subject: [PATCH v3 1/3] watchdog: sama5d4_wdt: cleanup the bit definitions
Thread-Topic: [PATCH v3 1/3] watchdog: sama5d4_wdt: cleanup the bit
 definitions
Thread-Index: AQHVmIlu6IftJNh+5UamBWHFg3A6Og==
Date:   Mon, 11 Nov 2019 12:13:30 +0000
Message-ID: <1573474383-21915-1-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 95d048f9-c44e-4c7c-b14b-08d766a090d2
x-ms-traffictypediagnostic: DM5PR11MB0073:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB0073978D0EF06C1252EE0A0CE8740@DM5PR11MB0073.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(396003)(39860400002)(346002)(136003)(199004)(189003)(14454004)(6506007)(386003)(110136005)(102836004)(66476007)(66556008)(64756008)(66446008)(478600001)(3846002)(99286004)(36756003)(6116002)(6436002)(66946007)(305945005)(66066001)(7736002)(5660300002)(25786009)(6486002)(86362001)(52116002)(316002)(71200400001)(71190400001)(2201001)(6512007)(256004)(2906002)(81166006)(81156014)(4326008)(186003)(50226002)(8936002)(8676002)(107886003)(476003)(2616005)(486006)(26005)(2501003)(14444005);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB0073;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AwViMZYugrgdEEXUwovFDnH/SSh2VW8I6T6lGA7AhXEmxBKAdUryzy6mIwvfd4JSTiJLKmVabSe44sm64q4Pb011SDN9eu3aYTYwaENtqyhP4XudvKJSATP9vfm2rY1JoiSeuggK3JZfSldxALgMx5u9M2v7lw6K6W+5Fcsffp6Lcswop8DClug9W05ygZQV8U7a22UGcK5BEegNvVAHiBGdD/tGEFUzviq4pfqGEdxufku8XO/YG5b4KpEAv0MLDcL+skmOogDUN/JbBYkb3IiZ9pT7nj78ACcaqMTms+ZkUQJ/m0A+0RgF8buzF4XR4VCEP3qi86OcLtHcIednusy4tpmNGuwLIj+Jw+eKMWKcd18XqJctP+ssp+HCrBk0XNxw5ij8/js+IBcikt2+wTsbduZnhTe+PWPZVAWF3/gIlIlPxmd+V4q4V3gMgvVF
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d048f9-c44e-4c7c-b14b-08d766a090d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 12:13:30.8991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rL4msIFCL4OwM0EHWT7DqmtzkEUHzU4Q1eplfW+gyWzX6xWiyJCmA2LNh2rnez0r9kWX+OOLq57IVprPBUxedMGFO1+uhm4JlDXrjYo2oU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Cleanup the macro definitions to use BIT and align with two spaces.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- new patch as requested from review on ML

 drivers/watchdog/at91sam9_wdt.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wd=
t.h
index 390941c..2ca5fc5 100644
--- a/drivers/watchdog/at91sam9_wdt.h
+++ b/drivers/watchdog/at91sam9_wdt.h
@@ -14,23 +14,23 @@
 #define AT91_WDT_H
=20
 #define AT91_WDT_CR		0x00			/* Watchdog Control Register */
-#define		AT91_WDT_WDRSTT		(1    << 0)		/* Restart */
-#define		AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
+#define  AT91_WDT_WDRSTT	BIT(0)			/* Restart */
+#define  AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
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
+#define  AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
+#define  AT91_WDT_SET_WDV(x)	((x) & AT91_WDT_WDV)
+#define  AT91_WDT_WDFIEN	BIT(12)		/* Fault Interrupt Enable */
+#define  AT91_WDT_WDRSTEN	BIT(13)		/* Reset Processor */
+#define  AT91_WDT_WDRPROC	BIT(14)		/* Timer Restart */
+#define  AT91_WDT_WDDIS		BIT(15)		/* Watchdog Disable */
+#define  AT91_WDT_WDD		(0xfff << 16)		/* Delta Value */
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

