Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDFFEAA605
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 16:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388979AbfIEOgy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 10:36:54 -0400
Received: from mail-eopbgr30067.outbound.protection.outlook.com ([40.107.3.67]:51509
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388785AbfIEOgx (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 10:36:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ssbtug+NmXqs5yzfIIAud3dbmk/XefNkmeD4JkBMnW+ZoJ3wbxSkbuO2obU9digu+v5otpifqm6JWo/si+vii8oOmsfQcLOQiIVIvY9ozLVzuoNIvVO/ITOQXSchMbedquf+usbFmMQtkPm5lbcEIo82UbG/hPqJtD4vJEZi5rXMXCd9GR0Ec2BD+BjgQ94Wike5FFCBhSE+v5p7EVcOMtaWR9LvrcP8mtaioTIF+KVlg0PvtOdEyk2UPaNHcFrSpl3X0hw1l+2K0GAAeFm8rKQrYRE1iVX5yF7EXCWapQsJa2/KaERvYRbHMwzySjIp4DpNttJmJ4BXTaow6sRloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3mdCUHjPwoD8Ip/OWUs6oybZ9hCZ3ir+vdNsotmpV0=;
 b=do/097Mi2fUxFuNkJLKOJgG7edvWzPa8rcvHSYVzQPHC4lzNAO/juk4MvnbIkaPe8W8PkcbOKzbEZ/x7LVEJ3tLWeu1E7OhG8qknMOXH183CzSKr+UTpl9mE0FiDp4li5PUrXRSaZcFP60ECDgtD8F2DhjlYxq73GGK0CqoZW4T3BXLhYCpdNlQWLWfZoJ9Li8UdCa7pNHUqVtJ1HxpAZcjJbamdD+TZde6PWuJyGyJQ9AwMImYNQrd7tKV0Fxe/pVcBW6XX2P0K6XZ4EkqMqmbv7uunaqa2JVXTmu539DqTZeFZVYMHXS+SC7OYK850olv2I5O1HwqJUOLPMUFWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3mdCUHjPwoD8Ip/OWUs6oybZ9hCZ3ir+vdNsotmpV0=;
 b=kpG9qjvgNStpIyhL42xwbQCJ3xysWfgMBvKPqcliRMIVaShEif5FKFGSWAtggJeTL9mn1iStszr/x9s7ShzTOYXILPqESUY0svwvCyGZpFVf298prIQWU1ZmvPuUMFcBFR9zoJUn2WLkJXGZR9tNFA4i/QKz7pe/b1xYwIum8kk=
Received: from DB6PR0902MB2072.eurprd09.prod.outlook.com (10.170.212.23) by
 DB6PR0902MB2135.eurprd09.prod.outlook.com (10.170.212.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Thu, 5 Sep 2019 14:36:49 +0000
Received: from DB6PR0902MB2072.eurprd09.prod.outlook.com
 ([fe80::19cd:2f16:89cd:67cb]) by DB6PR0902MB2072.eurprd09.prod.outlook.com
 ([fe80::19cd:2f16:89cd:67cb%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 14:36:49 +0000
From:   Oliver Graute <oliver.graute@kococonnector.com>
To:     "oliver.graute@gmail.com" <oliver.graute@gmail.com>
CC:     Oliver Graute <oliver.graute@kococonnector.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: [PATCH v2] watchdog: imx_sc: this patch just fixes whitespaces
Thread-Topic: [PATCH v2] watchdog: imx_sc: this patch just fixes whitespaces
Thread-Index: AQHVY/dZCxSIc/58L0ChQ5IO20rCxw==
Date:   Thu, 5 Sep 2019 14:36:49 +0000
Message-ID: <20190905143644.20952-1-oliver.graute@kococonnector.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0202CA0005.eurprd02.prod.outlook.com
 (2603:10a6:208:1::18) To DB6PR0902MB2072.eurprd09.prod.outlook.com
 (2603:10a6:6:8::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oliver.graute@kococonnector.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [193.47.161.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d6a22b1-6545-4aff-cfea-08d7320e7c47
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB6PR0902MB2135;
x-ms-traffictypediagnostic: DB6PR0902MB2135:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0902MB21359C2EA187F87C5813A73CEBBB0@DB6PR0902MB2135.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(39830400003)(366004)(136003)(396003)(199004)(189003)(486006)(305945005)(66066001)(2616005)(7736002)(5640700003)(476003)(386003)(1361003)(6512007)(6436002)(50226002)(8936002)(26005)(6506007)(44832011)(186003)(102836004)(256004)(71190400001)(71200400001)(6116002)(2906002)(3846002)(53936002)(5660300002)(52116002)(86362001)(7416002)(4326008)(508600001)(66446008)(64756008)(66556008)(66476007)(6916009)(66946007)(25786009)(36756003)(1076003)(6486002)(14454004)(4744005)(99286004)(81166006)(8676002)(316002)(2501003)(81156014)(2351001)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0902MB2135;H:DB6PR0902MB2072.eurprd09.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: kococonnector.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WZYHlBc6URqn6Cx28r4n9JpQIB3c9CDRGZtXLalv176+bRehleigPtt0dpFnG7bkX8Rurxgr43/ZRM+nb5OyQ5rxdX3obLBIkNrk1DhqSb4Mmy1u35Aqen7KTtPgw8rKETSq8EeXc+Unl57N1hzxgV/osjrfwDUFK8LVbQvBqMMJi5d+xt3J2QGpvbS/vsj5xsjAdJVPjpR3y2BZaAbOnmM3a3cuq0Z18ebk8nn0EUxgZDBdHnZDamXMbYxDbRQQ7F+UpgNAACreFdTsdpLz4AyNHJDWSXfyxIMti0Zk/6ok0aYK1+p5Uf1j1IccQzNmhQZ6Ofo3hgDjh/OYsjyPG5q1SJ2TQeTUTRfOZtDPc5oVYLV14oQZD2+BC5y5z6T0ikgf6PYvygw+2yERphY1BtuYC/nNz11XWgm2ZbFTJEk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6a22b1-6545-4aff-cfea-08d7320e7c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 14:36:49.3965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SHhjSn1+YRQAy7bNmlpfRFiEiYEhZfs8RSd3p0ynkGclXURVNbZHDnlE9FbBSs6Ov1RwahvXrWJFDpq6bfO2iWruBZvsrrJdRSClFARDLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0902MB2135
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Fix only whitespace errors in imx_sc_wdt_probe()

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/watchdog/imx_sc_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 9260475439eb..7ea5cf54e94a 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -176,8 +176,8 @@ static int imx_sc_wdt_probe(struct platform_device *pde=
v)
=20
 	ret =3D devm_watchdog_register_device(dev, wdog);
 	if (ret)
- 		return ret;
-=20
+		return ret;
+
 	ret =3D imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
 				       SC_IRQ_WDOG,
 				       true);
--=20
2.17.1

