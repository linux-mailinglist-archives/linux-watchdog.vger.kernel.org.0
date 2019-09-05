Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0B51A9C23
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 09:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730991AbfIEHoW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 03:44:22 -0400
Received: from mail-eopbgr50062.outbound.protection.outlook.com ([40.107.5.62]:7142
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726083AbfIEHoV (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 03:44:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGtaoM44sQKhLBjsWyfqRVJUdxRX5jjl4Zuqc/bOAvaCp8IyT6vGpyLUrf6t3E2OoZ6Xu6NwU9QrnSDlNfz/PlRrIzZAyG7pVEa0WFzH9jbV3l6Mvz2gixpCnr571rczHzemKpa/l6iUD4/N9TtZwBssEVu05lCujWd/+ireHztPe1oulQf5+spsvtIovkYrEkavuhYG5aodYInsA4WEy3qCQJ0wLJ9OAt7Tx4ynkg8aeCCsiECrtuoJqMt0lJ1zRWdR9TWGEG4IExCoylY/8Xdtu/gExaFpZnOrEAykI8DhH7ir71BDfaBaRJ53N6KOFPERfGtc7QiEfWWRksNdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35EC2rNch4cGtwQmHdVq/iy8qqwQiZBkdxEuwngRDEA=;
 b=KCgfrr1wRMwaIoTJO8ywiE55LEP3XgUEPHEQMxdbpCk0jm/DFaG2uxxUKWab+tL/e4mKJdX11sIS9R+3H3pYXGr3TQ4LPZ3B8EiDMKxyGESzMCFhGtto9r+XaQ/La93nucbTJdSCpPwWTuroZLte4+2ITQm7K9y9V4euN9/e6Ewm9liDvoleaelOFeLbSDSPfZh2UU35EOfCVdxXaZGuXXieWgpnHjS9MSy6EZ0j4imyOihpgKw5HVVlr/xf13NMZEgYcAWSFSoxZFhv73vzF6d4DropkGapMVqwyygmOlXLKjN9H8qN9cZbweBdcFh381KI4fOUGhPQ4nbM0XZvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35EC2rNch4cGtwQmHdVq/iy8qqwQiZBkdxEuwngRDEA=;
 b=lTeDPAQgctjyb+3i3kLcX0tO/7Z3hhwZVkFj8D6JoDBH2am0Xfnn8GBPzFOoPCK+cbqru+98PITU1uqTkCveREotoYKaKryc39+J0Zz9TvEZjevzT5myTQFCB6CAVCVv7ZFGeoSLJI6as+rilFF4i5MpUkdul0pByOZytnqNg84=
Received: from DB6PR0902MB2072.eurprd09.prod.outlook.com (10.170.212.23) by
 DB6PR0902MB2038.eurprd09.prod.outlook.com (10.170.213.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 5 Sep 2019 07:44:17 +0000
Received: from DB6PR0902MB2072.eurprd09.prod.outlook.com
 ([fe80::19cd:2f16:89cd:67cb]) by DB6PR0902MB2072.eurprd09.prod.outlook.com
 ([fe80::19cd:2f16:89cd:67cb%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 07:44:16 +0000
From:   Oliver Graute <oliver.graute@kococonnector.com>
To:     "oliver.graute@gmail.com" <oliver.graute@gmail.com>
CC:     Oliver Graute <oliver.graute@kococonnector.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: [PATCH v1] watchdog: imx_sc: this patch just fixes whitespaces
Thread-Topic: [PATCH v1] watchdog: imx_sc: this patch just fixes whitespaces
Thread-Index: AQHVY724fLk0KIY3y0CpQBQtW0JX3w==
Date:   Thu, 5 Sep 2019 07:44:16 +0000
Message-ID: <20190905073730.22258-1-oliver.graute@kococonnector.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0012.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::22) To DB6PR0902MB2072.eurprd09.prod.outlook.com
 (2603:10a6:6:8::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oliver.graute@kococonnector.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [193.47.161.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c0ea7dc-3d9c-4233-8061-08d731d4daa7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB6PR0902MB2038;
x-ms-traffictypediagnostic: DB6PR0902MB2038:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0902MB2038B11A0C1D4AE6F9E80CD8EBBB0@DB6PR0902MB2038.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39830400003)(376002)(396003)(366004)(346002)(136003)(189003)(199004)(5660300002)(186003)(26005)(99286004)(2906002)(305945005)(102836004)(1361003)(6486002)(44832011)(4744005)(6506007)(6512007)(476003)(2616005)(386003)(6436002)(36756003)(5640700003)(6916009)(3846002)(6116002)(53936002)(4326008)(486006)(52116002)(7416002)(2501003)(66946007)(2351001)(8936002)(66556008)(1076003)(316002)(66066001)(81156014)(81166006)(50226002)(54906003)(66476007)(508600001)(25786009)(14454004)(86362001)(256004)(71190400001)(71200400001)(7736002)(66446008)(64756008)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0902MB2038;H:DB6PR0902MB2072.eurprd09.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: kococonnector.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ntNlBlEZfG/uXW/uO4cpC3TIa8bkk0tFpPQSTLtD6FaOnpcAvc8O/NrIYe4JV0lliooGIxpfvhenB0zeauY8fhj/+SmnGj+6DNHmtNaBlFVjeCTxVa3B/6w8hFbMjaDEhm6D7wRlk8vKJtQvjAadxhG5GnF20sY14zH7nhTTLE/kpt4mFPG+Q6qjtDzxtQwOGhjKOfx8UeUcNiNbjSb56SDTzI+4m8I3Ff4K9WFs9S2+wCofTCtUgrwXTqka81rwz3wXIHRvwue+sdH0MwwWxmEHT7RceIMEe1ROHdYi4MF8jUADA0Nh3rYmO8z2jNMTjRES2YrqTuJlzShXahMaLrT9EcnAf54fP/msYN63BC0oR6dfBmkYsb2cozCmu+pUR9ULH5mkGNiOfvZbzqonoAd6yNRjAafNWhgEcq3aA60=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0ea7dc-3d9c-4233-8061-08d731d4daa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 07:44:16.8342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZF3/9cMZLOEQJyq9eTffXhps3WWJ6oSxpE+p22f3xtMXkr9mK+o7o11BH0ZXbqsJcqe0JZxa43FAxZ/gpyDCqbJoR3LZ/6ZdRW1SAwrBIY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0902MB2038
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix only whitespace errors in imx_sc_wdt_probe()

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/watchdog/imx_sc_wdt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 78eaaf75a263..94db949042c9 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -175,12 +175,12 @@ static int imx_sc_wdt_probe(struct platform_device *p=
dev)
 	watchdog_stop_on_unregister(wdog);
=20
 	ret =3D devm_watchdog_register_device(dev, wdog);
-=20
- 	if (ret) {
- 		dev_err(dev, "Failed to register watchdog device\n");
- 		return ret;
- 	}
-=20
+
+	if (ret) {
+		dev_err(dev, "Failed to register watchdog device\n");
+		return ret;
+	}
+
 	ret =3D imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
 				       SC_IRQ_WDOG,
 				       true);
--=20
2.17.1

