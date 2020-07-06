Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE374215BDA
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jul 2020 18:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbgGFQdd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jul 2020 12:33:33 -0400
Received: from mail-co1nam11on2113.outbound.protection.outlook.com ([40.107.220.113]:39264
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729293AbgGFQdd (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jul 2020 12:33:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQi4kz9V4DrapQtUBtkPkKP0149viDeeUxUqGSlfCvIL3pJB9IUOVwu8qBHPd6//z9xzSNNsGF24hyLmDa4ZAt5TDA1pYB+nftBBBkDlz/qHHgY/qGXOsYClcX+aFoWQbXKwi6FBkv9a98h/0Bwa6/KXoQbvUxFbeSn9hGyAYWaGLt0XPDToO3ILEAIwZNvDP3LC3KNo011vO8/KG4G9gqQpnLuKVheWqRvwAExHSlpuP23N/elb6rXSzT5hofFGlqPbN4PB/tHzf4ei+WBwYIK/OHGQyaK3WE15mvUK1zt5HLAOxrDADhQARmSKqBOFtF5OQkrimTj7DOTLvTTuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHQQBFom6Hig5u53Ks8iq+cE258DtbFv2laWaEQWAhM=;
 b=hDx7hL1YYF/YOArxUpT3gQP3lPe3AzrtCVZNSrXVx0FIwlm2+uLUYxpiVnSvG5LzvG5XCD2b81XxCixxJWMFXcyJ+9rGYLEfy4Ms9ylcitRMZzN0+vqhKbKkTCmUD8XxR4mcQQF+wOXqBDFOUbpMQiZIFC1qrXUfnG3PngyMlQ3/3XCGeo/76Y3P881qmpXbHvsUuNZaQgsinessovE4XewdGXLGwTZM1KR37/HJ5zrGXvBqn8ZkS9nRZ9MQI27jpANIvUIQcoET5k9LImFwIHs/bgqUH3ZBS5jAlY/V8XKCTzYrFsUB8QpksU/bQ1slcVzm0lD6iaIP4s3vEzww/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=adtran.com; dmarc=pass action=none header.from=adtran.com;
 dkim=pass header.d=adtran.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ADTRAN.onmicrosoft.com; s=selector2-ADTRAN-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHQQBFom6Hig5u53Ks8iq+cE258DtbFv2laWaEQWAhM=;
 b=pSJC32huZ8vfG/WJ9laE9edG51NTxnEEe6jHVGe894Sf6+salaftKEjMtfKFX+DWLdmXcIRcxIAh2A2+LEopBK3LMlELf7PXbNYWup0SOK8cuskIu5Ac4XUvXNur+qkwLFRXXrO1pxptmf3MnPorlU4dTEn2fg6S64loSvWz9Zc=
Received: from CH2PR19MB3590.namprd19.prod.outlook.com (2603:10b6:610:41::21)
 by CH2PR19MB3990.namprd19.prod.outlook.com (2603:10b6:610:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Mon, 6 Jul
 2020 16:33:31 +0000
Received: from CH2PR19MB3590.namprd19.prod.outlook.com
 ([fe80::d08:8df0:e25a:2a83]) by CH2PR19MB3590.namprd19.prod.outlook.com
 ([fe80::d08:8df0:e25a:2a83%3]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 16:33:31 +0000
From:   Timothy Myers <timothy.myers@adtran.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Boike <david.boike@adtran.com>
Subject: [PATCH v3 1/1] watchdog: Add common nowayout parameter to booke_wdt
 driver
Thread-Topic: [PATCH v3 1/1] watchdog: Add common nowayout parameter to
 booke_wdt driver
Thread-Index: AQHWU7JDRSh3gBbtWE2YCV42YoqLzw==
Date:   Mon, 6 Jul 2020 16:33:31 +0000
Message-ID: <CH2PR19MB359059AA5C8917D8D24633FF9D690@CH2PR19MB3590.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-watchdog.org; dkim=none (message not signed)
 header.d=none;linux-watchdog.org; dmarc=none action=none
 header.from=adtran.com;
x-originating-ip: [24.96.75.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b436e88-8fc4-4e25-b60b-08d821ca51c0
x-ms-traffictypediagnostic: CH2PR19MB3990:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR19MB399001ED62129360BE09307D9D690@CH2PR19MB3990.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GhSFKfA1pIbDWMCraKAIEFOSbLaVE5EkcyWxYIA274drYtE4Xb5CK5zxXLpHsnAaRxVt48jodQcI3wPyZILqF+NMyQUyEo3W7dKckKcO5QFOIAjwkuf+HBIfAzMpiaF2vN6p+0gpZI7mYsSNRiz0PeCFcqF/9pNupdqyjz5vTLc8gHZfgwaevsd7RHkUIiF/iI7o5e5Vny3kcIuicpf9RFtRGZy7BA/TFLBiFBJwP+DpeI3b/nMk2fxlsC4hu2PY4NNP76jJ8gzXdnjDmT9k3gU+eZC6R2ITZOo4BIYfwl01L5/K9EG9RRpF+lBr22IY8jOMaQFQ7Xk3LBStxbXigfNP+k5uBGn4YEgJHyANb6JQqLOp9HnUQiQeNLf2oCNGIAbdLiKYWUvhWoAdmzvkjw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR19MB3590.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(376002)(366004)(39850400004)(396003)(64756008)(44832011)(66946007)(55016002)(66476007)(66446008)(2906002)(66556008)(76116006)(15974865002)(7696005)(91956017)(71200400001)(8936002)(4326008)(186003)(107886003)(9686003)(86362001)(8676002)(54906003)(110136005)(316002)(478600001)(83380400001)(5660300002)(6506007)(26005)(33656002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Bf2m0ymGamQdUFPWExkPX0DrqNIuwe+GrRlYeC67IYn8ToUZa4xLIqA7PCoqkCYX7TirZHsw8nuwvjPnHTVIZBUDCKjdb0RbA6TxihNv9TVuEuFF/ZaVY4/M2EXPkp9Xxyq7xkwwcPZoNrzcNvERexMIS5WuAorg9T+p5zPKPjHj5XEIhznpIE+cx9NoTlQqwL2K9HX3v8+ukbJZc6vB2S10NVC68/NwJkgNiuMV0xEmhuc2yGQU7l0hYFOUFh8TYdxPusPyyRR5t4HWozdRAjy82F6+R5OeoSLywWO86smMqy8EzFbQBl3prQO9EwB4RZ5ZmYwX7z5DrqiRQLSjmeXeK0o+YsT/al1pjj+iVPH+nPDqtUCyFgLxDsqcYcC1R4qWPyh3OEDZ2Oylrt51EoYCpRzjYdNhpGO7x/liCUYNp95Wrof/rUae0OYnA9/4EyzawBMibX0/eFG7C1me1u0vl/uNBXBMSTzILZRn6VA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: adtran.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR19MB3590.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b436e88-8fc4-4e25-b60b-08d821ca51c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 16:33:31.0550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 423946e4-28c0-4deb-904c-a4a4b174fb3f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9a0cQ2pECW4oBwVw8oHyA4/DFBn6+SWLlBDZDvW6RNRHU/f1J0fhQ6aFLraB57QXhqc2AqLnDq5+iiistiz5F010w+nP9obV/PGihw67fiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3990
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add the common "nowayout" parameter to booke_wdt to make this behavior=0A=
selectable at runtime and to make the implementation more consistent with=
=0A=
many other watchdog drivers.=0A=
=0A=
Signed-off-by: Timothy Myers <timothy.myers@adtran.com>=0A=
Reviewed-by: Guenter Roeck <linux@roeck-us.net>=0A=
=0A=
Changes in:=0A=
	v2:=0A=
		Added Guenter Roeck's reviewed-by tag at his request=0A=
	v3:=0A=
		Fix whitespace formatting in message.=0A=
---=0A=
 drivers/watchdog/booke_wdt.c | 6 +++++-=0A=
 1 file changed, 5 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/watchdog/booke_wdt.c b/drivers/watchdog/booke_wdt.c=0A=
index 9d09bbfdef20..7817fb976f9c 100644=0A=
--- a/drivers/watchdog/booke_wdt.c=0A=
+++ b/drivers/watchdog/booke_wdt.c=0A=
@@ -39,6 +39,11 @@ static bool booke_wdt_enabled;=0A=
 module_param(booke_wdt_enabled, bool, 0);=0A=
 static int  booke_wdt_period =3D CONFIG_BOOKE_WDT_DEFAULT_TIMEOUT;=0A=
 module_param(booke_wdt_period, int, 0);=0A=
+static bool nowayout =3D WATCHDOG_NOWAYOUT;=0A=
+module_param(nowayout, bool, 0);=0A=
+MODULE_PARM_DESC(nowayout,=0A=
+		"Watchdog cannot be stopped once started (default=3D"=0A=
+				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");=0A=
 =0A=
 #ifdef CONFIG_PPC_FSL_BOOK3E=0A=
 =0A=
@@ -215,7 +220,6 @@ static void __exit booke_wdt_exit(void)=0A=
 static int __init booke_wdt_init(void)=0A=
 {=0A=
 	int ret =3D 0;=0A=
-	bool nowayout =3D WATCHDOG_NOWAYOUT;=0A=
 =0A=
 	pr_info("powerpc book-e watchdog driver loaded\n");=0A=
 	booke_wdt_info.firmware_version =3D cur_cpu_spec->pvr_value;=0A=
=0A=
base-commit: dd0d718152e4c65b173070d48ea9dfc06894c3e5=0A=
-- =0A=
2.20.1=0A=
=0A=
Timothy Myers=0A=
Software Design Engineer=0A=
=0A=
Office: 256.963.8844=0A=
Email: timothy.myers@adtran.com=0A=
Web:=A0www.adtran.com=0A=
=0A=
ADTRAN=0A=
901 Explorer Boulevard=A0=0A=
Huntsville, AL 35806 - USA=
