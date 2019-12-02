Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35ED510E95D
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 12:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfLBLLw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 06:11:52 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.7]:58197 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727364AbfLBLLw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 06:11:52 -0500
Received: from [46.226.52.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-7.bemta.az-a.eu-west-1.aws.symcld.net id A5/34-22091-471F4ED5; Mon, 02 Dec 2019 11:11:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSb0wbZRzH+9xdy8G47VZg/VmKLypsZqOlZTN
  0U7JCMq0azIzEFyMVr/akxbbUtgxKJiLsj25hI9PFgWEUhYGIy9JlRFrDhExYjSBDBww1a0YB
  S7eErZsLYyP2OJj67vM8n+89z/e5/Ehc3C+Skmyli3XYGItclECYskQahetOSK8KdiJN16leQ
  jN5ri9OE2r9GdMs+K7hmunwMq4V6r7u7hbqTjxW6Xof1MTpot6n9xL7hGaboazybaHpUP1nhD
  2cWvm7tx/VoL9SjqIEEtHtOJxueijiF4MEHPR9hfjFBQRL9YsrhqCv4BDwzWFHUTwppk9hcLx
  7LyfEdBDB+c7bcZwQ0Rr49EpQxHEyXQxDzcM4F8LpegweTN0VciKJ3g0XH7ethrRwNhiNfUzG
  OB/8n9g4JOh0GOpQcQmKZmC8swXn77qMYKTxW4IT8XQunIleXSmE6DS499E3OMc4LYGpUMvKP
  tA0tH3/C85zCoSnl4V8noVA7STi9zNheCK0ynI403x5ldNgrOUY4voAXQCjMy+sxU83nid41k
  DbsUMEH0mH5QE3v22HxsgXIp43w+Stj3E+IoPexe3cS4COCOFwJIo1oKym/5TmORM8/rsinrf
  B2dYI3rTyJzZCoDFEeBDRhXIMDnOJyWVlzBaFWqVSqNXZCvXO7YrsHCVTpWCUbLmignW6FGol
  U+FUOt3WdyxGpY11eVFsmoz2/tTv0Im/bysH0FMkJk+hPJ5pvXi9oczoNjFOU7Gj3MI6B5CMJ
  OVAHVkI6cUbHWwJW/mu2RKbyTUNZKI8mcrmNOW0M1anuYRXPyEF2RBu/hIXE7YyGyuVUAVciO
  ZCpnLbkyPWJnsMpUmTKCQQCMSJdtZhNbv+7+eRhETyJCqPOyXRbHM9uWk+VgKLlcg5eJMr4WL
  +VdIaDKsuCETewn5475mi6ZYmKmQs++0Gu+kV3+5EZW38fm9f1wVDcOpk8MDxth9zHxU9l6at
  HdsaV73/0pLM65dmLo9nFBXKtNIBe+FEj9m2pbUw/EdnfpCdfONlyZBRMjje3GM35uivtc+9L
  oh8SK3blmXIvx58/uZE6TrL9Vn7B7OB0gO/Yud2PpuKVe3aQQ17D+cWl7nztDMJoTr/0qsSQf
  qjG+yIpftPosPjHjW82TGoW9qR4b8n27JhX93s4p4eaUOyKDxa/blw08z8xdI8a9Q3qr+zvu7
  WTPX7kfvphs0ZC1e17QvDe47kdkiq6vt2jSRWpOWXv/Riy6XX5h6aNrD35YTTxKi34g4n8w8E
  4p75VAQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-4.tower-262.messagelabs.com!1575285107!9657!1
X-Originating-IP: [104.47.6.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16965 invoked from network); 2 Dec 2019 11:11:47 -0000
Received: from mail-ve1eur02lp2056.outbound.protection.outlook.com (HELO EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.56)
  by server-4.tower-262.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2019 11:11:47 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0vBBV/0JqKZ2iq/6dAVaRkrWI+58TZN8jCuy80mVjcfPQJxw/QL5hWrgikG5EbjR1rttXxefBkelUMMcfdyvtPo2gAScCL9IVgvPKyt3gzd2Wt6qrU+OOYTYByo2aAJY+l+e4Nc3Vf8rLzj7W+W9dDcBVgVEPuGgZZcZbaIvbMy6/jXeACCpOAs1yE25zw16RH1S4DdJoobZ9GAmjJFLLwWIEZQKkdSePXKvFWlT6lei5bq9nAUjfqowHhSmkg4coXkyHNwjo6QZUqGMNQRgRk0sgFPDStdcMhWt/dhPDDtA8u92lNCAm/ZBdsX/3vMle7z3sdfptDyEP6BVpe3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO1L/GfQe69fw3wAQlBZ8CQjdKLMb2KfU4RlUJd1Q/Q=;
 b=OpCdKjFQkFOJyDf5zRYVYcwGS2YIvi50D8muW5WvWPTBGzOOECqFiAcT8TgzCwQKHQPxexlsUK5UlOLkXd8oS87yBiPZg2nsM0r21vdFF2Qzz9yUT3SePPf6FhmYDGb0vpIn1+UOrQDLER7ss9M8QJ0y7EqeeTKTKOg8kLK4pcYmhK+uFbcZ+5GCUZJtXdftTVhgGp1XNwvlzu7jCM9+EXJSULo2wIYO0bKG1i9r1pRGzTSF8fURpbHWuLfl2WX/Srmv59m6xmAwBZU/Puw76AHtX790CjppeR3dOrxKMPhwW02ayvoNzad+0ipYna9NyEJa6FlIgSn1o0JDAqyUkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO1L/GfQe69fw3wAQlBZ8CQjdKLMb2KfU4RlUJd1Q/Q=;
 b=MHd4qX8W7lIbXYlE8bbSl5pU7W2r7Bp+onl1A4joJGVQ5JVb1aNPCijXitIeopTfXdZ/D5x3plMZD6RHJcW/IylviW0rTrUTj/NY5SJT062P6zddArLMtRhKGTSfw2ASL7g2RcMwSqC+gdGA3+3Hv9uTquvPN/qqJ2K/tUp/3O0=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1156.EURPRD10.PROD.OUTLOOK.COM (10.169.153.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 11:11:46 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 11:11:46 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] watchdog: da9062: add power management ops
Thread-Topic: [PATCH] watchdog: da9062: add power management ops
Thread-Index: AQHVphAFwdyccq+61U6+GK1Hr/H0vaemod1wgAAQYwCAAAQN0A==
Date:   Mon, 2 Dec 2019 11:11:46 +0000
Message-ID: <AM5PR1001MB0994B329C5D4B8846FC7A71880430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
 <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
In-Reply-To: <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 283664bd-9d2f-4895-f379-08d777186bac
x-ms-traffictypediagnostic: AM5PR1001MB1156:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB11567EFAD5B38E4997241CB6A7430@AM5PR1001MB1156.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39850400004)(376002)(346002)(366004)(396003)(199004)(189003)(8676002)(86362001)(6306002)(54906003)(9686003)(6246003)(6506007)(55236004)(186003)(76176011)(53546011)(966005)(74316002)(66476007)(316002)(71200400001)(71190400001)(66446008)(64756008)(110136005)(76116006)(102836004)(229853002)(99286004)(5660300002)(55016002)(4326008)(66066001)(66556008)(52536014)(6436002)(14444005)(256004)(66946007)(446003)(81156014)(81166006)(11346002)(8936002)(33656002)(7696005)(6116002)(3846002)(14454004)(26005)(478600001)(7736002)(25786009)(305945005)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1156;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ITcoVOFirg5oFaRl/6n68dGm/ZcBs8eDmABcIicLnHMhY8WlqSyKEnaqMvGFaQkJ2cAwCBULANbOs68I43MZV4iy1jIMg70seiw3toWQr64IkziHeZWyJUhoAQRKFlFYFcro1Yf4fIWeIwtu5yLdiG1aADONKaGy1LSqM7v4tSM91FecFWE0BKx94w0MwyJxN4RrGqp3FMHgSV/O+ceRlH+iJyvhFdVx3x5iEfev4QzEAEqfhml9Kai2ZzascfeAcUsoCumDUED/K3O3VAZfXOrWboz3kfo/ygtS1T0EX2w8jwglch3KLHJGsDsW1ia1j4c13TD0lRImKRGcYYxivwW3yQMA5b+uI5hsJDKRdqR8S0y3a64y/gRjsC68t1ZPsfhJGYebNE3F17/EDiKwjLd0Ysz6izgsP6UqMXqipbV7GM7yy2pOzVl60JFOvmaRcIhUsD+h2qVn9TRMFb6BShZYuLvIpDhLy6z26KlTC5E=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283664bd-9d2f-4895-f379-08d777186bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 11:11:46.4901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AjtKbPHfveA5yLRwrGhUxSsyp/2iaj1+TRg0gGI4jDIk++h8Qlyp5Xzm/XcitpVCpqOMi/1XN33p4Mt8s6t4fUtyIipEc+2D+tHae/i1iWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1156
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02 December 2019 10:57, Marco Felsch wrote:

> On 19-12-02 10:04, Adam Thomson wrote:
> > On 28 November 2019 17:20, Marco Felsch wrote:
> >
> > > Disable the watchdog during suspend if it is enabled and re-enable it=
 on
> > > resume. So we can sleep without the interruptions.
> > >
> >
> > We actually shouldn't need these additional functions. The PMIC can be =
told to
> > suspend the watchdog timer during the PMIC's powerdown state via the
> CONTROL_B
> > register which I think should do what you want here. That could be a DT=
 option
> > instead, and normally this should be configured in OTP anyway I believe=
.
>=20
> This isn't always the case. My custom PCB haven't the ability to use the
> sequencer powerdown/active mode becuase of a PCB bug. So without this
> patch the PMIC resets my system.

Hmmm. Wouldn't that then be a board specific fix rather than this change?
Am concerned relying on software to reenable the watchdog on resume could a=
llow
for a hang scenario potentially if that code never gets to execute. Other
systems shouldn't need this fix, assuming they don't have issues at the HW
level, so this this seems like it could be making those systems less robust=
. If
we are to do this at the driver level, maybe this should be an option throu=
gh DT
to help faulty systems, but I'm thinking this shouldn't be default behaviou=
r.

>=20
> Regards,
>   Marco
>=20
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/watchdog/da9062_wdt.c | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >
> > > diff --git a/drivers/watchdog/da9062_wdt.c
> b/drivers/watchdog/da9062_wdt.c
> > > index e149e66a6ea9..2a1e7de25b71 100644
> > > --- a/drivers/watchdog/da9062_wdt.c
> > > +++ b/drivers/watchdog/da9062_wdt.c
> > > @@ -212,6 +212,7 @@ static int da9062_wdt_probe(struct platform_devic=
e
> > > *pdev)
> > >  	watchdog_set_restart_priority(&wdt->wdtdev, 128);
> > >
> > >  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
> > > +	dev_set_drvdata(dev, &wdt->wdtdev);
> > >
> > >  	ret =3D devm_watchdog_register_device(dev, &wdt->wdtdev);
> > >  	if (ret < 0)
> > > @@ -220,10 +221,34 @@ static int da9062_wdt_probe(struct platform_dev=
ice
> > > *pdev)
> > >  	return da9062_wdt_ping(&wdt->wdtdev);
> > >  }
> > >
> > > +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> > > +{
> > > +	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
> > > +
> > > +	if (watchdog_active(wdd))
> > > +		return da9062_wdt_stop(wdd);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int __maybe_unused da9062_wdt_resume(struct device *dev)
> > > +{
> > > +	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
> > > +
> > > +	if (watchdog_active(wdd))
> > > +		return da9062_wdt_start(wdd);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
> > > +			 da9062_wdt_suspend, da9062_wdt_resume);
> > > +
> > >  static struct platform_driver da9062_wdt_driver =3D {
> > >  	.probe =3D da9062_wdt_probe,
> > >  	.driver =3D {
> > >  		.name =3D "da9062-watchdog",
> > > +		.pm =3D &da9062_wdt_pm_ops,
> > >  		.of_match_table =3D da9062_compatible_id_table,
> > >  	},
> > >  };
> > > --
> > > 2.20.1
> >
> >
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
