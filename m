Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 547B71AB9B
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 May 2019 12:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfELKKg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 May 2019 06:10:36 -0400
Received: from mail-eopbgr130049.outbound.protection.outlook.com ([40.107.13.49]:42360
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbfELKKg (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 May 2019 06:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfV7o7qB+GSQeZRyq9facVc0aNh6wxwa807rtSeVd40=;
 b=RP+XPM+S88LyCEaFntBsxUIiPdKh35ETKvFU8SyBUHgPFw6WE82ne6SCNEFQyu0XUKfXhstB1bQl5qL9bkPnh9daJoYOfPM1ZtqBcE9yeURUvG1OcUyJcpqtQv4zQxDqGuKPYuuElT1qMIlEX+bW+9m6ta5eil+MJ/uj0ILhILI=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3913.eurprd04.prod.outlook.com (52.134.65.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Sun, 12 May 2019 10:10:30 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d%2]) with mapi id 15.20.1878.022; Sun, 12 May 2019
 10:10:30 +0000
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
Subject: [PATCH RESEND V4 1/3] dt-bindings: watchdog: move i.MX system
 controller watchdog binding to SCU
Thread-Topic: [PATCH RESEND V4 1/3] dt-bindings: watchdog: move i.MX system
 controller watchdog binding to SCU
Thread-Index: AQHVCKrtAYPvRNqPfE2cK0k7Czo+1A==
Date:   Sun, 12 May 2019 10:10:30 +0000
Message-ID: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
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
x-ms-office365-filtering-correlation-id: 8907832a-44cb-4f1a-22fd-08d6d6c2103f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3913;
x-ms-traffictypediagnostic: DB3PR0402MB3913:
x-microsoft-antispam-prvs: <DB3PR0402MB39131D731A385A86E5B3EEBEF50E0@DB3PR0402MB3913.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0035B15214
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(66556008)(66066001)(73956011)(256004)(6512007)(2616005)(66446008)(64756008)(476003)(3846002)(66476007)(14444005)(66946007)(14454004)(6506007)(2201001)(386003)(6116002)(2501003)(102836004)(86362001)(6436002)(478600001)(53936002)(6486002)(71190400001)(26005)(71200400001)(186003)(8676002)(4326008)(99286004)(25786009)(8936002)(81156014)(36756003)(50226002)(81166006)(52116002)(316002)(68736007)(5660300002)(110136005)(7416002)(2906002)(486006)(7736002)(305945005)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3913;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eg8PZ6ekXyfSgeADL+h824yUK+cb/qEzARQKqvR181pIJgzWwTlTN0MGGLbTajFTDOfUPH5421rtpGd8lTahzIve3c4iprRJYe5jMZOCi/lS1MBUofyTHU1cCTmvvZSWESR44HpcdMIKdRhfq2+7UVNtHdH++N6bRHtFNc9B20pp1iKXpc5CD0HBiEcPS7dl1fMrC3BpJY5OKhhAwhAIDqy53wkjww39GaB5LE2TDdA4SUaWMLATu+CkasZ6rl/Pqg0iX4+o/2lgpjN0hLcxdH4AkUSpk3yBjpJQ5t3V0VRDKzCCDZFjlCmOEY+cSFdD6uVvlzxmA+BNw/ZKhQP7CqsyYsr/DgwSRrPRuj4cVtYOqKP4/urwjsNSeLtMxQqCp2ssAduesyWQkeLGmS+WTNSYyALb1rTp+HcMmCYBtIQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4BD8A2D60EC3E14C97C5590BA1ECE00F@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8907832a-44cb-4f1a-22fd-08d6d6c2103f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2019 10:10:30.6037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

i.MX system controller watchdog depends on SCU driver to support
interrupt function, so it needs to be subnode of SCU node in DT,
binding doc should be moved to fsl,scu.txt as well.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change, just resend patch with correct encoding.
---
 .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 15 ++++++++++++++
 .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24 ------------------=
----
 2 files changed, 15 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-w=
dt.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/=
Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 5d7dbab..1b56557 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -133,6 +133,16 @@ RTC bindings based on SCU Message Protocol
 Required properties:
 - compatible: should be "fsl,imx8qxp-sc-rtc";
=20
+Watchdog bindings based on SCU Message Protocol
+------------------------------------------------------------
+
+Required properties:
+- compatible: should be:
+              "fsl,imx8qxp-sc-wdt"
+              followed by "fsl,imx-sc-wdt";
+Optional properties:
+- timeout-sec: contains the watchdog timeout in seconds.
+
 Example (imx8qxp):
 -------------
 aliases {
@@ -185,6 +195,11 @@ firmware {
 		rtc: rtc {
 			compatible =3D "fsl,imx8qxp-sc-rtc";
 		};
+
+		watchdog {
+			compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
+			timeout-sec =3D <60>;
+		};
 	};
 };
=20
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt =
b/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
deleted file mode 100644
index 02b87e9..0000000
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Freescale i.MX System Controller Watchdog
-
-i.MX system controller watchdog is for i.MX SoCs with system controller in=
side,
-the watchdog is managed by system controller, users can ONLY communicate w=
ith
-system controller from secure mode for watchdog operations, so Linux i.MX =
system
-controller watchdog driver will call ARM SMC API and trap into ARM-Trusted=
-Firmware
-for watchdog operations, ARM-Trusted-Firmware is running at secure EL3 mod=
e and
-it will request system controller to execute the watchdog operation passed=
 from
-Linux kernel.
-
-Required properties:
-- compatible:	Should be :
-		"fsl,imx8qxp-sc-wdt"
-		followed by "fsl,imx-sc-wdt";
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds.
-
-Examples:
-
-watchdog {
-	compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
-	timeout-sec =3D <60>;
-};
--=20
2.7.4

