Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2EE71ABA4
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 May 2019 12:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfELKKq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 May 2019 06:10:46 -0400
Received: from mail-eopbgr130074.outbound.protection.outlook.com ([40.107.13.74]:51522
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbfELKKq (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 May 2019 06:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wuIo6HOAurjSt+aDMfDV8FbKRa8xOivaU3FlKtLty0=;
 b=FL9g5cIPwiDXOLYzjDG8z2/hqmC2+iRy8DrgL+3QCLWP0aZ+ACQ8/n6ASo2SdcjQHPHH9BIbrcdyqSaDalpynRwYbSfkfjj+9u0mlJ4M5VG9IvwEclHFAbJix2kiZlmYQpTNsxDYwcH8SzavRmnfAV6RZnVx2uUtnFruy49VQCI=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3913.eurprd04.prod.outlook.com (52.134.65.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Sun, 12 May 2019 10:10:41 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::d035:3bd0:a56a:189d%2]) with mapi id 15.20.1878.022; Sun, 12 May 2019
 10:10:41 +0000
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
Subject: [PATCH RESEND V4 3/3] watchdog: imx_sc: Add pretimeout support
Thread-Topic: [PATCH RESEND V4 3/3] watchdog: imx_sc: Add pretimeout support
Thread-Index: AQHVCKr01hwB7BwH3ke9VyqgyH1V+A==
Date:   Sun, 12 May 2019 10:10:41 +0000
Message-ID: <1557655528-12816-3-git-send-email-Anson.Huang@nxp.com>
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
x-ms-office365-filtering-correlation-id: a3cd9123-28d2-46e5-675e-08d6d6c21666
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3913;
x-ms-traffictypediagnostic: DB3PR0402MB3913:
x-microsoft-antispam-prvs: <DB3PR0402MB3913AA12A88267EDBDC15D7DF50E0@DB3PR0402MB3913.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0035B15214
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(66556008)(11346002)(66066001)(73956011)(256004)(6512007)(2616005)(66446008)(64756008)(476003)(3846002)(66476007)(14444005)(66946007)(14454004)(6506007)(2201001)(386003)(6116002)(2501003)(102836004)(86362001)(6436002)(478600001)(53936002)(6486002)(71190400001)(26005)(71200400001)(186003)(8676002)(76176011)(4326008)(99286004)(25786009)(8936002)(81156014)(36756003)(446003)(50226002)(81166006)(52116002)(316002)(68736007)(5660300002)(110136005)(7416002)(2906002)(486006)(7736002)(305945005)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3913;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2qoZas5B0XJPHTQHkTzEOKBQy31xUXfgd1LgvMlaFM8TQO6Bh8Bj/fNpJjHz8kJTTTTSbo0SQpqgqA018YWeHsWua6Xh5rxyun9+4u3dKKo55HIl214ycIaaragiFmLIDiR0hJj7kHoV6edIaPbQm3F2RwAJxXzTFklVmk5UBSAjK7VJ1bsy7+pTq6dx4E5Skj7oHeHlhsszCaHmsc6L2JdwQyWkHf+RcgFuYc7bwP3B93n4qXWHo3dwtocfNKPySkqXokxttqbcXHIPryq92DDhO4oYxxHZHknl2TesIdsQTukoo8gbRQ1phCVBxN2DkACRMLui0tXXfg0gUuwImupMEaDJOiHuD3DWW/Xg7uAioQqQTAYtsUulI4K2eJvsc4YpXO2sNL+AZaJ/NDYKu6xkiN2XdMwdzg2zOaVo+9Q=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1FC568C52C47F54C88ABBA9ECC17E04C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cd9123-28d2-46e5-675e-08d6d6c21666
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2019 10:10:41.2066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

i.MX system controller watchdog can support pretimeout IRQ
via general SCU MU IRQ, it depends on IMX_SCU and driver MUST
be probed after SCU IPC ready, then enable corresponding SCU
IRQ group and register SCU IRQ notifier, when watchdog pretimeout
IRQ fires, SCU MU IRQ will be handled and watchdog pretimeout
notifier will be called to handle the event.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change, just resend patch with correct encoding.
---
 drivers/watchdog/Kconfig      |   1 +
 drivers/watchdog/imx_sc_wdt.c | 116 +++++++++++++++++++++++++++++++++++---=
----
 2 files changed, 98 insertions(+), 19 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 7ea6037..e08238c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -716,6 +716,7 @@ config IMX2_WDT
 config IMX_SC_WDT
 	tristate "IMX SC Watchdog"
 	depends on HAVE_ARM_SMCCC
+	depends on IMX_SCU
 	select WATCHDOG_CORE
 	help
 	  This is the driver for the system controller watchdog
diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 49848b6..6ecc03f 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -4,6 +4,7 @@
  */
=20
 #include <linux/arm-smccc.h>
+#include <linux/firmware/imx/sci.h>
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -33,11 +34,19 @@
=20
 #define SC_TIMER_WDOG_ACTION_PARTITION	0
=20
+#define SC_IRQ_WDOG			1
+#define SC_IRQ_GROUP_WDOG		1
+
 static bool nowayout =3D WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0000);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (defau=
lt=3D"
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
=20
+struct imx_sc_wdt_device {
+	struct watchdog_device wdd;
+	struct notifier_block wdt_notifier;
+};
+
 static int imx_sc_wdt_ping(struct watchdog_device *wdog)
 {
 	struct arm_smccc_res res;
@@ -85,24 +94,66 @@ static int imx_sc_wdt_set_timeout(struct watchdog_devic=
e *wdog,
 	return res.a0 ? -EACCES : 0;
 }
=20
+static int imx_sc_wdt_set_pretimeout(struct watchdog_device *wdog,
+				     unsigned int pretimeout)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_PRETIME_WDOG,
+		      pretimeout * 1000, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		return -EACCES;
+
+	wdog->pretimeout =3D pretimeout;
+
+	return 0;
+}
+
+static int imx_sc_wdt_notify(struct notifier_block *nb,
+			     unsigned long event, void *group)
+{
+	struct imx_sc_wdt_device *imx_sc_wdd =3D
+				 container_of(nb,
+					      struct imx_sc_wdt_device,
+					      wdt_notifier);
+
+	if (event & SC_IRQ_WDOG &&
+	    *(u8 *)group =3D=3D SC_IRQ_GROUP_WDOG)
+		watchdog_notify_pretimeout(&imx_sc_wdd->wdd);
+
+	return 0;
+}
+
+static void imx_sc_wdt_action(void *data)
+{
+	struct notifier_block *wdt_notifier =3D data;
+
+	imx_scu_irq_unregister_notifier(wdt_notifier);
+	imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
+				 SC_IRQ_WDOG,
+				 false);
+}
+
 static const struct watchdog_ops imx_sc_wdt_ops =3D {
 	.owner =3D THIS_MODULE,
 	.start =3D imx_sc_wdt_start,
 	.stop  =3D imx_sc_wdt_stop,
 	.ping  =3D imx_sc_wdt_ping,
 	.set_timeout =3D imx_sc_wdt_set_timeout,
+	.set_pretimeout =3D imx_sc_wdt_set_pretimeout,
 };
=20
-static const struct watchdog_info imx_sc_wdt_info =3D {
+static struct watchdog_info imx_sc_wdt_info =3D {
 	.identity	=3D "i.MX SC watchdog timer",
 	.options	=3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
-			  WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
+			  WDIOF_MAGICCLOSE,
 };
=20
 static int imx_sc_wdt_probe(struct platform_device *pdev)
 {
+	struct imx_sc_wdt_device *imx_sc_wdd;
+	struct watchdog_device *wdog;
 	struct device *dev =3D &pdev->dev;
-	struct watchdog_device *imx_sc_wdd;
 	int ret;
=20
 	imx_sc_wdd =3D devm_kzalloc(dev, sizeof(*imx_sc_wdd), GFP_KERNEL);
@@ -111,42 +162,69 @@ static int imx_sc_wdt_probe(struct platform_device *p=
dev)
=20
 	platform_set_drvdata(pdev, imx_sc_wdd);
=20
-	imx_sc_wdd->info =3D &imx_sc_wdt_info;
-	imx_sc_wdd->ops =3D &imx_sc_wdt_ops;
-	imx_sc_wdd->min_timeout =3D 1;
-	imx_sc_wdd->max_timeout =3D MAX_TIMEOUT;
-	imx_sc_wdd->parent =3D dev;
-	imx_sc_wdd->timeout =3D DEFAULT_TIMEOUT;
+	wdog =3D &imx_sc_wdd->wdd;
+	wdog->info =3D &imx_sc_wdt_info;
+	wdog->ops =3D &imx_sc_wdt_ops;
+	wdog->min_timeout =3D 1;
+	wdog->max_timeout =3D MAX_TIMEOUT;
+	wdog->parent =3D dev;
+	wdog->timeout =3D DEFAULT_TIMEOUT;
=20
-	watchdog_init_timeout(imx_sc_wdd, 0, dev);
-	watchdog_stop_on_reboot(imx_sc_wdd);
-	watchdog_stop_on_unregister(imx_sc_wdd);
+	watchdog_init_timeout(wdog, 0, dev);
+	watchdog_stop_on_reboot(wdog);
+	watchdog_stop_on_unregister(wdog);
=20
-	ret =3D devm_watchdog_register_device(dev, imx_sc_wdd);
+	ret =3D devm_watchdog_register_device(dev, wdog);
 	if (ret) {
 		dev_err(dev, "Failed to register watchdog device\n");
 		return ret;
 	}
=20
+	ret =3D imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
+				       SC_IRQ_WDOG,
+				       true);
+	if (ret) {
+		dev_warn(dev, "Enable irq failed, pretimeout NOT supported\n");
+		return 0;
+	}
+
+	imx_sc_wdd->wdt_notifier.notifier_call =3D imx_sc_wdt_notify;
+	ret =3D imx_scu_irq_register_notifier(&imx_sc_wdd->wdt_notifier);
+	if (ret) {
+		imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
+					 SC_IRQ_WDOG,
+					 false);
+		dev_warn(dev,
+			 "Register irq notifier failed, pretimeout NOT supported\n");
+		return 0;
+	}
+
+	ret =3D devm_add_action_or_reset(dev, imx_sc_wdt_action,
+				       &imx_sc_wdd->wdt_notifier);
+	if (!ret)
+		imx_sc_wdt_info.options |=3D WDIOF_PRETIMEOUT;
+	else
+		dev_warn(dev, "Add action failed, pretimeout NOT supported\n");
+
 	return 0;
 }
=20
 static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)
 {
-	struct watchdog_device *imx_sc_wdd =3D dev_get_drvdata(dev);
+	struct imx_sc_wdt_device *imx_sc_wdd =3D dev_get_drvdata(dev);
=20
-	if (watchdog_active(imx_sc_wdd))
-		imx_sc_wdt_stop(imx_sc_wdd);
+	if (watchdog_active(&imx_sc_wdd->wdd))
+		imx_sc_wdt_stop(&imx_sc_wdd->wdd);
=20
 	return 0;
 }
=20
 static int __maybe_unused imx_sc_wdt_resume(struct device *dev)
 {
-	struct watchdog_device *imx_sc_wdd =3D dev_get_drvdata(dev);
+	struct imx_sc_wdt_device *imx_sc_wdd =3D dev_get_drvdata(dev);
=20
-	if (watchdog_active(imx_sc_wdd))
-		imx_sc_wdt_start(imx_sc_wdd);
+	if (watchdog_active(&imx_sc_wdd->wdd))
+		imx_sc_wdt_start(&imx_sc_wdd->wdd);
=20
 	return 0;
 }
--=20
2.7.4

