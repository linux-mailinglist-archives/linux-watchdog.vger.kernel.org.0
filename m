Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEE0160588
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2019 13:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfGELq0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Jul 2019 07:46:26 -0400
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:29927
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727609AbfGELqZ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Jul 2019 07:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR6FRZXAQuDPlH1cBhx5w0i7Uy56UvledOjFXT9by2o=;
 b=uv47vAEjz2/Z6xga9trjYhJkjEbStw5QDa8tAni6ZvHCWmaBCj3Gh3LPe0IXnygNp5K2GM/t8M8d5CNIHx3GrSAZ7WEu0jQl+z0MnvMHf4c7L+P89dybonyaS3goVh91lMbEGqa1G5WsIFan4KxLqU3FnO7+xGukaBiJtqDkrQg=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB5891.eurprd06.prod.outlook.com (20.178.112.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 5 Jul 2019 11:46:04 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 11:46:04 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH v2 4/4] watchdog: cadence_wdt: Support all available prescaler
 values
Thread-Topic: [PATCH v2 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Index: AQHVMyc5XfCsE+9knUOMmMD97S+BMw==
Date:   Fri, 5 Jul 2019 11:46:04 +0000
Message-ID: <20190705114522.42565-5-tomas.melin@vaisala.com>
References: <20190705114522.42565-1-tomas.melin@vaisala.com>
In-Reply-To: <20190705114522.42565-1-tomas.melin@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0901CA0051.eurprd09.prod.outlook.com
 (2603:10a6:3:45::19) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.2
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac173b10-eada-4bdc-82e0-08d7013e5c44
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB5891;
x-ms-traffictypediagnostic: AM0PR06MB5891:
x-microsoft-antispam-prvs: <AM0PR06MB58915D06B3625DBF2B13BA0DFDF50@AM0PR06MB5891.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(39850400004)(366004)(199004)(189003)(52116002)(53936002)(6512007)(6436002)(66066001)(6506007)(25786009)(386003)(6486002)(478600001)(3846002)(6116002)(2501003)(68736007)(50226002)(76176011)(99286004)(107886003)(36756003)(26005)(316002)(4326008)(102836004)(54906003)(110136005)(186003)(71190400001)(71200400001)(5660300002)(2906002)(7736002)(305945005)(476003)(446003)(11346002)(2616005)(1076003)(8936002)(66476007)(66556008)(64756008)(66446008)(86362001)(8676002)(256004)(486006)(73956011)(66946007)(81166006)(14454004)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5891;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c1HHGDu1b0ZdGzTR20qnJWz9J7VeHWVxayXSzyZ6tiYDDWeJQXwttK7NG/PkTjBGAS48Mg2ktcGcevZ4+Gb/sH0nUCAMgsGeyik/EIRwnBe7jxYbB4NPnrRAAX/LFun1Ljk15kP1vmzpHa4bEI0VrJoyry/Ecwb2edwidy6bvuMueFuH6vCZl55BZrDTZIJbiUivd11XSYWFYwx7wFr9shRYDrufBhFrCxBz/J75GBaO5+1vWDI42aEtil6g31C9ZXpBwGKCyUvj0esTPrbwNjX1Y6Ai9boQ6/14yivC5Gs3SQT7ZQrnmX111k4USjpcTpfLVg+Af3V2f8GJgUE85UhWhtOwcC2/4vBg9wuIIVxVfjaFliN121c4PMiGn71cACmVVbMdscBZznI+HNA8Fms7M/4tmcgnQ82JdsicfIE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac173b10-eada-4bdc-82e0-08d7013e5c44
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 11:46:04.5547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5891
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Cadence watchdog HW supports prescaler values of
8, 64, 512 and 4096.

Add support to select prescaler values of 8 and 64 for lower
input clock frequencies.

Prescaler value is selected to keep timeout resolution of 1 second.
For clock frequencies below 32kHz, 1 second resolution does
no longer hold, thereby returning an error.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/watchdog/cadence_wdt.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index 4657800d9d8e..39109b5721c1 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -33,16 +33,17 @@
 #define CDNS_WDT_COUNTER_VALUE_DIVISOR 0x1000
=20
 /* Clock prescaler value and selection */
+#define CDNS_WDT_PRESCALE_8	8
 #define CDNS_WDT_PRESCALE_64	64
 #define CDNS_WDT_PRESCALE_512	512
 #define CDNS_WDT_PRESCALE_4096	4096
+#define CDNS_WDT_PRESCALE_SELECT_8	0
 #define CDNS_WDT_PRESCALE_SELECT_64	1
 #define CDNS_WDT_PRESCALE_SELECT_512	2
 #define CDNS_WDT_PRESCALE_SELECT_4096	3
=20
-/* Input clock frequency */
-#define CDNS_WDT_CLK_10MHZ	10000000
-#define CDNS_WDT_CLK_75MHZ	75000000
+/* Base input clock frequency */
+#define CDNS_WDT_CLK_32KHZ 32768
=20
 /* Counter maximum value */
 #define CDNS_WDT_COUNTER_MAX 0xFFF
@@ -304,7 +305,16 @@ static int cdns_wdt_probe(struct platform_device *pdev=
)
 	}
=20
 	clock_f =3D clk_get_rate(wdt->clk);
-	if (clock_f <=3D CDNS_WDT_CLK_75MHZ) {
+	if (clock_f < CDNS_WDT_CLK_32KHZ) {
+		dev_err(&pdev->dev, "cannot find suitable clock prescaler\n");
+		return -ERANGE;
+	} else if (clock_f <=3D CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_8) {
+		wdt->prescaler =3D CDNS_WDT_PRESCALE_8;
+		wdt->ctrl_clksel =3D CDNS_WDT_PRESCALE_SELECT_8;
+	} else if (clock_f <=3D CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_64) {
+		wdt->prescaler =3D CDNS_WDT_PRESCALE_64;
+		wdt->ctrl_clksel =3D CDNS_WDT_PRESCALE_SELECT_64;
+	} else if (clock_f <=3D CDNS_WDT_CLK_32KHZ * CDNS_WDT_PRESCALE_512) {
 		wdt->prescaler =3D CDNS_WDT_PRESCALE_512;
 		wdt->ctrl_clksel =3D CDNS_WDT_PRESCALE_SELECT_512;
 	} else {
--=20
2.17.2

