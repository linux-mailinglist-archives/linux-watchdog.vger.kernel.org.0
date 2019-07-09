Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D210063C80
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbfGIUJN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:09:13 -0400
Received: from mail-eopbgr130081.outbound.protection.outlook.com ([40.107.13.81]:12361
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729572AbfGIUJN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIEJ5/B2PTMnqmkMsYgWIX+lyHlAj5D5EmdfhiIPG3o=;
 b=s4DzYjd908HpXTpeRBGRXGKI++ooGn69H4kq/83rdWkNVsFV05QkKhs9HFuYQ9C2Soi2+IUGbTbY54/CsOFt/A8kmIDsdW+CinWNNGUFXL5TxxRzuZuA3dnYbx8uezYdNa0tAApgmE2zdSiSUgk+zT3fZiklxfr6GNj402QPgIc=
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
Subject: [PATCH v3 3/4] watchdog: cadence_wdt: Group struct member init
 statements
Thread-Topic: [PATCH v3 3/4] watchdog: cadence_wdt: Group struct member init
 statements
Thread-Index: AQHVNpIpvQm3jvbrMkGcXgq3YNmLmw==
Date:   Tue, 9 Jul 2019 20:09:06 +0000
Message-ID: <20190709200801.42313-4-tomas.melin@vaisala.com>
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
x-ms-office365-filtering-correlation-id: 55634788-d4c6-4a8d-4f63-08d704a94b86
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB3890;
x-ms-traffictypediagnostic: AM0PR06MB3890:
x-microsoft-antispam-prvs: <AM0PR06MB38906EC6221FB10064522E86FDF10@AM0PR06MB3890.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:576;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(346002)(39850400004)(376002)(136003)(189003)(199004)(53936002)(256004)(2906002)(86362001)(50226002)(6512007)(446003)(71190400001)(71200400001)(2616005)(26005)(102836004)(186003)(110136005)(478600001)(6116002)(3846002)(54906003)(476003)(6506007)(386003)(64756008)(36756003)(66446008)(66476007)(107886003)(66556008)(76176011)(4326008)(305945005)(68736007)(52116002)(11346002)(99286004)(4744005)(1076003)(5660300002)(81166006)(486006)(316002)(25786009)(66066001)(14454004)(8676002)(8936002)(81156014)(2501003)(7736002)(66946007)(6436002)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB3890;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UZFK+/YrD35WqA8IRf77a16caRVrGonve1noJ0tjk78Izthwnh0PNpfKATp1HbTK192oQ3VA0CAZyqeCa0T4Fdo7nnCQczPK67O08+jeV3P7YtWWXsD6bEFCTJoL4l69qiR2byK9WZPgBqyS6Cj6HKMzpuijqwoPPe6SdCKE1nRLPs6tn6h4qSDAoJ2GMoKO5QxPnAfnqGhr8Ojrk81g7d7XCpCGzZ114TQfRSp+TKDFM3GJedETwxCxN2nGQqkjSmBrhLJcmMP1ac25pr7uHkDK/P7w1A7JQkWCRz++ojR7xtlx4N6cGoeWU+OP5b/MxoFg7iiR+BkZiNeGG7DEHrQgCXn/pMuIgdGlkoXwRvFe4r5pupP72RGfTaPtoWDhD9qo4ia5sFbPuPwth+Q/6As/M/bBPt3de3vV/slZXdY=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55634788-d4c6-4a8d-4f63-08d704a94b86
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 20:09:06.1760
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

Move init statement and remove stray comment.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/watchdog/cadence_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index a0d7666e7d20..0bdb275d904a 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -330,6 +330,7 @@ static int cdns_wdt_probe(struct platform_device *pdev)
 	}
=20
 	cdns_wdt_device =3D &wdt->cdns_wdt_device;
+	cdns_wdt_device->parent =3D dev;
 	cdns_wdt_device->info =3D &cdns_wdt_info;
 	cdns_wdt_device->ops =3D &cdns_wdt_ops;
 	cdns_wdt_device->timeout =3D CDNS_WDT_DEFAULT_TIMEOUT;
@@ -356,9 +357,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)
 		}
 	}
=20
-	/* Initialize the members of cdns_wdt structure */
-	cdns_wdt_device->parent =3D dev;
-
 	watchdog_init_timeout(cdns_wdt_device, wdt_timeout, dev);
 	watchdog_set_nowayout(cdns_wdt_device, nowayout);
 	watchdog_stop_on_reboot(cdns_wdt_device);
--=20
2.17.2

