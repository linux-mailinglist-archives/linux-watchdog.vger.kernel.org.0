Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D850463200
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 09:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfGIH0m (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 03:26:42 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:2134 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbfGIH0m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 03:26:42 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: hDycyhyUlO/tAJG4VASrQeTGiTKoyc0D7IoBtpdVpcEBPnwN/txM4PBrAPO4xROS5vDs62JBZg
 jrQMdroznQbVaz216xKPBPYFtn/kp6L85/TKXeh3/2YpvyOttWNQzCr8fqJWMhcSToRDJRHM6e
 UazcHjbGmc55lfTmWfdaeapKAIBFOgA/v/kqwUFIahTj6O3iDLfuyC8pWsIkuYePNFfkaUDiTf
 l8bEaqwLu5d6Y3jG6vLlzBlXq66A7yN2vJLr5OE2E1nOplqEdV4omNuJz1FcvYVcp/nHD6sLhH
 QZY=
X-IronPort-AV: E=Sophos;i="5.63,469,1557212400"; 
   d="scan'208";a="40535428"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jul 2019 00:26:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 9 Jul 2019 00:26:40 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 9 Jul 2019 00:26:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e14MSquKxbd4bZG/2vXuYDVoJ1T/bwEZYDRZd/kR/XE=;
 b=LzVCfS5Ao9qXcXBoG9xoQDpqFL5a6UxK6ASA5mMrFiaj4Xt6VFa+ZX07oG2bT6u9w57zsyYEwoa5svYP0n4yHSpOQI6ySeZcgKpcQikoDtT7eRrEZF9l3XbZTP/oLcThOhGdsGXp7l3maV3XKK8vSQKDN7EHvbZk2RahAIhXQas=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1722.namprd11.prod.outlook.com (10.168.105.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.20; Tue, 9 Jul 2019 07:26:39 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::917d:f91d:9398:3925%8]) with mapi id 15.20.2052.019; Tue, 9 Jul 2019
 07:26:38 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>, <linux@roeck-us.net>
CC:     <Nicolas.Ferre@microchip.com>, <Eugen.Hristev@microchip.com>
Subject: [PATCH RESEND] watchdog: sama5d4: fix WDD value to be always set to
 max
Thread-Topic: [PATCH RESEND] watchdog: sama5d4: fix WDD value to be always set
 to max
Thread-Index: AQHVNiel3tqC/c4NYUqYBLX/IH2ZHg==
Date:   Tue, 9 Jul 2019 07:26:38 +0000
Message-ID: <1562656725-21468-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0142.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::26) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50cfd7bc-2e63-4aac-fc4d-08d7043ec7dd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR11MB1722;
x-ms-traffictypediagnostic: DM5PR11MB1722:
x-microsoft-antispam-prvs: <DM5PR11MB1722854E6C1703FCF198EB06E8F10@DM5PR11MB1722.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(136003)(396003)(366004)(376002)(189003)(199004)(386003)(54906003)(110136005)(14454004)(476003)(26005)(102836004)(5660300002)(6506007)(6512007)(71190400001)(486006)(107886003)(68736007)(81166006)(2616005)(8676002)(81156014)(66446008)(8936002)(6486002)(256004)(71200400001)(66946007)(6436002)(66556008)(2501003)(64756008)(66476007)(73956011)(4326008)(2906002)(2201001)(186003)(7736002)(478600001)(72206003)(305945005)(50226002)(53936002)(316002)(99286004)(86362001)(25786009)(66066001)(52116002)(36756003)(3846002)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1722;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fRiGREg25Pe7/UFdIfyTXjFE254q+LqVqrw+EtkAK8d/KBHqTF2lwYnoUg/90tGaxip/7/Y69p1+TsyPvjeKwQ810ixn0kSE2ob67TcnC8EuwpAmy+znje1lZN2bGPF+yTtY6lbbNliSOZkdy699IwbFfURxglyo76fK80nARRza7Q8MVe5HGZ8s3V6yJRdXHhDe1Asoc8116DDs7M3dbYu/Kd375rfORZ59dcHx0dsNEbUuEqMyhdl7dIAtjBJ4IawfpPAqquFuOr9a3FJrEar0t3TKuitV7TuKBg0JiDjcF3PgLgVjhf7zq1fcM4B6AxX9oE1b8JyKnQ5e9eE6ZKu7i8pibEIgwO4BP0mndFcGcoRlZdLfL3s/2mZWCIJH/zuYeZsZ20qCeJI20Agad1Q8UvxyhNsbS4eKXef5H+E=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cfd7bc-2e63-4aac-fc4d-08d7043ec7dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 07:26:38.7855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1722
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

WDD value must be always set to max (0xFFF) otherwise the hardware
block will reset the board on the first ping of the watchdog.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/watchdog/sama5d4_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/sama5d4_wdt.c b/drivers/watchdog/sama5d4_wdt.=
c
index b8da1bf..5afe10c 100644
--- a/drivers/watchdog/sama5d4_wdt.c
+++ b/drivers/watchdog/sama5d4_wdt.c
@@ -110,9 +110,7 @@ static int sama5d4_wdt_set_timeout(struct watchdog_devi=
ce *wdd,
 	u32 value =3D WDT_SEC2TICKS(timeout);
=20
 	wdt->mr &=3D ~AT91_WDT_WDV;
-	wdt->mr &=3D ~AT91_WDT_WDD;
 	wdt->mr |=3D AT91_WDT_SET_WDV(value);
-	wdt->mr |=3D AT91_WDT_SET_WDD(value);
=20
 	/*
 	 * WDDIS has to be 0 when updating WDD/WDV. The datasheet states: When
@@ -248,7 +246,7 @@ static int sama5d4_wdt_probe(struct platform_device *pd=
ev)
=20
 	timeout =3D WDT_SEC2TICKS(wdd->timeout);
=20
-	wdt->mr |=3D AT91_WDT_SET_WDD(timeout);
+	wdt->mr |=3D AT91_WDT_SET_WDD(WDT_SEC2TICKS(MAX_WDT_TIMEOUT));
 	wdt->mr |=3D AT91_WDT_SET_WDV(timeout);
=20
 	ret =3D sama5d4_wdt_init(wdt);
--=20
2.7.4

