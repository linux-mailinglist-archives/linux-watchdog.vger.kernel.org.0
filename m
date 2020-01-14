Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2D7A13AF3D
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2020 17:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgANQYs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jan 2020 11:24:48 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.5]:44142 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726053AbgANQYr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jan 2020 11:24:47 -0500
Received: from [46.226.52.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.eu-west-1.aws.symcld.net id A9/5C-28428-94BED1E5; Tue, 14 Jan 2020 16:24:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBJsWRWlGSWpSXmKPExsWSoc9hruvxWjb
  OYPpvTYv5R86xWqyaupPF4v7Xo4wWl3fNYbO4sW4fu8WThWeYLD7susps0br3CLsDh8emVZ1s
  Hneu7WHz6P9r4LHzewO7x+dNcgGsUayZeUn5FQmsGVvbLzEWLBCvmPbyP3sD4xXhLkYuDkaBp
  cwSv5o3skI4x1gkXvw9zgjhbGaU+N37kw3EYRE4wSwxt/c8excjJ4eQQD+TxLNNtiAJIYG7jB
  Kndn1kBUmwCVhITD7xAKxDROAkk0T/uZdMIA6zwGdGiZd9e1lAqoQFnCXmX3wBZHMAVblIvDj
  BDBIWETCSeH/nFyOIzSKgKnFiw3cwm1cgVmLh10+sEJvzJB7vfwR2BaeArcTpr51gNYwCshJf
  GleDzWEWEJe49WQ+E4gtISAgsWTPeWYIW1Ti5eN/rBD1qRInm24wQsR1JM5efwJlK0nMm3sEy
  paVuDS/G8r2lVj3dDOUrSWx7/49qJkWEku6W8FekRBQkfh3qBLCzJE4u70QokJNYsbWlVDXyE
  j0n50BDmoJgQ0sEs2/NrNPYNSfheRqCFtHYsHuT2wQtrbEsoWvmWeBQ0JQ4uTMJywLGFlWMVo
  kFWWmZ5TkJmbm6BoaGOgaGhrpGloaA7GJXmKVbqJeaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJ
  JkZgIkspOHhoB+PKr2/1DjFKcjApifKK7JGNE+JLyk+pzEgszogvKs1JLT7EKMPBoSTBW/4KK
  CdYlJqeWpGWmQNMqjBpCQ4eJRHebS+B0rzFBYm5xZnpEKlTjLocE17OXcQsxJKXn5cqJc5bCT
  JDAKQoozQPbgQswV9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzbAzKFJzOvBG7TK6AjmIC
  OmH8K7IiSRISUVANT+7En9jW3phwL3Zz8Z0fMBaOt3nJlfCc2KJ7qn/mIf/In8RmJTYe0vIq1
  syffvtK8YIvsfZbj9hnXk35GSni/DfYS1/j+vD+i9WK/hN+8vdM5du7x2/h9valXce/cv4daD
  l1lcE48faKE52v12q4pFnPvlt7wWCw7Iczf/mPaTRuulINO9XUb3yzaNv26pumze1M8Tm3N5V
  i5gk8+uD7p6sSTlTmrHxtfMJu0XOv1h1OZWu+jflzkj+tXqHEMqjm6+rN58LwmRfPdUWov2D5
  P4CrbyxV+aK9B+Y+CSTN8pBnfBipe+WayWfO1j3WURqzbnNc6Zu8f5Uw5y1NUNJ+7odE2uI/r
  nYe+c1nlcnYmJZbijERDLeai4kQArs9lEGsEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-35.tower-268.messagelabs.com!1579019080!370895!1
X-Originating-IP: [104.47.8.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28516 invoked from network); 14 Jan 2020 16:24:40 -0000
Received: from mail-am5eur03lp2055.outbound.protection.outlook.com (HELO EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.55)
  by server-35.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jan 2020 16:24:40 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZcDVqPCQE3hzCldTsji3XuxW4bq+GJvWloOEuTHLH+neviaDY+vLNA+Kt1sOjJU0eO2pmyFiy4h3Myj6k/plg3oMSoWTj1tyD6IboTne74OljyQan324e/ygQvR1x4KAMofWf9ZIuBPuowVDPvo9dTcXoJvgE8OnAkk75czEUkuRdE7gS1/U2rl0G7Q9wu6HkGcnmdMKPz49+54mzAgxHgm0KZkSfY2xvV/hyETlPP9CGlemDWbzkOqlGe1vuCPIUibHbpCU0PTJo2xqVPQ6uKvC7/4QDeHjOjoZk2QguavV8lS6vVI9KmiipdtGFYHLQyWZEBmDF1SkqMLHZvRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt3eHUu6Qf9g8+zkrrcUkMzxSTI9Se3UoDErqxrNE0c=;
 b=nkO56dgp+o23OBPl6Dk8+ZH3QZ673YcOHy3fzmSgiMWkv8oPeRRs0aCyxHVEvARdULTobgN7JGS9uDDPi8MAVM0W4k8QKJdDslwYXVHW8WLnQTe4sGUjg6utQJw/31KaCvZXZYCnSmuwmGV+Qfyw+H9a2QxSoKF3UD7L4ByfUGVhCtOS1sMhiUeY96mU2t4rf2UAbDwxxRIwKEZzMvFwGOQlCUnK81WtS7r565FHA6tMT0gzYEpp+49ie2cPP1cIXg5kCOyF8uW5rDl0SVVPTIdTqzI+ZdrweVK1KQMtRPNPaGO96nXRK4T4EaIaxMmXFSZKtzQiRplnM07pSTUkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt3eHUu6Qf9g8+zkrrcUkMzxSTI9Se3UoDErqxrNE0c=;
 b=dkAqSitw9wCWiKP9O49nLJ8UM/wtgaxyolWmAmLgeDWiBaC8t7Gu2kgzaQ8RtaVDFU6y/bR7ZhbWbWwIGd3kw27GljqOnq1a13I/XJ/UKRFIn0WxWO50gFEmji2zDdujZz+fgSlluX9l9QBrc7xkNjVQWmNmvLJebaLZIp6rJ/0=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2726.EURPRD10.PROD.OUTLOOK.COM (20.179.2.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 16:24:39 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3%5]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 16:24:39 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 3/3] watchdog: da9062: add power management ops
Thread-Topic: [PATCH 3/3] watchdog: da9062: add power management ops
Thread-Index: AQHVxgoI80GM0h8rl02lD5uhhW9tpKfqYSMg
Date:   Tue, 14 Jan 2020 16:24:39 +0000
Message-ID: <AM6PR10MB2263254FB395E307C777DBDE80340@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-4-m.felsch@pengutronix.de>
In-Reply-To: <20200108095704.23233-4-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eec37010-e0cd-4ada-69c7-08d7990e40d4
x-ms-traffictypediagnostic: AM6PR10MB2726:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2726E949BA84C327477A03C0A7340@AM6PR10MB2726.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(189003)(199004)(64756008)(478600001)(2906002)(4326008)(66556008)(66476007)(66446008)(66946007)(316002)(110136005)(54906003)(76116006)(55236004)(52536014)(26005)(8936002)(6506007)(53546011)(5660300002)(81156014)(8676002)(86362001)(81166006)(186003)(55016002)(9686003)(71200400001)(7696005)(33656002)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2726;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Doy7jHxljcYk60Rb4wSivmT2GUDQCxQGC84ZRbiMFeeHS2c877x9/wsxQVWXyQ7HTmyUo6XFAcciSy36MHwqJ9OIzOb+TU5eRM4QQlvYClr9+nx8k7DB4BHntIQ9XuoVRv7QbVvresNFhbnOWgz8nbRRmZju1H+GeG+5pQuG0qHOxHQMMYwIsGb9CGXtdq1cz8WkFEKPkevkOstPIrGPq1fsDkYFtrXMyE20GAjCK0uB2lkOC3mxRmV1kdX9eXgMJOfRtMHdrOx+2lGamfohCt1QewceSjdcNsnbikQvDMk+efl43hsiSjU6zkL6B56k90W7sgH8lSPiLytDx2Cz0VkdIqTU19KhPuKk4Bn+y8b1K76Hya2WYBXDkNFbe0Oy1AZ+7O3TYjRT4cEV0CYN75etT7mKpXAeoIkwoW70odTqFAwfZlej56Lcpe3rxbAErVrH1mDZR/2Rnddhfe1vLKyqK3DaMJ31EJ6l2acrnIWu9Ow59MWeAL8DqVWIU6x4
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec37010-e0cd-4ada-69c7-08d7990e40d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 16:24:39.0909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wbRY4TDHC+i6bDMSQpWdw65HvvJzzVbtkeC/ZeLQWLd78XSYvE8UXTh4YMFcKIuXggdWpUAR/b03FbBf2Ufbd/DL++S9yzNq5idZ2h6FywY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2726
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08 January 2020 09:57, Marco Felsch wrote:

> Disable the watchdog during suspend if it is enabled and re-enable it on
> resume. So we can sleep without the interruptions.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> v2:
> - add dlg,use-sw-pm check to differentiate between automatic and manual
>   disabling/enabling.
> ---
>  drivers/watchdog/da9062_wdt.c | 37
> +++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.=
c
> index e149e66a6ea9..c9b9d6394525 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -15,6 +15,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/mfd/da9062/registers.h>
>  #include <linux/mfd/da9062/core.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
>=20
> @@ -30,6 +31,7 @@ static const unsigned int wdt_timeout[] =3D { 0, 2, 4, =
8, 16, 32,
> 65, 131 };
>  struct da9062_watchdog {
>  	struct da9062 *hw;
>  	struct watchdog_device wdtdev;
> +	bool use_sw_pm;
>  };
>=20
>  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
> @@ -198,6 +200,8 @@ static int da9062_wdt_probe(struct platform_device
> *pdev)
>  	if (!wdt)
>  		return -ENOMEM;
>=20
> +	wdt->use_sw_pm =3D device_property_present(dev, "dlg,use-sw-pm");
> +
>  	wdt->hw =3D chip;
>=20
>  	wdt->wdtdev.info =3D &da9062_watchdog_info;
> @@ -212,6 +216,7 @@ static int da9062_wdt_probe(struct platform_device
> *pdev)
>  	watchdog_set_restart_priority(&wdt->wdtdev, 128);
>=20
>  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
> +	dev_set_drvdata(dev, &wdt->wdtdev);
>=20
>  	ret =3D devm_watchdog_register_device(dev, &wdt->wdtdev);
>  	if (ret < 0)
> @@ -220,10 +225,42 @@ static int da9062_wdt_probe(struct platform_device
> *pdev)
>  	return da9062_wdt_ping(&wdt->wdtdev);
>  }
>=20
> +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> +{
> +	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
> +	struct da9062_watchdog *wdt =3D watchdog_get_drvdata(wdd);
> +
> +	if (!wdt->use_sw_pm)
> +		return 0;
> +
> +	if (watchdog_active(wdd))
> +		return da9062_wdt_stop(wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused da9062_wdt_resume(struct device *dev)
> +{
> +	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
> +	struct da9062_watchdog *wdt =3D watchdog_get_drvdata(wdd);
> +
> +	if (!wdt->use_sw_pm)
> +		return 0;
> +
> +	if (watchdog_active(wdd))
> +		return da9062_wdt_start(wdd);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
> +			 da9062_wdt_suspend, da9062_wdt_resume);
> +
>  static struct platform_driver da9062_wdt_driver =3D {
>  	.probe =3D da9062_wdt_probe,
>  	.driver =3D {
>  		.name =3D "da9062-watchdog",
> +		.pm =3D &da9062_wdt_pm_ops,
>  		.of_match_table =3D da9062_compatible_id_table,
>  	},
>  };
> --
> 2.20.1

