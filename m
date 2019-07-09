Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFB663C7F
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfGIUJK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:09:10 -0400
Received: from mail-eopbgr130081.outbound.protection.outlook.com ([40.107.13.81]:12361
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729572AbfGIUJK (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJUCy8lECzcYLt2Rt75IlBhCZ6xpR00/fMNi+jregC8=;
 b=q7yMIs4T8xT3wpt5qj9aTXhPDqvepw/aUpjkUcuihT4IHt/dKIuS8uZdgjy27DUUz5XDqzS3S6vNnPYB6PrAtKZ6a9al5LnzQMSizP3aMr+S/7M3KalMcrpqkMHlpiHu6TFqdPsQaODgnGE9V1X05NZY+Z5MM8F9+WlUDL1G+Gk=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB3890.eurprd06.prod.outlook.com (52.133.58.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 20:09:05 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 20:09:05 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH v3 2/4] watchdog: cadence_wdt: Calculate actual timeout limits
Thread-Topic: [PATCH v3 2/4] watchdog: cadence_wdt: Calculate actual timeout
 limits
Thread-Index: AQHVNpIoih3T4Xs3REWpMWObvXdxSA==
Date:   Tue, 9 Jul 2019 20:09:05 +0000
Message-ID: <20190709200801.42313-3-tomas.melin@vaisala.com>
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
x-ms-office365-filtering-correlation-id: 6cb58b48-75e0-4ee6-37f7-08d704a94b06
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB3890;
x-ms-traffictypediagnostic: AM0PR06MB3890:
x-microsoft-antispam-prvs: <AM0PR06MB38905F44BFBEFDC8EDD99B79FDF10@AM0PR06MB3890.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:250;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(346002)(39850400004)(376002)(136003)(189003)(199004)(53936002)(256004)(2906002)(14444005)(86362001)(50226002)(6512007)(446003)(71190400001)(71200400001)(2616005)(26005)(102836004)(186003)(110136005)(478600001)(6116002)(3846002)(54906003)(476003)(6506007)(386003)(64756008)(36756003)(66446008)(66476007)(107886003)(66556008)(76176011)(4326008)(305945005)(68736007)(52116002)(11346002)(99286004)(1076003)(5660300002)(81166006)(486006)(316002)(25786009)(66066001)(14454004)(8676002)(8936002)(81156014)(2501003)(7736002)(66946007)(6436002)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB3890;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AtaWUqDs5EPweDrcFJOm9+eO6JqPr72QQN1jQDq786FaU2IVEyGgj8GF6AN4f1eDj9IiHmuz9iPyYc68X9TiBmza3iQ7TUeS1u1vvHEpu/I5CYpgQUWHaMDQjpwo2AcJigDaZN5yv50OVKzi3TZZarqdMsfG169Nyx3A3CcqHYPYWidzj4Bccyj/Vp4MVlfKcnm23TpOPfAkZZxOGeWGDCmWTeCIppYiqivNQNgfuWYKtgfOBFFrhwaegwZd7RJGCcFJjkXdQEIcPWg2CL+e08HG6SfZ+pdPxPUJwt+7lJ7my6fokBBcOW/1SNukdUybncyVccbUyhImKTZfFNd1Hrq0F20DSVXPmMiCZl7bpGRBFEq1qfWc+EBtYj5sBWwNQQEldhX5xo6Hk0PIMyBraAjCspM1EuxvVo5zJ58wGM8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb58b48-75e0-4ee6-37f7-08d704a94b06
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 20:09:05.2586
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

Maximum and minimum timeout values depend on the actual input clock
frequency and prescaler selection.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/watchdog/cadence_wdt.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index ddbf602bdc40..a0d7666e7d20 100644
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
@@ -317,7 +318,10 @@ static int cdns_wdt_probe(struct platform_device *pdev=
)
 		return ret;
=20
 	clock_f =3D clk_get_rate(wdt->clk);
-	if (clock_f <=3D CDNS_WDT_CLK_75MHZ) {
+	if (clock_f =3D=3D 0) {
+		dev_err(dev, "invalid clock frequency, (f=3D%lu)\n", clock_f);
+		return -EINVAL;
+	} else if (clock_f <=3D CDNS_WDT_CLK_75MHZ) {
 		wdt->prescaler =3D CDNS_WDT_PRESCALE_512;
 		wdt->ctrl_clksel =3D CDNS_WDT_PRESCALE_SELECT_512;
 	} else {
@@ -329,8 +333,10 @@ static int cdns_wdt_probe(struct platform_device *pdev=
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
 	wdt->regs =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(wdt->regs))
--=20
2.17.2

