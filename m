Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F20AC48A1
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 09:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfJBHfc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Oct 2019 03:35:32 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:35493 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfJBHfb (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Oct 2019 03:35:31 -0400
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
IronPort-SDR: aa1DexQTRdL3tB7NeCUumi0OAFRpJ9ADHZYx9lAivpsY49IqaCaAZWvwGJUgpxWL7v9foBA1F7
 vVyhcVGtcWBoRPlxJ8nhjsXNLEeRKeP4pjOgks7YVO4+td9ragvR13Irm50fq5wXpeLxD1IaqB
 JxACpw1HeobaY7SePSqRlIuqQXrNk2bqux8I7Xwl8nQNKI8stGYEZpOrlUdJpxOiXBT6LLwEeA
 xTgM6kV8jj3DbCduqqodufFwYi2w4YeGWjKYVFwWFjEE4MyF81z8RfQ35lgSoUkMMdLizPWHo8
 o3A=
X-IronPort-AV: E=Sophos;i="5.64,573,1559545200"; 
   d="scan'208";a="51365944"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Oct 2019 00:35:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Oct 2019 00:35:30 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Oct 2019 00:35:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAnFpH+vQsagiDaApHfqVtEq44wOqKoAZ8xIzW8eIpE7cKJxrFSjRjSkwA7xeKavAqdYj1eLbY/bx1p5oMPPu6MqScW8B2/Ta0bNjxfo3dP3wtyHBugRErGOu3QWvveVIUp0OZpZtNgRlTuMBDLjLrNtcGoD7oMgQ7ePErp0st/7xYXOtH9upalV3w0Y13KtmVe/RJN/tgov5vofKk1dhch4CJQGst7ohYnPopovUeA001vga0QFCDZVgv9V/Tjav9NR/Wg21/+Z6J8IaC1n1XZJzGhOx9+kwX20hrW9h+r+++98t3pVNT0ObCj8BqGFJeEhRQqfBY+MGTBspMroOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJXM5vKkXTG6tC7qRaXNz8/YKp/zNB8RAKvwokzWA4Q=;
 b=LnhfwMNVwczEUSRxxnFQ82OD8Lfvea+fnHsE78GgV2IUwK1AdMLZo7yAPnppSokasbDfv3z5WKI8QwABTTQQLfhwB+8+dcA5VH5T2/anjw8dbORjaiirIUh9UokNN3khsjIKs/wY3Ep2q8Z25YpKrl9/V+j5NzqWUHWbc98LGy5mKTNNByBQK0/6qLi2tQi6cw4O0dag2oaQyIjGCoesVtgMdoK+BHNM0Q9zScP0IEYjlmxRkWMlFmlzBQBL6exOzLKDPn/WHbjk+ziwxVahc4j8Z3/+iY7j93PSEt+yamnQrk4pQ0qb61MURNlyjOC24lbqeP5FQRciKOLikwbI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJXM5vKkXTG6tC7qRaXNz8/YKp/zNB8RAKvwokzWA4Q=;
 b=qXl5sW48Y4q5U7apiY2xBRph0/nVHrV8mdv4nmmMB0bP4Y5GKhsyECAbNqWMfJld8/QuOq5djojpy+G1tQL+nsyx9UKyLXHwc8Lg1DzufarVXb9/ahuZMUDCWCY1e8PXZhy0tEnouYaSZwQoox68ztmRGalf3THkdarMp+c3Ir8=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1434.namprd11.prod.outlook.com (10.172.36.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 07:35:29 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::b125:76c1:c9b1:34f4%10]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 07:35:29 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.or>
CC:     <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH 3/3] MAINTAINERS: add sam9x60_wdt
Thread-Topic: [PATCH 3/3] MAINTAINERS: add sam9x60_wdt
Thread-Index: AQHVePP29VASus7neUmCph57/u2WKA==
Date:   Wed, 2 Oct 2019 07:35:28 +0000
Message-ID: <1570001371-8174-3-git-send-email-eugen.hristev@microchip.com>
References: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
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
x-ms-office365-filtering-correlation-id: 907e01eb-0a13-496b-ba87-08d7470b190d
x-ms-traffictypediagnostic: DM5PR11MB1434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB14340333E646FEDF3716D091E89C0@DM5PR11MB1434.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:361;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(376002)(396003)(366004)(136003)(199004)(189003)(3846002)(66066001)(7736002)(6116002)(6486002)(256004)(2201001)(25786009)(305945005)(26005)(36756003)(2501003)(486006)(86362001)(8936002)(446003)(6436002)(11346002)(186003)(2616005)(476003)(81166006)(81156014)(71190400001)(71200400001)(99286004)(110136005)(316002)(102836004)(8676002)(2906002)(5660300002)(66476007)(6512007)(64756008)(66446008)(66556008)(54906003)(66946007)(478600001)(107886003)(4744005)(4326008)(76176011)(14454004)(6506007)(386003)(50226002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1434;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oAIquSHpyJdf2xEjKdQlsDVixRBvGFJy3dw+HrDvG6A3K60qa57ynahvUDpIzn5oeLHHjL2qySbSFI0uvLBxZLm+HTvrjRv8hRDdYGw9lDlIdlbj4A70xr5ITzE99Vv8VirXEkBfNhNO939fvSv8nH7Cs/DyVqDvC2Lm1iln8vDxTFBQT4ayy3lUVOHIRtt0KvcJlGigvihZ08rM4l3p1Xu62MqSvFey8U3ygYP9W8Y9G4Uf66ciFUcABrAMoV00c/HrwEQo6FXYEempujEvWeEWc7qMcClXxobSzCNB0iHpO51kVH9tuFGE74y9eTFv7YiNkgqm5WCn4GpAw9KOHJgVlDuwYbPQQJ3j7laKTyaRKIfdDnEOz92utsio1QjIs2YzgtL6IpD3RfPFi0dgmU4PJ5nR0k1OpXC/8MgtG3I=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 907e01eb-0a13-496b-ba87-08d7470b190d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 07:35:29.0595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3QqkLF3NwZ2XGZK0VfEFHsVRUr8WklUNtx8takuawV6uFFiaKlnS8Dxezolom5jxN7LlKemNE2Pv7XSFMR4ozlP6CBfSdeL5UVgUXiU4JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1434
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add sam9x60_wdt watchdog driver to at91 soc support.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 296de2b..109b030 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1972,6 +1972,7 @@ F:	arch/arm/boot/dts/sama*.dtsi
 F:	arch/arm/include/debug/at91.S
 F:	drivers/memory/atmel*
 F:	drivers/watchdog/sama5d4_wdt.c
+F:	drivers/watchdog/sam9x60_wdt.c
 X:	drivers/input/touchscreen/atmel_mxt_ts.c
 X:	drivers/net/wireless/atmel/
=20
--=20
2.7.4

