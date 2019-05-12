Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B0E1ABA0
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 May 2019 12:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbfELKKk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 May 2019 06:10:40 -0400
Received: from mail-eopbgr130082.outbound.protection.outlook.com ([40.107.13.82]:7936
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbfELKKj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 May 2019 06:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3AGc1aLTArImRJodXIF4c+v04Nk6tBX7o1s2UZoggY=;
 b=UBkdP63wtIObE7QLYO+H7EnJuUYsoeD1et0b446PLnKqWmuqFjD6wDXWE7BubWHC75amwOEMP8uqBIHGu7QHUrp1+x42fsZiSP6Np2HD1wsBnXvrwB0kU66o1toCRKssgJWgYDwimOaOXPgULSkuHxjYg52bagEfCqzW3u7xgyU=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3913.eurprd04.prod.outlook.com (52.134.65.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Sun, 12 May 2019 10:10:36 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d%2]) with mapi id 15.20.1878.022; Sun, 12 May 2019
 10:10:35 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node into
 scu node
Thread-Topic: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Thread-Index: AQHVCKrxek0Xatu7SEyE08ZoyZ0h7A==
Date:   Sun, 12 May 2019 10:10:35 +0000
Message-ID: <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::24) To DB3PR0402MB3916.eurprd04.prod.outlook.com
 (2603:10a6:8:10::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a9ddf12-e453-489a-97ca-08d6d6c21341
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3913;
x-ms-traffictypediagnostic: DB3PR0402MB3913:
x-microsoft-antispam-prvs: <DB3PR0402MB3913A922BBCF3E711377A7BBF50E0@DB3PR0402MB3913.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:514;
x-forefront-prvs: 0035B15214
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(66556008)(11346002)(66066001)(73956011)(256004)(6512007)(2616005)(66446008)(64756008)(476003)(3846002)(66476007)(66946007)(14454004)(6506007)(2201001)(386003)(6116002)(2501003)(102836004)(86362001)(6436002)(478600001)(53936002)(6486002)(71190400001)(26005)(71200400001)(186003)(8676002)(76176011)(4326008)(99286004)(25786009)(8936002)(81156014)(36756003)(446003)(50226002)(81166006)(52116002)(4744005)(316002)(68736007)(5660300002)(110136005)(7416002)(2906002)(486006)(7736002)(305945005)(921003)(32563001)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3913;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d6vQKzi3qW+jsIC9SVaNoz4t7PRweXrDCOnsLJs4AraRTtGGrBuaUyYPWJu+GRCduxxAnFSu5gAB2kDHSVbJ5OX6abGXHkMrRU5kiSn3UhRqsJLSpjaKLUkwxeNDOhqQAmTrSCo/ckTcrWp9bjYQrKPv+3PaOVD2ZSzsQOkOODl0xxtyhZcuh/31TKmMGeossL5CqgxkRyo9CCAnoqi0W1GsVNJz2P5N7JIv027F65+QI0qvvV29vbI5LjM9Qp2itmbwAmGpbVxEERhTRYWlPoGUMa9qE2KZARs9hH0xR2PXvnhXD7vJ047nBxKnt7s+eBUn/V53NSthtdzvDm69ef5owT+GFV3aQQWkZB8NL6iFOMauLNjo0K8ZAnSm7kb1cWC2KtrXF5r6eRKmqTetbXpkXpik9STNkMbgHkN73Cw=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1BEDB087C1756F40B98CCF53E1F492B1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9ddf12-e453-489a-97ca-08d6d6c21341
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2019 10:10:35.8851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

i.MX system controller watchdog has pretimeout function which
depends on i.MX SCU driver, so it should be a subnode of SCU.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change, just resend patch with correct encoding.
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 0683ee2..b17c22e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -149,6 +149,11 @@
 		rtc: rtc {
 			compatible =3D "fsl,imx8qxp-sc-rtc";
 		};
+
+		watchdog {
+			compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
+			timeout-sec =3D <60>;
+		};
 	};
=20
 	timer {
@@ -517,9 +522,4 @@
 			power-domains =3D <&pd IMX_SC_R_GPIO_7>;
 		};
 	};
-
-	watchdog {
-		compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
-		timeout-sec =3D <60>;
-	};
 };
--=20
2.7.4

