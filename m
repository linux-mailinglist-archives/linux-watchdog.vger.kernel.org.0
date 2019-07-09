Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E63763C82
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbfGIUJ2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:09:28 -0400
Received: from mail-eopbgr130081.outbound.protection.outlook.com ([40.107.13.81]:12361
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729572AbfGIUJ2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inK4NJv8/GyGod6G6lG1Xc07geZWMzadvGPatFFQuH4=;
 b=MvMrqCo6gxjwSMDY4h2lFxJk/vEuAftF3OQsMmDqQYisfstnVv9yt3vcucJIGsU+r6l4B1I8fztx/Fxv+z4uQVr/1u3z3YrDg4TpvDBarmbinGE7qSJj3dDyKRyHejJGhqIJYMVatWyVe8o6OLb3MZhhAQdwsLEwyB3vycR6wf4=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB3890.eurprd06.prod.outlook.com (52.133.58.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 20:09:06 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 20:09:06 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available prescaler
 values
Thread-Topic: [PATCH v3 4/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Index: AQHVNpIpwwoCbUKMfU6U33+0Mj8DZw==
Date:   Tue, 9 Jul 2019 20:09:06 +0000
Message-ID: <20190709200801.42313-5-tomas.melin@vaisala.com>
References: <20190709200801.42313-1-tomas.melin@vaisala.com>
In-Reply-To: <20190709200801.42313-1-tomas.melin@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0902CA0006.eurprd09.prod.outlook.com
 (2603:10a6:3:e5::16) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.2
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a568963-74c9-45b3-0159-08d704a94bf7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB3890;
x-ms-traffictypediagnostic: AM0PR06MB3890:
x-microsoft-antispam-prvs: <AM0PR06MB3890F653990D5E1E6BC9CAF2FDF10@AM0PR06MB3890.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(346002)(39850400004)(376002)(136003)(189003)(199004)(53936002)(256004)(2906002)(86362001)(50226002)(6512007)(446003)(71190400001)(71200400001)(2616005)(26005)(102836004)(186003)(110136005)(478600001)(6116002)(3846002)(54906003)(476003)(6506007)(386003)(64756008)(36756003)(66446008)(66476007)(107886003)(66556008)(76176011)(4326008)(305945005)(68736007)(52116002)(11346002)(99286004)(1076003)(5660300002)(81166006)(486006)(316002)(25786009)(66066001)(14454004)(8676002)(8936002)(81156014)(2501003)(7736002)(66946007)(6436002)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB3890;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uluAqRLv24aSQwt79Q+8XUJ5velDrZGjnfY61iLeahd0Ntu/hnoaPLkz5u9veVitBbcxjE54GgOsOfliutXLWAw1U/meSv1YlaDGGWzTZoPazmk3hXBExNoGrys+5h51W9dLP08F0gLwFhodXUz4QWp8uik1DA2fze4pS79cfuaPxjalXtGkdsHeJb8zrS7NMVVfj1yzX4RdOERImP4ka58Bh19tnlt4rBZ/b5Dh1RhhIfl2p7r7Zd4FKqRheFNnZnqvlnjQwOPC9AqvjvVlnCInVHGqT/i30Q1NLvs0fzW9cMJKdcse0RtRQh7ho2wz3yWl6lF7XUZN/29g+qStijB+BtFeL0DZbQOD6nv9QFd8Xmnn6kO552IoErLDheIIEVEcTdc3N41PtUsjuS67Z0bYkAvx0yAMOPpUBTX3agw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a568963-74c9-45b3-0159-08d704a94bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 20:09:06.8066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB3890
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
 drivers/watchdog/cadence_wdt.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index 0bdb275d904a..037faf557f9d 100644
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
@@ -318,10 +319,18 @@ static int cdns_wdt_probe(struct platform_device *pde=
v)
 		return ret;
=20
 	clock_f =3D clk_get_rate(wdt->clk);
-	if (clock_f =3D=3D 0) {
-		dev_err(dev, "invalid clock frequency, (f=3D%lu)\n", clock_f);
+	if (clock_f < CDNS_WDT_CLK_32KHZ) {
+		dev_err(dev,
+			"cannot find suitable clock prescaler, (f=3D%lu)\n",
+			clock_f);
 		return -EINVAL;
-	} else if (clock_f <=3D CDNS_WDT_CLK_75MHZ) {
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

