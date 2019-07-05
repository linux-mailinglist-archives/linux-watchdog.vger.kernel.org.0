Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 036E260586
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2019 13:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbfGELqL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Jul 2019 07:46:11 -0400
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:29927
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728316AbfGELqL (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Jul 2019 07:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxjB5Wjz2sV5mgc+b8NEo1VhJIiEXAeq5/sMajeS/m4=;
 b=il8ZZAbLeH5zy+ZA0ATEjqBMKxWcTYsQ1TJzMH6qdP3F0dh3kdYgmLgALRoTpEbQxyDq/bqLfvx2cZtr15tdi0FjZLVHMKuNcDaBViDZ+gsZnIgcGRRzxAe8icielitlXYU0hCNXmFEKcpYnOdqzoliDnWaQ7hm06KkpA/KVZ3U=
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
Subject: [PATCH v2 3/4] watchdog: cadence_wdt: Group struct member init
 statements
Thread-Topic: [PATCH v2 3/4] watchdog: cadence_wdt: Group struct member init
 statements
Thread-Index: AQHVMyc5PRGnNzbVgEWwh9EA9v6D5A==
Date:   Fri, 5 Jul 2019 11:46:03 +0000
Message-ID: <20190705114522.42565-4-tomas.melin@vaisala.com>
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
x-ms-office365-filtering-correlation-id: 9a28a724-45db-470b-b774-08d7013e5bc4
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB5891;
x-ms-traffictypediagnostic: AM0PR06MB5891:
x-microsoft-antispam-prvs: <AM0PR06MB589149AFE99A72ABBF0695CDFDF50@AM0PR06MB5891.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(39850400004)(366004)(199004)(189003)(52116002)(53936002)(6512007)(6436002)(66066001)(6506007)(25786009)(386003)(6486002)(478600001)(3846002)(6116002)(2501003)(68736007)(50226002)(76176011)(99286004)(107886003)(36756003)(26005)(316002)(4326008)(102836004)(54906003)(110136005)(186003)(71190400001)(71200400001)(5660300002)(2906002)(7736002)(4744005)(305945005)(476003)(446003)(11346002)(2616005)(1076003)(8936002)(66476007)(66556008)(64756008)(66446008)(86362001)(8676002)(256004)(486006)(73956011)(66946007)(81166006)(14454004)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5891;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IuBr70im2TAfVAZazJbARmfazTzEhqaGmHez3D5F6rM0zQFkxMbaw18Vd950R6ZYUEkrD/1QQhEBW4O0EZk/GH5JiaSxtQTr6XLh3xJq5ewLFBiERXQuJZdUV5KYsLG1Ekxx8iw3vo7j86QL539tU1zhZu6Slg+bYFn6ij8PFY5Kpx/fKQM4PeeU7HhOdXntBdl5V+1cb2GvWfZ3p+o3MkjJwXPePq69IyjDnffsh87XjcdbnluMRGh7ve/EXgbCA4euGRpETotLJoHV+CUzxbrZ/e14aidZEge5EJWvrjELbYUNraolxVSgr7zdLJvY623+i3M1xrQDq7JNva/yGQc0idqhaRlp79y2XLixjciYGDIGyEad06eE8YjzKg5/NpUBBAE/ABdsetRyZhENr3lDNrRRhRgEZtUcDgu7KRw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a28a724-45db-470b-b774-08d7013e5bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 11:46:03.8031
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

Move init statement and remove stray comment.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/watchdog/cadence_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.=
c
index 87b767c87bb6..4657800d9d8e 100644
--- a/drivers/watchdog/cadence_wdt.c
+++ b/drivers/watchdog/cadence_wdt.c
@@ -313,6 +313,7 @@ static int cdns_wdt_probe(struct platform_device *pdev)
 	}
 =09
 	cdns_wdt_device =3D &wdt->cdns_wdt_device;
+	cdns_wdt_device->parent =3D &pdev->dev;
 	cdns_wdt_device->info =3D &cdns_wdt_info;
 	cdns_wdt_device->ops =3D &cdns_wdt_ops;
 	cdns_wdt_device->timeout =3D CDNS_WDT_DEFAULT_TIMEOUT;
@@ -340,9 +341,6 @@ static int cdns_wdt_probe(struct platform_device *pdev)
 		}
 	}
=20
-	/* Initialize the members of cdns_wdt structure */
-	cdns_wdt_device->parent =3D &pdev->dev;
-
 	ret =3D watchdog_init_timeout(cdns_wdt_device, wdt_timeout, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to set timeout value\n");
--=20
2.17.2

