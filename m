Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C7563C7E
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbfGIUJI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:09:08 -0400
Received: from mail-eopbgr130081.outbound.protection.outlook.com ([40.107.13.81]:12361
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729582AbfGIUJH (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yoL1lQrhZcFRAEExiB/B61+FoCSR+8fAet8GFrFlZY=;
 b=gONuT/hLhuWUR1NIPIhRZir74SVxuIT5mPyVENeMUc7waHVI4jR9k+dcE/gJolpjz9Xj+1tEb0b/aIM5AN0qjtMJVS/LOpbpkdY4aofwMbwDSY8RzrOm56gd7rLTN3r+mnB6akVPMvoDoBixh82HEugTSBWhFQ/4v4vx4TdBsL8=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB3890.eurprd06.prod.outlook.com (52.133.58.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 20:09:04 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 20:09:04 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH v3 1/4] watchdog: cadence_wdt: Move clock detection earlier in
 probe
Thread-Topic: [PATCH v3 1/4] watchdog: cadence_wdt: Move clock detection
 earlier in probe
Thread-Index: AQHVNpIn00nrfFZ3xkCD61CPT/shRQ==
Date:   Tue, 9 Jul 2019 20:09:03 +0000
Message-ID: <20190709200801.42313-2-tomas.melin@vaisala.com>
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
x-ms-office365-filtering-correlation-id: bd62d42d-7340-4fbd-1278-08d704a949c3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB3890;
x-ms-traffictypediagnostic: AM0PR06MB3890:
x-microsoft-antispam-prvs: <AM0PR06MB3890CFD7E0D8D9A235BD40E2FDF10@AM0PR06MB3890.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(346002)(39850400004)(376002)(136003)(189003)(199004)(53936002)(256004)(2906002)(14444005)(86362001)(50226002)(6512007)(446003)(71190400001)(71200400001)(2616005)(26005)(102836004)(186003)(110136005)(478600001)(6116002)(3846002)(54906003)(476003)(6506007)(386003)(64756008)(36756003)(66446008)(66476007)(107886003)(66556008)(76176011)(4326008)(305945005)(68736007)(52116002)(11346002)(99286004)(1076003)(5660300002)(81166006)(486006)(316002)(25786009)(66066001)(14454004)(8676002)(8936002)(81156014)(2501003)(7736002)(66946007)(6436002)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB3890;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UGSOT9gDz5lcoVDOxu0kihYA+66qjUabbQSHpbwBgbBpMrWdcvaQiqFh1LnNwpsHCp7MbCzTDPDnar+n1LD2FxF9YVgUnmI0Qowj6p5/+0+JgquVUElY6pKhoAE3HXMsaphsPVaNl9euDcX/d70kiT2bgRZOXU3+Z7lEnR9jNY927002lTOPDvw4EmDVQtNjOuQAdFUVhVuqwIwEIl2bQBwXPmj/RlOPgpqmqYqsARWGPU93+/3s6JjWTbRoR86JlbRwKmTmwi6Jz5hBaEWsB+hiF08XZUBH9ojYSP9pbJckykUpHm5ccyyvGu9ds2YaXEvPKMuTYMTETvgsIHytBbGlQFYhYeJCETPS+Es38B7tNp6WnYdv4/8f5dhBx27Nw+2FNKfULGYvLsPTPLFMXbMrzoO4Do3HBcESVLgBtYM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd62d42d-7340-4fbd-1278-08d704a949c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 20:09:04.1282
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

Timeout calculation needs clock frequency, so init clock and calculate
prescaler value earlier in the probe.

Preparational step for calculating maximum and minimum timeout values
for driver.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/watchdog/cadence_wdt.c | 50 +++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index a22f2d431a35..ddbf602bdc40 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -300,6 +300,31 @@ static int cdns_wdt_probe(struct platform_device *pdev=
)
 	if (!wdt)
 		return -ENOMEM;
=20
+	wdt->clk =3D devm_clk_get(dev, NULL);
+	if (IS_ERR(wdt->clk)) {
+		dev_err(dev, "input clock not found\n");
+		return PTR_ERR(wdt->clk);
+	}
+
+	ret =3D clk_prepare_enable(wdt->clk);
+	if (ret) {
+		dev_err(dev, "unable to enable clock\n");
+		return ret;
+	}
+	ret =3D devm_add_action_or_reset(dev, cdns_clk_disable_unprepare,
+				       wdt->clk);
+	if (ret)
+		return ret;
+
+	clock_f =3D clk_get_rate(wdt->clk);
+	if (clock_f <=3D CDNS_WDT_CLK_75MHZ) {
+		wdt->prescaler =3D CDNS_WDT_PRESCALE_512;
+		wdt->ctrl_clksel =3D CDNS_WDT_PRESCALE_SELECT_512;
+	} else {
+		wdt->prescaler =3D CDNS_WDT_PRESCALE_4096;
+		wdt->ctrl_clksel =3D CDNS_WDT_PRESCALE_SELECT_4096;
+	}
+
 	cdns_wdt_device =3D &wdt->cdns_wdt_device;
 	cdns_wdt_device->info =3D &cdns_wdt_info;
 	cdns_wdt_device->ops =3D &cdns_wdt_ops;
@@ -333,31 +358,6 @@ static int cdns_wdt_probe(struct platform_device *pdev=
)
 	watchdog_stop_on_reboot(cdns_wdt_device);
 	watchdog_set_drvdata(cdns_wdt_device, wdt);
=20
-	wdt->clk =3D devm_clk_get(dev, NULL);
-	if (IS_ERR(wdt->clk)) {
-		dev_err(dev, "input clock not found\n");
-		return PTR_ERR(wdt->clk);
-	}
-
-	ret =3D clk_prepare_enable(wdt->clk);
-	if (ret) {
-		dev_err(dev, "unable to enable clock\n");
-		return ret;
-	}
-	ret =3D devm_add_action_or_reset(dev, cdns_clk_disable_unprepare,
-				       wdt->clk);
-	if (ret)
-		return ret;
-
-	clock_f =3D clk_get_rate(wdt->clk);
-	if (clock_f <=3D CDNS_WDT_CLK_75MHZ) {
-		wdt->prescaler =3D CDNS_WDT_PRESCALE_512;
-		wdt->ctrl_clksel =3D CDNS_WDT_PRESCALE_SELECT_512;
-	} else {
-		wdt->prescaler =3D CDNS_WDT_PRESCALE_4096;
-		wdt->ctrl_clksel =3D CDNS_WDT_PRESCALE_SELECT_4096;
-	}
-
 	spin_lock_init(&wdt->io_lock);
=20
 	watchdog_stop_on_reboot(cdns_wdt_device);
--=20
2.17.2

