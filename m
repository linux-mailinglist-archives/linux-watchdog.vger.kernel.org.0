Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8FC10E82F
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 11:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbfLBKEk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 05:04:40 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.5]:43720 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727326AbfLBKEj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 05:04:39 -0500
Received: from [46.226.52.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 75/E9-19910-3B1E4ED5; Mon, 02 Dec 2019 10:04:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WScUwbdRTH++td22Oh41rAvjUDTTcxGVzXbga
  6yBQX46pGh5nG6STukJM2aUttD4ENHQ7QZICOMJx0UgpDxnDZFKauiN3S4EIJbFm3ZWiMa0dJ
  LJPZrGQLgxV7vTL1v8/3vW/e7/t7eQQmHxUrCaaaZWwW2qQSr8ING1OeooaCoRLNnYBMN9Dux
  nVTpzwSXah7QqiLDF/DdNPhGFYk0p84eVKk//yBRu++VyfRRwezi/G3REZLaUX1HpHB135EaP
  WS1R1TTkkdWpIeRKsIRH6NwcUbfRgvLuDgvNSMeDGEYLFlQcwJnBzDwOEYkHBCTrYJobdjCvE
  igCAamREeRCmEmNRB21hAzHEGeQ6BY3QHxxhZBT3N3Yl6OvkMfP+gN+kpgr5AVMLzJphpXUow
  Tq6H/l9bcY6lJA3HzjQm5svJQpiMfopxnEJuhQsnmhJzEJkF8x9/g/FvKeC3UFfCDyQJvSOXM
  J4zITwdE/F+BnwHuA9w9TyYvB5KsgqcnaNJzgJ/V1OSXwb33BHRin/saGOSddDb1BjPScR5Pc
  S8NXzZCp6/b4t5zoHozFWMt6wF98Jmbm1A/iWCYDiGDqGNjv+k5jkPXD/dEfOcC33dtzBHYhM
  y8HWEcBfCB5Cu1GYsN7Bm2miitBoNpdVuorRbnqS0+QVqei9Fq5lKqoqxs5RWTVfZ1fYa87um
  MrWFYQdR/KDKrN7jZ9Hy/Jzai9YQQlWm1OWaLpGvLq0oqzHQdsM7tkoTY/eitQShAqn/RqhEL
  rMx5Uz1e0ZT/CxX2kCkqjKkgT/ibandSpvtxnK+NY4o4lC4sweT45YKC6NUSOc5E8mZDJWWhy
  NWjtuPspTpUiQQCOSpVsZmNrL/788iBYFU6VLgkqQaLezDl2bjIYTxEAUNN7kQLP1vS1kn3Lr
  rx5CgeW6qAfKyPUWhtOHd062h0/Ircx47Fc4/rRrUfBQcH36zn9WIL7+U3dW3XBuy7bs6ua1B
  O2Guj9SGz/S73vBuDzqPjuRMbN+xJHz8Rdj/+u1gQVvAVp+5O8NWPDx+Tb9mXX5strjzlXW1p
  P8TgWiC8iy/f3jPLwr2qyHNli+UNLu3sD5NEVDf20b3L+wc+Xl0MavdtS9n82Or03Kun/+gja
  xKuXXx7NtNDcf+FDDf+ZYUzvZHO3OZxkjdzePnW0YuFz1vFUa0sm/9hG9sw5eiU0+4z9U++8g
  P9wd33Ze/+nvLXRExvv+FAzvTr5RmfFgoe+5ucc9iT7kr97PX8p9W4XYDrd2A2ez0P+jh6WpX
  BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-2.tower-268.messagelabs.com!1575281074!726588!1
X-Originating-IP: [104.47.9.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19039 invoked from network); 2 Dec 2019 10:04:35 -0000
Received: from mail-ve1eur03lp2059.outbound.protection.outlook.com (HELO EUR03-VE1-obe.outbound.protection.outlook.com) (104.47.9.59)
  by server-2.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2019 10:04:35 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRgv3WsJJSubb2O/j0wjnwltmL4J9sjoGjciPYXVJ11gaTj4qah393oMXLsWneN0l8zlYNEwwe4s9Aqe0rdHR3RtbBElCFQLGmLjHwWcMC0MOhBE4cr7ZeyyRtqis9DT9UF8hEGkdP91Utuum9vLwwRKjt5ROb+zmeF7/FQ3poqFQuUHPtap4LYTMP6y6DUjfMOJpkGSj7GCpK7a6Xgu3vL5JYxCuk/wXc5amX0zZOp9U/kTwaYI53tGN5nRnRb247aoh6zDU3WlS/C9cGv5qzv4oKpiUyjZ7/F+ykMaFOxp+eDowLW73t1aYMXBxvv9lJxf3bJv0Rr644ZN6WsMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlsE8O/JnNwgkvvVA2mApHgYTIc6V+rMjF4Zpfib88g=;
 b=YOqjyQiUPXRoM2JIV1P3xUw2MsQEyK+RTcFwzIWLsPQGLRjbO2stX6ieT3UtY7m2KCklO5HnKQp+ustuBVHoxpusoP+azMdt1hSG7XxTws11qAgg94votQSnScqEN/Pjpw9s++Odm9pChHwtygLPS/0MYUa37RsRxIRpxxpLy0+wn/F/WZLRZMetJxFjCiiGhIM6AN3slYg96mwaFHWSVpIisBWSB0umXH8HeN1GGIw0dZ8/7FE/+lUcIG+SBY2pNowepW9d1zk9663n3LgNMXFBI4XAoi0sUPb7F1lx9+A2GC2wdpckLq33LWXw/1HaOVyCTgeCxWlE5nWJ6GSWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlsE8O/JnNwgkvvVA2mApHgYTIc6V+rMjF4Zpfib88g=;
 b=urZeG9HSQ44T4aBs4uLYYUY1jt1a1sMS/gWCrt6C33JWO3HKe2XMSIrEHDY4dTlL2UiI2xFeOVc3AQyZL9a6BPvrjz6hBzVrvM/hGEVl2I8MTSYIcC/IPzqxapEWCDTTCty6YP/tpvzDhOoZ7i+WJ5TheyHOohiwIeDjm7GU77k=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB0962.EURPRD10.PROD.OUTLOOK.COM (10.169.154.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Mon, 2 Dec 2019 10:04:29 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 10:04:29 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] watchdog: da9062: add power management ops
Thread-Topic: [PATCH] watchdog: da9062: add power management ops
Thread-Index: AQHVphAFwdyccq+61U6+GK1Hr/H0vaemod1w
Date:   Mon, 2 Dec 2019 10:04:29 +0000
Message-ID: <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
In-Reply-To: <20191128171931.22563-1-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2a949d6-f4bd-4d94-924a-08d7770f0575
x-ms-traffictypediagnostic: AM5PR1001MB0962:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB09626380655654E3762675C9A7430@AM5PR1001MB0962.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39850400004)(366004)(376002)(346002)(136003)(189003)(199004)(4326008)(76116006)(66556008)(478600001)(66446008)(64756008)(8676002)(74316002)(55016002)(66476007)(9686003)(86362001)(2501003)(2201001)(25786009)(6116002)(66946007)(256004)(33656002)(446003)(2906002)(305945005)(6436002)(7736002)(229853002)(14444005)(3846002)(11346002)(52536014)(26005)(8936002)(71190400001)(71200400001)(110136005)(316002)(6506007)(53546011)(6246003)(99286004)(55236004)(186003)(66066001)(54906003)(14454004)(7696005)(5660300002)(81156014)(76176011)(81166006)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB0962;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QAsT2AXxiWmD4Cy3o354XgQ6uDr0gggOjBb4gZGBFZd6JX37C7YqIhNAfXM9lAD3ocARPQmTAGY6x9roFg4yMsffOpcnfNapZF9hTeg1HmZpYfvYBO8Nc3mD8TKnDJZvuwFUbjo8jKpeLslUYbxOABTI26UnINDB397WFmbBUypRDlptP/3wbHwapYow9DLHzweX0yggXoC3cftlqerDgMpXw2p2LGjzzriN6EnGXADIecVyM5Y6oSmhPPEQdmm11/2FIfbUlFl0a4zaq/qg2v7otdSeUcUzf6iuU45iu/2L5512ri5YQYbVu/kLnoLN0/RmJMiXDdXRaGHx2abqRYH8XaPchUsuhjFxKJ+i9GNTuol6Swz6fsLGG0cQE3usbswDqSRa8lvpxprbs9eWi8hZMLEutxS1bS2r2oRTXX21KcUSyYeu58lMQoGVfS8N
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a949d6-f4bd-4d94-924a-08d7770f0575
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 10:04:29.5150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feBWwb+Ns6YQNfQxtJXPXGUWxDWqKoNC+pFB090WWr2oVXJHFy+VZoe2wIzVwwWiXP/Z/bHSo3TxvyYsH2Sx/sbqrHv3zJ790NKSE0PIgQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0962
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28 November 2019 17:20, Marco Felsch wrote:

> Disable the watchdog during suspend if it is enabled and re-enable it on
> resume. So we can sleep without the interruptions.
>=20

We actually shouldn't need these additional functions. The PMIC can be told=
 to
suspend the watchdog timer during the PMIC's powerdown state via the CONTRO=
L_B
register which I think should do what you want here. That could be a DT opt=
ion
instead, and normally this should be configured in OTP anyway I believe.

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/watchdog/da9062_wdt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.=
c
> index e149e66a6ea9..2a1e7de25b71 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -212,6 +212,7 @@ static int da9062_wdt_probe(struct platform_device
> *pdev)
>  	watchdog_set_restart_priority(&wdt->wdtdev, 128);
>=20
>  	watchdog_set_drvdata(&wdt->wdtdev, wdt);
> +	dev_set_drvdata(dev, &wdt->wdtdev);
>=20
>  	ret =3D devm_watchdog_register_device(dev, &wdt->wdtdev);
>  	if (ret < 0)
> @@ -220,10 +221,34 @@ static int da9062_wdt_probe(struct platform_device
> *pdev)
>  	return da9062_wdt_ping(&wdt->wdtdev);
>  }
>=20
> +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> +{
> +	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
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
