Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84CB81000B8
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Nov 2019 09:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfKRIug (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Nov 2019 03:50:36 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:64467 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfKRIug (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Nov 2019 03:50:36 -0500
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: eb+M3XgdMsPaGaWfGomrTlZmGDNy9eYegyi2cc3y2UjrWLi2/UH5H/JRY8mVzATEiBMxQAoV16
 5IXrSSJTOEV082CmoAGD+ghiqg/XaAb5vnVOwEHmUJ8lIUeyy0lMmSdQ6hSNJ5lI6acZ3NI/8C
 fQdMoG3wGgsKSe5EDgeFANfPMUUqZD1l+BxxPNebIAM0bEnJlnfctLhjoK2ru1DovR69vfDsbj
 JZboAzkygYkhv4iK9E8N3zNyr3b/eb9LQnnXpBjmj4Hp7yLApawltyYJF/lP28vsQuvVn4sJAp
 Uws=
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; 
   d="scan'208";a="57028615"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2019 01:50:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 18 Nov 2019 01:50:34 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 18 Nov 2019 01:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOttd3AgHep7LcUZd4qO/fkLO5eEPIwi6S1fERxi3k8T7OxNOOJQfU6nZvLUN+B2m0Cags2TgZX1LYwCZyT5I/NJFgPucuq3pTQVX07RYOYRslC6MIdxO7KS58Dk2I+7GhVbkPg0uI6LWvLBaVy/0Yh2xcZseIGofYOCzumjKLLBxEZWgF8p4VEFLcuKmey2w+ejaHLwYLO5FKXtBdHfF1yaJqy/XPtHREuph1ZFPP+DY6B9Hv1RTt/LWHgrGbo4mcpBoumRyFvKkHaPCSKsBU/ud5MWNdLNddssB0/TRzMJaf2WrM930B2RdaoZbWXsNEbp6XpcEPLLcm5MzJgrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvK3Vb7gsUQMnOuGQN9Ormb8xgDwFzYQMWqiZ6uLioE=;
 b=lW1ebNnzIdZ4Z2arwcpQMu3aXKcmr4QWudDsBh0Sexk1NwKx7QgP4hdg6UGpOXJan0SK529+80Q0j8+Qwrs5wPXcsGLR9PSDpRqa2ZSzqV+niqXATU+s3LH7CCN+yGHmH6iWYVR1aLhxwWvzLjWCELVfPoM2b7fIuYxsV/l1ogtOuKeJSi5zbwtvoJZNTzX9pUdqp/a7sl5SjXPO7efCkD3QF2NHuQaWVRieXZbxHq7T9NCI/XgoaePBfXlnKG5W7CGowKpKSG9yP2po4TxTBNkef0ZAiPmxnLyMhUBFG0hHpMYt1SBYoincGJzS4QxQ+jx1RKC1ZhxFGuQhJrEA4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvK3Vb7gsUQMnOuGQN9Ormb8xgDwFzYQMWqiZ6uLioE=;
 b=FxNdKmnR76WUeNOv0+SXQitsWXgLkP6RU80MDlWSuB/UCb/Ou9THgDW3WP25V+4pwvonbzXMyH4xPGWaEkCQQUyW0emRQWhPWXDAzH9eMH9ZpZVIfc0eSeqgodN/xMqpUUc+w4wsPfbqaghQY7tMLSIy07xK5WsGDkCaSA3T41Y=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1659.namprd11.prod.outlook.com (10.172.35.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 08:50:34 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::d594:bcd0:98a9:d2c8%4]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 08:50:34 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     <Nicolas.Ferre@microchip.com>, <linux-watchdog@vger.kernel.org>,
        <Eugen.Hristev@microchip.com>
Subject: [PATCH v5 2/3] dt-bindings: watchdog: sama5d4_wdt: add
 microchip,sam9x60-wdt compatible
Thread-Topic: [PATCH v5 2/3] dt-bindings: watchdog: sama5d4_wdt: add
 microchip,sam9x60-wdt compatible
Thread-Index: AQHVne09HtH//qz6a0aQ1WXsRm7fQw==
Date:   Mon, 18 Nov 2019 08:50:33 +0000
Message-ID: <1574067012-18559-2-git-send-email-eugen.hristev@microchip.com>
References: <1574067012-18559-1-git-send-email-eugen.hristev@microchip.com>
In-Reply-To: <1574067012-18559-1-git-send-email-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0030.eurprd05.prod.outlook.com
 (2603:10a6:208:55::43) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba4ae395-f636-4c21-b555-08d76c045f94
x-ms-traffictypediagnostic: DM5PR11MB1659:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1659E1697F183B33ADE07203E84D0@DM5PR11MB1659.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(346002)(136003)(39860400002)(376002)(189003)(199004)(5660300002)(50226002)(478600001)(446003)(11346002)(81166006)(81156014)(4326008)(8676002)(2906002)(36756003)(486006)(6486002)(8936002)(66066001)(14444005)(256004)(6116002)(6512007)(54906003)(3846002)(2201001)(7736002)(305945005)(71190400001)(316002)(71200400001)(6436002)(52116002)(25786009)(110136005)(76176011)(476003)(102836004)(6506007)(386003)(186003)(2501003)(86362001)(4744005)(99286004)(66476007)(66556008)(64756008)(66446008)(66946007)(2616005)(107886003)(26005)(14454004)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR11MB1659;H:DM5PR11MB1242.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9/ux7WZ8TPoOo7ylHyKLouEilGeo57XPKZjzsDOpO2LDFS/GAYPcn9mEIvycwQWh0o7/H9+LCoGJ32rX08Nk7kAoq056fM4zXIyzz9Yr/3JvMV4HGDUixC6Eujv+coB7awAohd3mc7OxTAwRkvyBqGvNZrh/+kPnIyD1eIUQauP48aC69upY1LF9SB5wXgb2eVCPwbLZmM+BCG6qD0cuZHFJZSz4GAesSUrwceyuY7XDVrqNMmllw34eKfO2jjvbApNgaK89lcoY1ed0FIobJxndhDia4IvOnoZUrp8SlPJiavFU+aW5nnnKkDdNMUXVSBEImDdaBu8MOXxzySYQHk1KJn+wXDsXn5oU2W7RhIbgO+o1gi9qpBV7whMpnhLf1v9TbKyI+UOL3WOQFs6ZI8QI8FBUaSMAyJap4kGJOYD+NzfrSPt36Cg63j/c/xVU
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4ae395-f636-4c21-b555-08d76c045f94
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 08:50:33.9792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2h0WQlFyXlf/jW+Oo1Udd65BV38Xlb5evqrsM3ZCEJIyjxYqAfjE7kDZmIsFRRRQXS28+7DguUFyCR4f2+PzPPtZZ3dA/FpkZmqidnJGCOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1659
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

The Atmel sama5d4_wdt needs to be compatible with microchip,sam9x60-wdt
The sama5d4_wdt driver is updated to work with both hardware blocks
(sama5d4/sama5d2 and sam9x60 based blocks)

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.t=
xt b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
index 4fec1e3..44727fc 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
@@ -1,7 +1,7 @@
 * Atmel SAMA5D4 Watchdog Timer (WDT) Controller
=20
 Required properties:
-- compatible: "atmel,sama5d4-wdt"
+- compatible: "atmel,sama5d4-wdt" or "microchip,sam9x60-wdt"
 - reg: base physical address and length of memory mapped region.
=20
 Optional properties:
--=20
2.7.4

