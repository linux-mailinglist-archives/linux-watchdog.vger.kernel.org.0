Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF752A80C8
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 15:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbgKEOX7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 09:23:59 -0500
Received: from mga03.intel.com ([134.134.136.65]:49115 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730139AbgKEOX7 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 09:23:59 -0500
IronPort-SDR: LjbZBxZsntlhJvICQtIJ+1GcSjqaxDoT+tXHwSvQaFJgPoA5zYS08m6/1Bt7J+XaND2BYztjFa
 kWB9MgWIrNPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="169497752"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="169497752"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 06:23:48 -0800
IronPort-SDR: /3RZOtuMcai9g4FWPc5HSi7oIgmf11CKtBgsFWVEi6snRbOoJgHsN7lF5tVSmZEUp5598rb6HX
 ecL3DMyJWK0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="397263825"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 05 Nov 2020 06:23:48 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 5 Nov 2020 06:23:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 5 Nov 2020 06:23:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 5 Nov 2020 06:23:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJWaLW1s3SPuJofKne2wwAMBOGHCo3Sg/EZMaSNLpHomuwTWKL/7se1O9sRNTLk7hZVp6i3xIbMyUIg1+sxs1DAoeLwbwyfJXx59bNRrALTJO0UG1YeOMYtgmMpVzVPGc/TK9nkAfm/UEZAr3PrmGPTfgrATG+iTwkiq6BbNWvjdrJ6UTBmPWlWwloNhOSaxrPgbmi0DyR3NBRrB6HUt/IdMVtrCUfcPriWdDzUknsk6bEcU+jR8RUJOAxTZFaYmMMC27Gl5uj5aAsvKsWSOCdyjQJ5nKT41TTm0CA9a3wdSJs/MI9NZasGz+lCJDVB0D7ZYYHXSPL0u/sU/T4p/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq0iGpyGJvhjdGB+pbgNPUv9/98i01dmTejfUc/ZQJs=;
 b=idesUCIF7NtCGSTVhtxYwJN5wt9+/hfzQ60XWbGhdHtztrnUc+g8VGYYbuLvQ7INQY2rXGcZJ2mlDm9jIQIlzHzeCAp3+CzYJQ5tXEEcD6vtfzAD+Ebi7oj/im5gINyUIy+aljZuQ9ALzqGVXLJ1AuadVHgZ/wvK+bbuR6OUHX6C2XdDCv76ckLzItoPALeVIvhnV0HLC+2ms8tdCk15AgVaJJbNIyo+WB/VGbxpgrF/sVlrSFCk7/yDhVe7qsaByrKNvnmo64p+2Thu3lPvnY6NDovZ/2EwGcJDjf4bnXbIkEQQ4ZpmOV5xxuxsR3SBNstnsZD04ws0pboQny85pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq0iGpyGJvhjdGB+pbgNPUv9/98i01dmTejfUc/ZQJs=;
 b=rSvBXdIiUdDEkf9urWnYxojlnnIRUfkS8uLwT8N4Qd6n/2xh6DBFGKsu1goNcaChkqyl8QTF0FC4oth5cG0Drpo1eDd+DK4u5+Zbwf+h52IjkSglrfvktw5p5sEJUoblK/wB69wq+h4J/MxJo6BciBQ5l3avpvwPtv1qHLBiBbc=
Received: from DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18)
 by DM5PR11MB1820.namprd11.prod.outlook.com (2603:10b6:3:111::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Thu, 5 Nov
 2020 14:23:41 +0000
Received: from DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef]) by DM6PR11MB4250.namprd11.prod.outlook.com
 ([fe80::b90d:d053:9de6:e5ef%4]) with mapi id 15.20.3541.021; Thu, 5 Nov 2020
 14:23:40 +0000
From:   "Ayyathurai, Vijayakannan" <vijayakannan.ayyathurai@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Wan Mohamad, Wan Ahmad Zainie" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>
Subject: RE: [PATCH v1 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Thread-Topic: [PATCH v1 1/2] watchdog: Add watchdog driver for Intel Keembay
 Soc
Thread-Index: AQHWsNXAoOMBNHmF4kmLlP8wHpmiJ6m4fj8AgAEVI5A=
Date:   Thu, 5 Nov 2020 14:23:40 +0000
Message-ID: <DM6PR11MB42501B46B82E74D85FF5C9E2FBEE0@DM6PR11MB4250.namprd11.prod.outlook.com>
References: <cover.1604292525.git.vijayakannan.ayyathurai@intel.com>
 <432ae9c4ec6fb5ea745727fbf0fd121eda676db7.1604292525.git.vijayakannan.ayyathurai@intel.com>
 <20201104211754.GA56277@roeck-us.net>
In-Reply-To: <20201104211754.GA56277@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.106.177.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dae7c9c-ce0b-4ae9-921a-08d8819664d8
x-ms-traffictypediagnostic: DM5PR11MB1820:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1820AB05E8BBD40FF293D528FBEE0@DM5PR11MB1820.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pZslRbGdFsoC5l1N6de0K30eYYMpSak+CvG/7VcP7omr5vbrfUjlNKVHzuPYDC9h83vc2jEpFmtTqrBgcUWnAftVmQptZEJZ6w7y82Vf411JQuUYBzP1sVZLK63qYAy/B23AFCAJZdt77xDZUo/vtDW+hD7bzZClkhvOTbp/Yc7Gun89WErPbDio2tgnL9jZdqQu/w4lp9y6XrH+WSpgD5vIJUcEK0xG3SFHVDC/JV4W2kj0NSD8z62ykanzJyQ1bUJ0fsLk4XOFJLrwzsYZooZjhAGWrquJg0YiTjnZcM4YVCwIM7rqG7cu80frpItZnUTrGsl90cXjaVJyqPHM+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4250.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(316002)(64756008)(53546011)(76116006)(66476007)(86362001)(186003)(8936002)(71200400001)(66556008)(55016002)(66946007)(7696005)(26005)(478600001)(66446008)(9686003)(6506007)(6916009)(33656002)(83380400001)(54906003)(5660300002)(52536014)(2906002)(4326008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: JypkdH5i9HdR5Ueb6EI7lD++7YurCoZauet+4LVZ0+sMlFHGHJyIUvPg3FWQOcd2rj5dXNQlqXt5EjxjxQb5NejyqDqHajawHa+cvU+pD4DW3FRMkB+VXjWz1sTs+WWn8ljJ4fzZ4aM/XzsnwnxFspfEoO+dq+UKiqZ/AtwctbudshD/J9ycE17B7a/qYc+/bMwe0oqIq2rmIA6a5pY41R8Pq1YVWmUm/HRgd6SpIxhOyfVN9xcR6vxt8p0wCKZOEuruJlehgeYmint/3YHEQ9589T5J9j7K+c6fhAhhJDQHBECx06fiGQyxpksqFs0s+eXwianXxmu6dWb6TR16TQoTQaGpQg+muZDqBOlmKCyLtUxbI3xVQJX/I+O9kKlzMFW4+9VrOTq9uhGHGI47Di2VkwMTm2eC+3gR8bIFJe4pnRyiYRKRfDaUy2+0/5n5c2Q5n1iFGUUbzOOnvkJYDhySjK4NbyVdmi+p6DKXu/qlMtE7B2kD8oBv4XM2bkrvqYCGsmEm/70lgVBPzRXOUH+3xn2LXecn86a9IqfgHzhgmuEwVngZYoitRXiMMXNWiOAez8exvEljOOtiZ8Ep4sSH8MABah5mapRYLrDsK/dj2sdrOJn2AKjIZ5IZ0jqOH1P5T05gT9VyLHhB/0Q8eA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dae7c9c-ce0b-4ae9-921a-08d8819664d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 14:23:40.8908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AvufxUBbq2I1/UrGxeUuCGQ/fIsfC5LE179C89A9izsMVwqibtyF87SytBUnkeGzNVH3hmf8x/6/cQgSEeLEdBwfdWz/9HrKeDUkRqpuR8LnIt6gEsyRp8YB/twINPoc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1820
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,
Thank you for reviewing this patch.

> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Thursday, 5 November, 2020 5:18 AM
> Subject: Re: [PATCH v1 1/2] watchdog: Add watchdog driver for Intel Keemb=
ay
> Soc
>=20
> On Mon, Nov 02, 2020 at 01:23:11PM +0800,
> vijayakannan.ayyathurai@intel.com wrote:
> > From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> > +
> > +static void keembay_wdt_set_timeout_reg(struct watchdog_device *wdog,
> bool ping)
> > +{
> > +	struct keembay_wdt *wdt =3D watchdog_get_drvdata(wdog);
> > +	u32 th_val =3D 0;
> > +
> > +	if (ping)
> > +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout *
> wdt->rate);
> > +
> > +	if (wdog->pretimeout)
> > +		th_val =3D wdog->timeout - wdog->pretimeout;
> > +
> > +	keembay_wdt_writel(wdt, TIM_WATCHDOG_INT_THRES, th_val * wdt-
> >rate);
> > +
> > +	if (ping)
> > +		keembay_wdt_writel(wdt, TIM_WATCHDOG, wdog->timeout *
> wdt->rate);
> > +}
> > +
> > +static int keembay_wdt_start(struct watchdog_device *wdog)
> > +{
> > +	struct keembay_wdt *wdt =3D watchdog_get_drvdata(wdog);
> > +
> > +	keembay_wdt_set_timeout_reg(wdog, 0);
>=20
> The second parameter is bool, so please use true/false.

Yes. Let me incorporate the change in the next version.

> Anyway, why does starting the watchdog require setting the pretimeout
> register, but not setting the timeout register ?
>=20

Good catch. Let me fix the sequence in the next version.

> > +	keembay_wdt_writel(wdt, TIM_WDOG_EN, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int keembay_wdt_stop(struct watchdog_device *wdog)
> > +{
> > +	struct keembay_wdt *wdt =3D watchdog_get_drvdata(wdog);
> > +
> > +	keembay_wdt_writel(wdt, TIM_WDOG_EN, 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int keembay_wdt_ping(struct watchdog_device *wdog)
> > +{
> > +	keembay_wdt_set_timeout_reg(wdog, 1);
>=20
> Each ping requires setting the timeout twice, plus setting the
> pretimeout ? Really ?
>=20

Not really twice.
TIM_WATCHDOG has to be updated for both true and false conditions
at the argument 2. Let me fix that change in the next version.

> Is this document somewhere. I think I'll want to confirm this with
> the specification. The TIM_WATCHDOG register seems to need a lot
> of updates, and I'd like to have some confirmation that this is
> really necessary.
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int keembay_wdt_set_timeout(struct watchdog_device *wdog, u32 t=
)
> > +{
> > +	u32 actual =3D min(t, wdog->max_timeout);
> > +
> min() is unnecessary.
>=20

OK. I will use t directly in the next version.

> > +	wdog->timeout =3D actual;
> > +	keembay_wdt_set_timeout_reg(wdog, 0);
>=20
> Why does setting the timeout require setting the pretimeout register,
> but not setting the timeout register ?
>=20

Let me fix the sequence in the next version.

> > +
> > +	return 0;
> > +}
> > +
> > +static int keembay_wdt_set_pretimeout(struct watchdog_device *wdog,
> u32 t)
> > +{
> > +	if (t < wdog->min_timeout || t >=3D wdog->timeout)
> > +		return -EINVAL;
>=20
> Validated by watchdog core.
>=20

Sure. I will remove this check in the next version.

> > +
> > +	wdog->pretimeout =3D t;
> > +	keembay_wdt_set_timeout_reg(wdog, 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned int keembay_wdt_get_timeleft(struct watchdog_device
> *wdog)
> > +{
> > +	struct keembay_wdt *wdt =3D watchdog_get_drvdata(wdog);
> > +
> > +	return keembay_wdt_readl(wdt, TIM_WATCHDOG) / wdt->rate;
> > +}
> > +
> > +/*
> > + * SMC call is used to clear the interrupt bits, because the
> TIM_GEN_CONFIG
> > + * register is in the secure bank.
> > + */
> > +static irqreturn_t keembay_wdt_to_isr(int irq, void *dev_id)
> > +{
> > +	struct keembay_wdt *wdt =3D dev_id;
> > +	struct arm_smccc_res res;
> > +
> > +	keembay_wdt_writel(wdt, TIM_WATCHDOG, 1);
> > +	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0,
> &res);
> > +	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt timeout.\n");
> > +	emergency_restart();
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t keembay_wdt_th_isr(int irq, void *dev_id)
> > +{
> > +	struct keembay_wdt *wdt =3D dev_id;
> > +	struct arm_smccc_res res;
> > +	u32 th_val =3D 0;
> > +
> > +	if (wdt->wdd.pretimeout)
> > +		th_val =3D wdt->wdd.timeout - wdt->wdd.pretimeout;
> > +
> > +	keembay_wdt_writel(wdt, TIM_WATCHDOG, th_val * wdt->rate + 1);
> > +	arm_smccc_smc(WDT_ISR_CLEAR, WDT_ISR_MASK, 0, 0, 0, 0, 0, 0,
> &res);
> > +	dev_crit(wdt->wdd.parent, "Intel Keem Bay non-sec wdt pre-
> timeout.\n");
> > +	watchdog_notify_pretimeout(&wdt->wdd);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static const struct watchdog_info keembay_wdt_info =3D {
> > +	.identity	=3D "Intel Keem Bay Watchdog Timer",
> > +	.options	=3D WDIOF_SETTIMEOUT |
> > +			  WDIOF_PRETIMEOUT |
> > +			  WDIOF_MAGICCLOSE |
> > +			  WDIOF_KEEPALIVEPING,
> > +};
> > +
> > +static const struct watchdog_ops keembay_wdt_ops =3D {
> > +	.owner		=3D THIS_MODULE,
> > +	.start		=3D keembay_wdt_start,
> > +	.stop		=3D keembay_wdt_stop,
> > +	.ping		=3D keembay_wdt_ping,
> > +	.set_timeout	=3D keembay_wdt_set_timeout,
> > +	.set_pretimeout	=3D keembay_wdt_set_pretimeout,
> > +	.get_timeleft	=3D keembay_wdt_get_timeleft,
> > +};
> > +
> > +static int keembay_wdt_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct keembay_wdt *wdt;
> > +	int ret;
> > +
> > +	wdt =3D devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> > +	if (!wdt)
> > +		return -ENOMEM;
> > +
> > +	wdt->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(wdt->base))
> > +		return PTR_ERR(wdt->base);
> > +
> > +	/* we do not need to enable the clock as it is enabled by default */
> > +	wdt->clk =3D devm_clk_get(dev, NULL);
> > +	if (IS_ERR(wdt->clk))
> > +		return dev_err_probe(dev, PTR_ERR(wdt->clk), "Failed to get
> clock\n");
> > +
> > +	wdt->rate =3D clk_get_rate(wdt->clk);
> > +	if (!wdt->rate)
> > +		return dev_err_probe(dev, -EINVAL, "Failed to get clock
> rate\n");
> > +
> > +	wdt->th_irq =3D platform_get_irq_byname(pdev, "threshold");
> > +	if (wdt->th_irq < 0)
> > +		return dev_err_probe(dev, wdt->th_irq, "Failed to get IRQ for
> threshold\n");
> > +
> > +	ret =3D devm_request_irq(dev, wdt->th_irq, keembay_wdt_th_isr, 0,
> > +			       "keembay-wdt", wdt);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to request IRQ for
> threshold\n");
> > +
> > +	wdt->to_irq =3D platform_get_irq_byname(pdev, "timeout");
> > +	if (wdt->to_irq < 0)
> > +		return dev_err_probe(dev, wdt->to_irq, "Failed to get IRQ for
> timeout\n");
> > +
> > +	ret =3D devm_request_irq(dev, wdt->to_irq, keembay_wdt_to_isr, 0,
> > +			       "keembay-wdt", wdt);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to request IRQ for
> timeout\n");
> > +
> > +	wdt->wdd.parent		=3D dev;
> > +	wdt->wdd.info		=3D &keembay_wdt_info;
> > +	wdt->wdd.ops		=3D &keembay_wdt_ops;
> > +	wdt->wdd.min_timeout	=3D WDT_LOAD_MIN;
> > +	wdt->wdd.max_timeout	=3D WDT_LOAD_MAX / wdt->rate;
> > +	wdt->wdd.timeout	=3D WDT_TIMEOUT;
> > +
> > +	watchdog_set_drvdata(&wdt->wdd, wdt);
> > +	watchdog_set_nowayout(&wdt->wdd, nowayout);
> > +	watchdog_init_timeout(&wdt->wdd, timeout, dev);
> > +	keembay_wdt_set_timeout(&wdt->wdd, wdt->wdd.timeout);
> > +
> > +	ret =3D watchdog_register_device(&wdt->wdd);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to register watchdog
> device.\n");
> > +
> > +	platform_set_drvdata(pdev, wdt);
> > +	dev_info(dev, "Initial timeout %d sec%s.\n",
> > +		 wdt->wdd.timeout, nowayout ? ", nowayout" : "");
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused keembay_wdt_suspend(struct device *dev)
> > +{
> > +	struct keembay_wdt *wdt =3D dev_get_drvdata(dev);
> > +
> > +	if (watchdog_active(&wdt->wdd))
> > +		return keembay_wdt_stop(&wdt->wdd);
> > +
> > +	return 0;
> > +}
> > +
> > +static int __maybe_unused keembay_wdt_resume(struct device *dev)
> > +{
> > +	struct keembay_wdt *wdt =3D dev_get_drvdata(dev);
> > +
> > +	if (watchdog_active(&wdt->wdd))
> > +		return keembay_wdt_start(&wdt->wdd);
> > +
> > +	return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(keembay_wdt_pm_ops,
> keembay_wdt_suspend,
> > +			 keembay_wdt_resume);
> > +
> > +static const struct of_device_id keembay_wdt_match[] =3D {
> > +	{ .compatible =3D "intel,keembay-wdt" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, keembay_wdt_match);
> > +
> > +static struct platform_driver keembay_wdt_driver =3D {
> > +	.probe		=3D keembay_wdt_probe,
>=20
> No remove function ? What happens if someone unloads
> the driver ?
>=20

Yes it is a problem.
Let me add the support in the next version.=20

I would like to go with resource managed watchdog registration to fulfil th=
is need.

devm_watchdog_register_device()

> > +	.driver		=3D {
> > +		.name		=3D "keembay_wdt",
> > +		.of_match_table	=3D keembay_wdt_match,
> > +		.pm		=3D &keembay_wdt_pm_ops,
> > +	},
> > +};
> > +
> > +module_platform_driver(keembay_wdt_driver);
> > +
> > +MODULE_DESCRIPTION("Intel Keem Bay SoC watchdog driver");
> > +MODULE_AUTHOR("Wan Ahmad Zainie
> <wan.ahmad.zainie.wan.mohamad@intel.com");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.17.1
> >
Thanks,
Vijay
