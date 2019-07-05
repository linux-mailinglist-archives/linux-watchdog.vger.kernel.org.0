Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C99F660585
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2019 13:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbfGELqJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Jul 2019 07:46:09 -0400
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:29927
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727609AbfGELqJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Jul 2019 07:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTzahOHq/NqXUCkLDoF5CaLbd+QskdjZUpZa5DrZlDI=;
 b=bqEJ22inTuAlZRJg98692w298per/bKn8VE+X6p8NQnQHgYfh9js6t0/OY9728GwjbVZrTo1Yn/EEY8y5SHFvcpu9XwFh7NY1cxANnRMS4+Daw00YQNDlHA4ZVJ9E3TNYVdVdJUgcI8UWI8HAaJ3FZpBRSNKEO/z0TIV0ym1Wd4=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB5891.eurprd06.prod.outlook.com (20.178.112.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 5 Jul 2019 11:46:03 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 11:46:03 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH v2 2/4] watchdog: cadence_wdt: Calculate actual timeout limits
Thread-Topic: [PATCH v2 2/4] watchdog: cadence_wdt: Calculate actual timeout
 limits
Thread-Index: AQHVMyc4zOw3U4QqV0S153oSVaSoDg==
Date:   Fri, 5 Jul 2019 11:46:02 +0000
Message-ID: <20190705114522.42565-3-tomas.melin@vaisala.com>
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
x-ms-office365-filtering-correlation-id: 736a108b-14b6-4357-b267-08d7013e5b55
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB5891;
x-ms-traffictypediagnostic: AM0PR06MB5891:
x-microsoft-antispam-prvs: <AM0PR06MB589198057BB09211DEE9C1A7FDF50@AM0PR06MB5891.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(39850400004)(366004)(199004)(189003)(52116002)(53936002)(6512007)(6436002)(66066001)(6506007)(25786009)(386003)(6486002)(478600001)(3846002)(6116002)(2501003)(68736007)(50226002)(76176011)(99286004)(107886003)(36756003)(26005)(316002)(4326008)(102836004)(54906003)(110136005)(186003)(71190400001)(71200400001)(5660300002)(2906002)(7736002)(305945005)(14444005)(476003)(446003)(11346002)(2616005)(1076003)(8936002)(66476007)(66556008)(64756008)(66446008)(86362001)(8676002)(256004)(486006)(73956011)(66946007)(81166006)(14454004)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5891;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jrFg6l1Ci0tWRrpp36CvMb1jsIsh7z8IUOWKSRMxj9/09NW0SA2sNtvOJK8Y94Jqr7zGyy6dqbZ5FOn/TfyupKD1kpT3EqMeTC7ocRnf9lSCWEe9QFApOQlKoZsa2ooMBjUtxZx0TDszgMGrrTZ4CoUl7lNznAINY4txBtdXIGLkj9fDv750kTQtzoiSaW0EQU62IinSd87gmARxULgkDy/77KoofG1QstD/J5rwtAG3E8J+PR6SAHZfHZnJLTaOPgi/NtEQ/Q4AreQ6nWByTq/x8Eg/7DogoTKEdmjw/OakQRStqAkWZ7+J2yoy/RYHyDZiudBMsAiuoVrEonds93xYcC8vDZuJ744xmc34dxotjVXTiDiqeP3Iub3vHOs+fjRVZa7Pa5vBE44X/Jck3vknBBrqpZnkEg5QOCqzzeg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736a108b-14b6-4357-b267-08d7013e5b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 11:46:03.0106
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

Maximum and minimum timeout values depend on the actual input clock
frequency and prescaler selection.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/watchdog/cadence_wdt.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index 415bd6dd1edb..87b767c87bb6 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -18,9 +18,6 @@
 #include <linux/watchdog.h>
=20
 #define CDNS_WDT_DEFAULT_TIMEOUT	10
-/* Supports 1 - 516 sec */
-#define CDNS_WDT_MIN_TIMEOUT	1
-#define CDNS_WDT_MAX_TIMEOUT	516
=20
 /* Restart key */
 #define CDNS_WDT_RESTART_KEY 0x00001999
@@ -28,6 +25,10 @@
 /* Counter register access key */
 #define CDNS_WDT_REGISTER_ACCESS_KEY 0x00920000
=20
+/* Counter control register, counter restart values */
+#define CDNS_WDT_CCR_CRV_MIN 0xFFF
+#define CDNS_WDT_CCR_CRV_MAX 0xFFFFFF
+
 /* Counter value divisor */
 #define CDNS_WDT_COUNTER_VALUE_DIVISOR 0x1000
=20
@@ -315,8 +316,10 @@ static int cdns_wdt_probe(struct platform_device *pdev=
)
 	cdns_wdt_device->info =3D &cdns_wdt_info;
 	cdns_wdt_device->ops =3D &cdns_wdt_ops;
 	cdns_wdt_device->timeout =3D CDNS_WDT_DEFAULT_TIMEOUT;
-	cdns_wdt_device->min_timeout =3D CDNS_WDT_MIN_TIMEOUT;
-	cdns_wdt_device->max_timeout =3D CDNS_WDT_MAX_TIMEOUT;
+	cdns_wdt_device->min_timeout =3D
+		CDNS_WDT_CCR_CRV_MIN * wdt->prescaler / clock_f;
+	cdns_wdt_device->max_timeout =3D
+		CDNS_WDT_CCR_CRV_MAX * wdt->prescaler / clock_f;
=20
 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	wdt->regs =3D devm_ioremap_resource(&pdev->dev, res);
--=20
2.17.2

