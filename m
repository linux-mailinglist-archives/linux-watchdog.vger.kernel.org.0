Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA43C489D
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 09:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfJBHf2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Oct 2019 03:35:28 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:43762 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfJBHf2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Oct 2019 03:35:28 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: /xg1L3Wh0k4H4PPfmi+kLIL0EM1rg1ieWWmHZdbfS9NaSOfNEz7dOjIgvVEstYK1IYfHRVWfFt
 SxuRRMmUxzv2BYCtMo5Op/mmfLOFIK/XfKaJ8AdUWTY/3Kjs+A16SizI+ZIi9+Yj162mdQ691+
 pPb7z21M4wgYixndZeC3GELZUeAmyh2kMX3Y3hCKpwQVXF1QWbwIgrxISj6mtHKypNt+Z2MNSQ
 AxnFrF36zuD1KaDbprWCKDrRF0vBRmdymOxIGNHnflF7TJPWMwv9lV7w12PFNph9x/N7fKvHqD
 uSs=
X-IronPort-AV: E=Sophos;i="5.64,573,1559545200"; 
   d="scan'208";a="52728840"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Oct 2019 00:35:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Oct 2019 00:35:25 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 2 Oct 2019 00:35:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jr0MJK6Gu5exYzr2SY7grWohEe6Y4OxELj4uECQZjKqvl3mTcOv4GA1wNQ5v9M2A5xwDOh0NwBGY2BM1f2Cgh3HPqH2ST2aFPp3yBivwbbcTn4ctcnxlfLSn9wpsFvUAyjOUpe1hxU3UVHw+3kVvRTd6I7L+TfnHqEYIRoqndc6YopLkIVfHTDSEImjg+i6gsbeBFrEv2wKgW4LFmE6wHYV1rfdh1jy3kgwKWzmWV9URJvLnUrAhdv8Xsy3ceWjr3ML4fuv6O+608E4m2jao+mPAN4mJf8eV5VxfgZIndiwPVaRU4eFujOTI6RwUW0RZ5G2jBhDiT1zJs7WCxAXpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1oEQ9DkwGP3L3Tnm6ZiBTq3qAGN+yU6qYIqIjhyaqo=;
 b=JqD33Qa6+flG99r5cVSykoBeejQwEp/FE9vufy0WTpjzYqrMkGum8cgXJlCAwgwF2HwkgqhBJBDu9tw18+40dXoavCqCCub0PkLkT8FXoExow5iQiAEtYBoIS1vR0Z6ktJv1yVs5HcoE1ZZ58Kicm80BqIsAZpmgelDnf0efoFSE59WXuTKi7ceMBFm9PTQOilU9v7LJ7kJIgqxyuggphFi7tYTfvaOR9sUxLlLd0r0nBxMuuGdHPulL/Nc9veum2ag7lT7x8tzyb7jigC/Om7ATmHpK9dU3/yQmUXzhAQqpcvHOLo/QCde+2f5egvQ06X1c7bBzI5PUzd10Ia2z+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1oEQ9DkwGP3L3Tnm6ZiBTq3qAGN+yU6qYIqIjhyaqo=;
 b=gYl1rjWw07oKkET8dsB8SUXMfaK02VtXtY6v0v7LE+u92Abq34KHAlDJPhaqbDRsj6i/a7/Gq5gKpVI8qRoWsjufOBnBf2CereSTcJWrqGGh6lGx7HckyEe5P9v8FH2rTlMvZ+a1lQYS7Lb+Ik0hQMtcbOt1oqOLIHc/ZRhn3d0=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1434.namprd11.prod.outlook.com (10.172.36.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 07:35:23 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 07:35:23 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.or>
CC:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH 1/3] dt-bindings: watchdog: sam9x60_wdt: add bindings
Thread-Topic: [PATCH 1/3] dt-bindings: watchdog: sam9x60_wdt: add bindings
Thread-Index: AQHVePPzWPdzlzB6XEGHjkU1SLbB6g==
Date:   Wed, 2 Oct 2019 07:35:23 +0000
Message-ID: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0401CA0003.eurprd04.prod.outlook.com
 (2603:10a6:800:4a::13) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 711fcff9-eab6-4d74-a8f1-08d7470b160b
x-ms-traffictypediagnostic: DM5PR11MB1434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1434B4576557CFEF60AC31F9E89C0@DM5PR11MB1434.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(376002)(396003)(366004)(136003)(199004)(189003)(3846002)(66066001)(7736002)(6116002)(6486002)(256004)(2201001)(25786009)(305945005)(26005)(36756003)(2501003)(486006)(86362001)(8936002)(6436002)(186003)(2616005)(476003)(81166006)(81156014)(71190400001)(71200400001)(99286004)(110136005)(316002)(102836004)(8676002)(2906002)(5660300002)(66476007)(6512007)(64756008)(66446008)(66556008)(54906003)(66946007)(478600001)(107886003)(4326008)(14454004)(6506007)(386003)(50226002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1434;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l4YVG23j1Zq6oh1G92jLZmNRJHLPdXNJHZ/GDTs6ekW6xpm/cBr3wMGtEpJWT0/AQ+a761imRBrpmpv85aPLGWL7phRrPruyWu1FHu9xYNJeRKmKBe3myY2ayQQhCZSft+LzNuZ0LKuuF+sPFQRt25FQUT1CCKArVQeAn58pXw8v4gdXTJc/4CVghnrDakOxdZQZT0KS3nf331g4zBZLc9MLNmDRRZoVlJm+4lrEP975vZmsiX7765ZzDCnfrFuOfmLYksM8uWnpze7bbCIaRdtpSF4y8hWKU/UAxtkjp5QCS6A7lFdE6BOShKOCaG1+U3J4X0t0JJBhuQR1RtVAQGuMzqmTqVLuTfc/1MBuG5M83RszvWYjH8zqLcjg2k7iMkhyn/Byd+lvEO/UYhp65wODnj7djaJIArWfW7mTb8g=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 711fcff9-eab6-4d74-a8f1-08d7470b160b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 07:35:23.8488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HdOF6vDe94ktP5Mcs2MEpDZni3exfyhfV+/K2x2Gyos523CRh81dMruVztjG6Jermhone4fdKdRaFU8ODwh2sT6n7F1lMc9/+iZyQDn5u4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1434
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add bindings for Microchip SAM9X60 Watchdog Timer

It has the same bindings as
Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
except the compatible.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../devicetree/bindings/watchdog/sam9x60-wdt.txt   | 34 ++++++++++++++++++=
++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/sam9x60-wdt.=
txt

diff --git a/Documentation/devicetree/bindings/watchdog/sam9x60-wdt.txt b/D=
ocumentation/devicetree/bindings/watchdog/sam9x60-wdt.txt
new file mode 100644
index 00000000..74b4e2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/sam9x60-wdt.txt
@@ -0,0 +1,34 @@
+* Microchip SAM9X60 Watchdog Timer (WDT) Controller
+
+Required properties:
+- compatible: "microchip,sam9x60-wdt"
+- reg: base physical address and length of memory mapped region.
+
+Optional properties:
+- timeout-sec: watchdog timeout value (in seconds).
+- interrupts: interrupt number to the CPU.
+- atmel,watchdog-type: should be "hardware" or "software".
+	"hardware": enable watchdog fault reset. A watchdog fault triggers
+		    watchdog reset.
+	"software": enable watchdog fault interrupt. A watchdog fault asserts
+		    watchdog interrupt.
+- atmel,idle-halt: present if you want to stop the watchdog when the CPU i=
s
+		   in idle state.
+	CAUTION: This property should be used with care, it actually makes the
+	watchdog not counting when the CPU is in idle state, therefore the
+	watchdog reset time depends on mean CPU usage and will not reset at all
+	if the CPU stop working while it is in idle state, which is probably
+	not what you want.
+- atmel,dbg-halt: present if you want to stop the watchdog when the CPU is
+		  in debug state.
+
+Example:
+	watchdog@ffffff80 {
+		compatible =3D "microchip,sam9x60-wdt";
+		reg =3D <0xffffff80 0x24>;
+		interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 5>;
+		timeout-sec =3D <10>;
+		atmel,watchdog-type =3D "hardware";
+		atmel,dbg-halt;
+		atmel,idle-halt;
+	};
--=20
2.7.4

