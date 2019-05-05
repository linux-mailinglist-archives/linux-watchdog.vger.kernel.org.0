Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73BA513CBD
	for <lists+linux-watchdog@lfdr.de>; Sun,  5 May 2019 04:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbfEECP3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 May 2019 22:15:29 -0400
Received: from mail-eopbgr150087.outbound.protection.outlook.com ([40.107.15.87]:31297
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727308AbfEECP3 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 May 2019 22:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOIRiR5vwE7X1H3TBSlJ90bjqK0SXHYdQy7zVWW4VpA=;
 b=Ga+t7pSjjPlSGTGtS4RuNL35blOzRhQMLtjf4xtMzScemmuZvzmrosx18g/aKg04J/PaUYYkkXigx5KyhxeQFcRHMaQo1+zsC/8V6QqdJG3S3nMcovNPigu5g7AejFqWdlnAXrsLT+2OX/sEDcV0RfSGWeeYLYkX8xeu2Ar6DmE=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3721.eurprd04.prod.outlook.com (52.134.67.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Sun, 5 May 2019 02:14:54 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 02:14:54 +0000
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
        "sboyd@kernel.org" <sboyd@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH V3 2/3] arm64: dts: imx8qxp: Move watchdog node into scu node
Thread-Topic: [PATCH V3 2/3] arm64: dts: imx8qxp: Move watchdog node into scu
 node
Thread-Index: AQHVAuhTBtAtjXVfOEek45bdpineYw==
Date:   Sun, 5 May 2019 02:14:54 +0000
Message-ID: <1557022189-10993-2-git-send-email-Anson.Huang@nxp.com>
References: <1557022189-10993-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1557022189-10993-1-git-send-email-Anson.Huang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR02CA0145.apcprd02.prod.outlook.com
 (2603:1096:202:16::29) To DB3PR0402MB3916.eurprd04.prod.outlook.com
 (2603:10a6:8:10::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfc90f3a-a627-4654-0be3-08d6d0ff75e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3721;
x-ms-traffictypediagnostic: DB3PR0402MB3721:
x-microsoft-antispam-prvs: <DB3PR0402MB372116DC26A789F8CFCA840AF5370@DB3PR0402MB3721.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:514;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(39860400002)(366004)(346002)(136003)(199004)(189003)(2906002)(256004)(86362001)(25786009)(71190400001)(14454004)(76176011)(316002)(4744005)(2501003)(36756003)(6116002)(3846002)(2201001)(52116002)(478600001)(68736007)(99286004)(66066001)(8936002)(50226002)(71200400001)(6486002)(6436002)(6512007)(53936002)(4326008)(81156014)(7416002)(486006)(305945005)(186003)(73956011)(11346002)(66946007)(2616005)(476003)(66476007)(66556008)(64756008)(66446008)(446003)(102836004)(110136005)(5660300002)(6506007)(386003)(8676002)(81166006)(7736002)(26005)(921003)(32563001)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3721;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KNJoHOmTGvGyjva4U5WNjE3v1mS9zI9kxt+Ji7MT0dc6jCcvE1X9iEhypq1toPcP4xBy2yTKOxGYz0OehzWOLbh309/9myuYa4fftG4su9e3WMSsvIwGvptXPCom2kalFCfnLGb7z7R/nXwPTqLKsLDf8E1lrgrHNFj8g936uRSqk6329NZqklHgFmlFJQ+ci2ZnT0JX8fmsN184ZjlG9KrLmUfLzoH/TnHtbwdzrqx/6epGMRT9DcfrXoJuQ1q0WrlOpmsQev63gPSU5IUyBlQHglSUp5HBH9gIqUiq1Ds4j2EKdKwFHd0W2Hl0eoFWRdS3xxiYv7imCRakLb3kwszVbgPHsIbXThAfJ1BeseZZpSd7nJQWJCXIdvY2kUCzs+n8m50qdN8vK53BqLcOxGrM/akQoxIzqxueZHnFYiM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc90f3a-a627-4654-0be3-08d6d0ff75e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 02:14:54.3433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3721
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

aS5NWCBzeXN0ZW0gY29udHJvbGxlciB3YXRjaGRvZyBoYXMgcHJldGltZW91dCBmdW5jdGlvbiB3
aGljaA0KZGVwZW5kcyBvbiBpLk1YIFNDVSBkcml2ZXIsIHNvIGl0IHNob3VsZCBiZSBhIHN1Ym5v
ZGUgb2YgU0NVLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8QW5zb24uSHVhbmdAbnhw
LmNvbT4NCi0tLQ0KTm8gY2hhbmdlLg0KLS0tDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OHF4cC5kdHNpIHwgMTAgKysrKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4cXhwLmR0c2kNCmluZGV4IDA2ODNlZTIuLmIxN2MyMmUgMTAwNjQ0DQotLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KQEAgLTE0OSw2ICsxNDksMTEgQEANCiAJ
CXJ0YzogcnRjIHsNCiAJCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLXNjLXJ0YyI7DQogCQl9
Ow0KKw0KKwkJd2F0Y2hkb2cgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0
IiwgImZzbCxpbXgtc2Mtd2R0IjsNCisJCQl0aW1lb3V0LXNlYyA9IDw2MD47DQorCQl9Ow0KIAl9
Ow0KIA0KIAl0aW1lciB7DQpAQCAtNTE3LDkgKzUyMiw0IEBADQogCQkJcG93ZXItZG9tYWlucyA9
IDwmcGQgSU1YX1NDX1JfR1BJT183PjsNCiAJCX07DQogCX07DQotDQotCXdhdGNoZG9nIHsNCi0J
CWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0IiwgImZzbCxpbXgtc2Mtd2R0IjsNCi0J
CXRpbWVvdXQtc2VjID0gPDYwPjsNCi0JfTsNCiB9Ow0KLS0gDQoyLjcuNA0KDQo=
