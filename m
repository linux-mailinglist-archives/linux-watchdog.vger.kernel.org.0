Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9172F60584
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2019 13:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfGELqH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Jul 2019 07:46:07 -0400
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:29927
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727700AbfGELqH (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Jul 2019 07:46:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHUQjpCcgi1RopfW+MOLGOMmv6mrsXmN+FmTxSirEDY=;
 b=KmFmVRSVc2B4O/kZCC+k626csv229qSJez/LdXFrVOjIU9uWbl5VQRalcQS19cz5kWMAODpmRStw6fLo1dLUnRKavhmUPIYc3mo0VtdnD/VVxC4HhwevR7sJjit2jcyj0/Nx5/InK5jzc3LFyCFE6DDeFG6fRUtTcc48rdlPYgY=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB5891.eurprd06.prod.outlook.com (20.178.112.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 5 Jul 2019 11:46:02 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 11:46:02 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH v2 1/4] watchdog: cadence_wdt: Move clock detection eariler in
 probe
Thread-Topic: [PATCH v2 1/4] watchdog: cadence_wdt: Move clock detection
 eariler in probe
Thread-Index: AQHVMyc4gSC92280O0OBonrHi42XTQ==
Date:   Fri, 5 Jul 2019 11:46:02 +0000
Message-ID: <20190705114522.42565-2-tomas.melin@vaisala.com>
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
x-ms-office365-filtering-correlation-id: ce7f0d50-907b-41b1-1acd-08d7013e5ad9
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB5891;
x-ms-traffictypediagnostic: AM0PR06MB5891:
x-microsoft-antispam-prvs: <AM0PR06MB58916B341B27D848970EA183FDF50@AM0PR06MB5891.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(39850400004)(366004)(199004)(189003)(52116002)(53936002)(6512007)(6436002)(66066001)(6506007)(25786009)(386003)(6486002)(478600001)(3846002)(6116002)(2501003)(68736007)(50226002)(76176011)(99286004)(107886003)(36756003)(26005)(316002)(4326008)(102836004)(54906003)(110136005)(186003)(71190400001)(71200400001)(5660300002)(2906002)(7736002)(305945005)(14444005)(476003)(446003)(11346002)(2616005)(1076003)(8936002)(66476007)(66556008)(64756008)(66446008)(86362001)(8676002)(256004)(486006)(73956011)(66946007)(81166006)(14454004)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5891;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oc3DYPA6NrlVgL0PJ6forV0hwFwGZmE8hKfHUtgb/oF7gf4BSfb+p8wOT4DPBBWuTNzazO46HV1iXfl/mZU8RMaJ7Et/t+879Rmkf+OB+4GLhyVDMLiNkkrwi8T+32rGkNraO+6YHc1gail4a7cR/wTQ/6rpJuHQ7tLUHc1LGtnourG/i22RDffonqMEB6DxLiHnFs9ATDbwTwRZ6YO9hzFUBirF7d+DvaAmL6hhqyy3a/30t5rj4rVCX92K0Kegzdg7GwG/XRRmVcwEt2TP70VkRk1HTzAXwsP4CHSBkqGmXBh06jAwPQSlFzYxqPBu6LFhGjJCOHbPh4jd8cVUng1bZGP9//G0LgcZY0xYlK98Nius6HPgowHd2wOGcbHjAxmrLD/iY+Ha94V3vvFGx4Y8GFnyXDVttdGla7MXbJY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7f0d50-907b-41b1-1acd-08d7013e5ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 11:46:02.2690
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

Timeout calculation needs clock frequency, so init clock and calculate
prescaler value eariler in the probe.

Preparational step for calculating maximum and minimum timeout values
for driver.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/watchdog/cadence_wdt.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index c3924356d173..415bd6dd1edb 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -295,6 +295,22 @@ static int cdns_wdt_probe(struct platform_device *pdev=
)
 	if (!wdt)
 		return -ENOMEM;
=20
+	wdt->clk =3D devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(wdt->clk)) {
+		dev_err(&pdev->dev, "input clock not found\n");
+		ret =3D PTR_ERR(wdt->clk);
+		return ret;
+	}
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
@@ -334,28 +350,12 @@ static int cdns_wdt_probe(struct platform_device *pde=
v)
 	watchdog_stop_on_reboot(cdns_wdt_device);
 	watchdog_set_drvdata(cdns_wdt_device, wdt);
=20
-	wdt->clk =3D devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(wdt->clk)) {
-		dev_err(&pdev->dev, "input clock not found\n");
-		ret =3D PTR_ERR(wdt->clk);
-		return ret;
-	}
-
 	ret =3D clk_prepare_enable(wdt->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to enable clock\n");
 		return ret;
 	}
=20
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
 	ret =3D watchdog_register_device(cdns_wdt_device);
--=20
2.17.2

