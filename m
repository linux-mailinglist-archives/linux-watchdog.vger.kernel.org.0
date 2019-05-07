Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA0415736
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 May 2019 03:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfEGBU2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 May 2019 21:20:28 -0400
Received: from mail-eopbgr70077.outbound.protection.outlook.com ([40.107.7.77]:52516
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726403AbfEGBU2 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 May 2019 21:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlsJ87U+Nw6vjUSzmu+kVQz5RY1QZu6VTPbGUScSUTQ=;
 b=vFKPDtmtoai2nHuOqpIlP8wOSwMeftDYRBz43s48YuKn73UHJR20UkMbNubPsztbDDFIUk1HeOweCZYo412Qx6s+SwfDhLT5wcMWLXfdXBdvAKpJkItRV7umaZli4QCMcSWUdP8530Bkm3w65O8x0guPrQffuZl5neiOmvxT+sw=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3737.eurprd04.prod.outlook.com (52.134.66.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 01:20:19 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e8ca:4f6b:e43:c170%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 01:20:19 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
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
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V3 3/3] watchdog: imx_sc: Add pretimeout support
Thread-Topic: [PATCH V3 3/3] watchdog: imx_sc: Add pretimeout support
Thread-Index: AQHVAuhX3Dci+0ziCkuAahuxTj8vraZebQMAgAByf8A=
Date:   Tue, 7 May 2019 01:20:19 +0000
Message-ID: <DB3PR0402MB39164F95173C3D302C21FBD4F5310@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1557022189-10993-1-git-send-email-Anson.Huang@nxp.com>
 <1557022189-10993-3-git-send-email-Anson.Huang@nxp.com>
 <20190506182752.GA358@roeck-us.net>
In-Reply-To: <20190506182752.GA358@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7a87aed-1217-44c9-b29c-08d6d28a2b7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:DB3PR0402MB3737;
x-ms-traffictypediagnostic: DB3PR0402MB3737:
x-microsoft-antispam-prvs: <DB3PR0402MB37372B444C9868BEDE69FE4BF5310@DB3PR0402MB3737.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(39860400002)(346002)(366004)(396003)(13464003)(189003)(199004)(7416002)(2906002)(7696005)(33656002)(5660300002)(446003)(6916009)(476003)(71200400001)(71190400001)(11346002)(6246003)(44832011)(102836004)(6436002)(68736007)(186003)(26005)(25786009)(74316002)(8936002)(8676002)(81156014)(81166006)(9686003)(54906003)(55016002)(53546011)(53936002)(6506007)(7736002)(52536014)(486006)(229853002)(316002)(99286004)(478600001)(76176011)(66556008)(66476007)(4326008)(64756008)(66446008)(14454004)(256004)(14444005)(76116006)(66946007)(73956011)(6116002)(305945005)(66066001)(3846002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3737;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lzEjC+yhRiOfIHUygp8miCAQ5UCugMp/0wED3rt6GE2bahbYFh6Rxyli4OU1FABoYn2dLuTHV1PQ5X703MW4FhJXD2aT76csuXDwUcGGMnM+Do+3swvxxKHsquBv+mchZKrtLVCxqXjjAEzH95HMkob6+GXhT5q9e6cUXQC3hJcvB/K9Ak+pYuPMT8H7zAt9XZRzJ07Vm18gyEuNaGLWbeTGeHkKlyRjdZdWG9nVVLg5l0jk1ARj93lwZiccssKGi2MpDQDsJuSx8q8q0Enyr00l8TUj4WpgFuNjXfckUyKqJPv0hT4gzq2DtaH7T6TOe2VCTQCpq+zsJkiel1DdN2htwFLNFgy6uYBjSsg6HDxJQsTXcP2SYfeXt+3NZs4kZFLia/Z1s5a3Qzq+ZLnX6HvYzuOzlcYN0QNUeqAY4tM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a87aed-1217-44c9-b29c-08d6d28a2b7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 01:20:19.5351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3737
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi, Guenter

> -----Original Message-----
> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
> Roeck
> Sent: Tuesday, May 7, 2019 2:28 AM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; wim@linux-watchdog.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; Aisheng Dong <aisheng.dong@nxp.com>;
> ulf.hansson@linaro.org; sboyd@kernel.org; Daniel Baluta
> <daniel.baluta@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> watchdog@vger.kernel.org; linux-arm-kernel@lists.infradead.org; dl-linux-
> imx <linux-imx@nxp.com>
> Subject: Re: [PATCH V3 3/3] watchdog: imx_sc: Add pretimeout support
>=20
> On Sun, May 05, 2019 at 02:15:00AM +0000, Anson Huang wrote:
> > i.MX system controller watchdog can support pretimeout IRQ via general
> > SCU MU IRQ, it depends on IMX_SCU and driver MUST be probed after SCU
> > IPC ready, then enable corresponding SCU IRQ group and register SCU
> > IRQ notifier, when watchdog pretimeout IRQ fires, SCU MU IRQ will be
> > handled and watchdog pretimeout notifier will be called to handle the
> > event.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> > No change.
> > ---
> >  drivers/watchdog/Kconfig      |   1 +
> >  drivers/watchdog/imx_sc_wdt.c | 114
> > ++++++++++++++++++++++++++++++++++--------
> >  2 files changed, 95 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig index
> > e19960a..dbc74e1 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -710,6 +710,7 @@ config IMX2_WDT
> >  config IMX_SC_WDT
> >  	tristate "IMX SC Watchdog"
> >  	depends on HAVE_ARM_SMCCC
> > +	depends on IMX_SCU
> >  	select WATCHDOG_CORE
> >  	help
> >  	  This is the driver for the system controller watchdog diff --git
> > a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c index
> > 49848b6..d8493a3 100644
> > --- a/drivers/watchdog/imx_sc_wdt.c
> > +++ b/drivers/watchdog/imx_sc_wdt.c
> > @@ -4,6 +4,7 @@
> >   */
> >
> >  #include <linux/arm-smccc.h>
> > +#include <linux/firmware/imx/sci.h>
> >  #include <linux/io.h>
> >  #include <linux/init.h>
> >  #include <linux/kernel.h>
> > @@ -33,11 +34,19 @@
> >
> >  #define SC_TIMER_WDOG_ACTION_PARTITION	0
> >
> > +#define SC_IRQ_WDOG			1
> > +#define SC_IRQ_GROUP_WDOG		1
> > +
> >  static bool nowayout =3D WATCHDOG_NOWAYOUT;
> module_param(nowayout,
> > bool, 0000);  MODULE_PARM_DESC(nowayout, "Watchdog cannot be
> stopped
> > once started (default=3D"
> >  		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> >
> > +struct imx_sc_wdt_device {
> > +	struct watchdog_device wdd;
> > +	struct notifier_block wdt_notifier;
> > +};
> > +
> >  static int imx_sc_wdt_ping(struct watchdog_device *wdog)  {
> >  	struct arm_smccc_res res;
> > @@ -85,24 +94,66 @@ static int imx_sc_wdt_set_timeout(struct
> watchdog_device *wdog,
> >  	return res.a0 ? -EACCES : 0;
> >  }
> >
> > +static int imx_sc_wdt_set_pretimeout(struct watchdog_device *wdog,
> > +				     unsigned int pretimeout)
> > +{
> > +	struct arm_smccc_res res;
> > +
> > +	arm_smccc_smc(IMX_SIP_TIMER,
> IMX_SIP_TIMER_SET_PRETIME_WDOG,
> > +		      pretimeout * 1000, 0, 0, 0, 0, 0, &res);
> > +	if (res.a0)
> > +		return -EACCES;
> > +
> > +	wdog->pretimeout =3D pretimeout;
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx_sc_wdt_notify(struct notifier_block *nb,
> > +			     unsigned long event, void *group) {
> > +	struct imx_sc_wdt_device *imx_sc_wdd =3D
> > +				 container_of(nb,
> > +					      struct imx_sc_wdt_device,
> > +					      wdt_notifier);
> > +
> > +	if (event & SC_IRQ_WDOG &&
> > +	    *(u8 *)group =3D=3D SC_IRQ_GROUP_WDOG)
> > +		watchdog_notify_pretimeout(&imx_sc_wdd->wdd);
> > +
> > +	return 0;
> > +}
> > +
> > +static void imx_sc_wdt_action(void *data) {
> > +	struct notifier_block *wdt_notifier =3D data;
> > +
> > +	imx_scu_irq_unregister_notifier(wdt_notifier);
> > +	imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> > +				 SC_IRQ_WDOG,
> > +				 false);
> > +}
> > +
> >  static const struct watchdog_ops imx_sc_wdt_ops =3D {
> >  	.owner =3D THIS_MODULE,
> >  	.start =3D imx_sc_wdt_start,
> >  	.stop  =3D imx_sc_wdt_stop,
> >  	.ping  =3D imx_sc_wdt_ping,
> >  	.set_timeout =3D imx_sc_wdt_set_timeout,
> > +	.set_pretimeout =3D imx_sc_wdt_set_pretimeout,
> >  };
> >
> > -static const struct watchdog_info imx_sc_wdt_info =3D {
> > +static struct watchdog_info imx_sc_wdt_info =3D {
> >  	.identity	=3D "i.MX SC watchdog timer",
> >  	.options	=3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> > -			  WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
> > +			  WDIOF_MAGICCLOSE,
> >  };
> >
> >  static int imx_sc_wdt_probe(struct platform_device *pdev)  {
> > +	struct imx_sc_wdt_device *imx_sc_wdd;
> > +	struct watchdog_device *wdog;
> >  	struct device *dev =3D &pdev->dev;
> > -	struct watchdog_device *imx_sc_wdd;
> >  	int ret;
> >
> >  	imx_sc_wdd =3D devm_kzalloc(dev, sizeof(*imx_sc_wdd), GFP_KERNEL);
> @@
> > -111,42 +162,65 @@ static int imx_sc_wdt_probe(struct platform_device
> > *pdev)
> >
> >  	platform_set_drvdata(pdev, imx_sc_wdd);
> >
> > -	imx_sc_wdd->info =3D &imx_sc_wdt_info;
> > -	imx_sc_wdd->ops =3D &imx_sc_wdt_ops;
> > -	imx_sc_wdd->min_timeout =3D 1;
> > -	imx_sc_wdd->max_timeout =3D MAX_TIMEOUT;
> > -	imx_sc_wdd->parent =3D dev;
> > -	imx_sc_wdd->timeout =3D DEFAULT_TIMEOUT;
> > +	wdog =3D &imx_sc_wdd->wdd;
> > +	wdog->info =3D &imx_sc_wdt_info;
> > +	wdog->ops =3D &imx_sc_wdt_ops;
> > +	wdog->min_timeout =3D 1;
> > +	wdog->max_timeout =3D MAX_TIMEOUT;
> > +	wdog->parent =3D dev;
> > +	wdog->timeout =3D DEFAULT_TIMEOUT;
> >
> > -	watchdog_init_timeout(imx_sc_wdd, 0, dev);
> > -	watchdog_stop_on_reboot(imx_sc_wdd);
> > -	watchdog_stop_on_unregister(imx_sc_wdd);
> > +	watchdog_init_timeout(wdog, 0, dev);
> > +	watchdog_stop_on_reboot(wdog);
> > +	watchdog_stop_on_unregister(wdog);
> >
> > -	ret =3D devm_watchdog_register_device(dev, imx_sc_wdd);
> > +	ret =3D devm_watchdog_register_device(dev, wdog);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to register watchdog device\n");
> >  		return ret;
> >  	}
> >
> > -	return 0;
> > +	ret =3D imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> > +				       SC_IRQ_WDOG,
> > +				       true);
> > +	if (ret) {
> > +		dev_warn(dev, "Enable irq failed, pretimeout NOT
> supported\n");
> > +		return 0;
> > +	}
> > +
> > +	imx_sc_wdd->wdt_notifier.notifier_call =3D imx_sc_wdt_notify;
> > +	ret =3D imx_scu_irq_register_notifier(&imx_sc_wdd->wdt_notifier);
> > +	if (ret) {
> > +		imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
> > +					 SC_IRQ_WDOG,
> > +					 false);
> > +		dev_warn(dev,
> > +			 "Register irq notifier failed, pretimeout NOT
> supported\n");
> > +		return 0;
> > +	}
> > +
> > +	imx_sc_wdt_info.options |=3D WDIOF_PRETIMEOUT;
> > +	ret =3D devm_add_action(dev, imx_sc_wdt_action,
> > +			      &imx_sc_wdd->wdt_notifier);
>=20
> This needs devm_add_action_or_reset() because otherwise the notifier
> would not be removed, and the interrupt group would not be disabled.

Right, fix it in V4.

>=20
> > +	return ret;
>=20
> This should not return an error. Accepting that the notifier can not be
> registered and that the irq group can not be enabled but bailing out if
> devm_add_action() fails is inconsistent.
>=20

Agreed, the pretimeout function should ONLT be enabled after the notifier
register, irq group enable and add action all success, so I use below code
in V4, please help review, thanks,

+
+       ret =3D devm_add_action_or_reset(dev, imx_sc_wdt_action,
+                                      &imx_sc_wdd->wdt_notifier);
+       if (!ret)
+               imx_sc_wdt_info.options |=3D WDIOF_PRETIMEOUT;
+       else
+               dev_warn(dev, "Add action failed, pretimeout NOT supported\=
n");
+
        return 0;

Anson.

> Guenter
>=20
> >  }
> >
> >  static int __maybe_unused imx_sc_wdt_suspend(struct device *dev)  {
> > -	struct watchdog_device *imx_sc_wdd =3D dev_get_drvdata(dev);
> > +	struct imx_sc_wdt_device *imx_sc_wdd =3D dev_get_drvdata(dev);
> >
> > -	if (watchdog_active(imx_sc_wdd))
> > -		imx_sc_wdt_stop(imx_sc_wdd);
> > +	if (watchdog_active(&imx_sc_wdd->wdd))
> > +		imx_sc_wdt_stop(&imx_sc_wdd->wdd);
> >
> >  	return 0;
> >  }
> >
> >  static int __maybe_unused imx_sc_wdt_resume(struct device *dev)  {
> > -	struct watchdog_device *imx_sc_wdd =3D dev_get_drvdata(dev);
> > +	struct imx_sc_wdt_device *imx_sc_wdd =3D dev_get_drvdata(dev);
> >
> > -	if (watchdog_active(imx_sc_wdd))
> > -		imx_sc_wdt_start(imx_sc_wdd);
> > +	if (watchdog_active(&imx_sc_wdd->wdd))
> > +		imx_sc_wdt_start(&imx_sc_wdd->wdd);
> >
> >  	return 0;
> >  }
> > --
> > 2.7.4
> >
