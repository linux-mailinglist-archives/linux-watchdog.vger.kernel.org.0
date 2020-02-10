Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE00157373
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2020 12:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgBJL37 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 Feb 2020 06:29:59 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.67]:33586 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726961AbgBJL37 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 Feb 2020 06:29:59 -0500
Received: from [100.112.197.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 41/07-56650-4BE314E5; Mon, 10 Feb 2020 11:29:56 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRWlGSWpSXmKPExsWSoc9qqrvFzjH
  O4PhfNotVU3eyWNxYt4/d4snCM0wWH3ZdZXZg8ej/a+Cx83sDu8fnTXIBzFGsmXlJ+RUJrBkn
  F75hK7gnXnHo6CXmBsYzwl2MHByMAkuZJb4adTFyAZnHWCSW/9/GDOFsZpT43fuTrYuRk4NF4
  ASzxMJ9EiC2kEA/k8S7IxYgRUICdxkllt1tYgdJsAlYSEw+8QCsQUTAT+JV93MWkCJmgQlMEg
  dOvmcGSQgL2Es8vrCJBaLIQWLq1FPsELaVxJoDT1hATmIRUJXYe94CJMwrECtxdMZ+dojFSRI
  Pns1lBinhFDCSWHbYDiTMKCAr8aVxNdh0ZgFxiVtP5jOB2BICAhJL9pxnhrBFJV4+/scKUZ8q
  cbLpBiNEXEfi7PUnULaixJ5zC6F6ZSUuze+GivtKfD21nRVkrYSAlkTPHi6IsIXEku5WFoiwi
  sS/Q5UQ4RyJr58msEOEVSWeNhdBhGUk/n48xAYKDwmBHSwSh87fYpvAaDALydEQto7Egt2f2C
  BsbYllC18zzwKHg6DEyZlPWBYwsqxiNE8qykzPKMlNzMzRNTQw0DU0NNI1tDTTNTLTS6zSTdJ
  LLdUtTy0u0TXUSywv1iuuzE3OSdHLSy3ZxAhMPykFR6R2MK5c+17vEKMkB5OSKG+2qGOcEF9S
  fkplRmJxRnxRaU5q8SFGGQ4OJQleZ1ugnGBRanpqRVpmDjAVwqQlOHiURHiP2gCleYsLEnOLM
  9MhUqcYdTkmvJy7iFmIJS8/L1VKnPcxSJEASFFGaR7cCFhavsQoKyXMy8jAwCDEU5BalJtZgi
  r/ilGcg1FJmPcmyBSezLwSuE2vgI5gAjriuokDyBEliQgpqQamFAdn6SRWuR/rD2u9tAvv/fN
  oldBjq4vzok/J9hUt4977ufvz8if+vlpXk37479lg8vgvn9aj1WyFJyKC3l7KKZz2699Z1R1T
  HPqmOwZsOPmd+/nZWqmZx+MOMQa3KpacY60PjrYvvWKiOznlqaN7RU/O3YY/50KXXM+KbrK+f
  mXbnoIH91mU7T9z12y6c8Tt26mZa53Wvz/740lh+a7FeYc51TfZrLPWfNrf25C44EaJqci0Xs
  sUAS/BJOdw5mNPgsz7VA7/TnaaW5vhHOfjfnSDzePeuQyR36dauprs1guqmtFTXSNV8+pCj4Y
  zs66b6MrmO0WOOr8jA0I+3nkzR2fKbK+OjFe36kPrdLKVWIozEg21mIuKEwH7REc+RgQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-29.tower-292.messagelabs.com!1581334195!878053!1
X-Originating-IP: [104.47.5.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8863 invoked from network); 10 Feb 2020 11:29:56 -0000
Received: from mail-he1eur02lp2053.outbound.protection.outlook.com (HELO EUR02-HE1-obe.outbound.protection.outlook.com) (104.47.5.53)
  by server-29.tower-292.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Feb 2020 11:29:56 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=no0G+59wsVNgEUuRw3eaIzo6mJHMNiKHQPDqefylR6+MHfSoQdJCGOuSP5tUlVsY6hiI9JmObMRq4NvpbZhm6bfqsUcuDYlI1i620Rza0HnQf7G0UbOk/O6xoO7VwmQryJank+f0PC+di2Y42ZHwBVyQuZuLbOuq3ASzmHow6slxzHlnHDi5G3d3dujkEWdvtzfASDZqC8gXvbO7JgpK9W2BNwxnv6OGVR6BpWpbcfwP+aahz7AZ2h0xWZnMckYr6LTKqkJZBg2HKK7laVeTK0/x3CSJsdjf67RXEsQa7K2MoWo+pBr7gIKcCje3npEgPU6258HsWipaBzY09vKnCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnKhRYq8fX9giTu+hERncEu7i/QjEV20wj5/Om0MK/I=;
 b=NLDPsRItxtNa5TVl//vnkZRbpaFOOH0Ef05p3c3bd4GRnC1L4WWjWCVIjc/++ZRnO0za1TlQQUZF13rVdgEPbGCy1a+6Mb7BuDDMtxmL6c74huaQJ0nOJWuFZVRF6q/pFjxGErEW5asdz0CkCs0swbM4uIAmmfwvP7jMGA+QtLBsRy0Lj8N7WEv85fN6spBGqH0/CZ5q+BKrgoV1M0FqnGmpt1E4zMUOxjxSF8iP9e3+febf52d7c09I81m/ICMp6mm0nhLo28xY7PC9SKVlImC9vaMC6xoc8FIkW2dNsQT6ILjJHSYjDhLyqQEEoKtSN/fdK2+ous9uUKnFhukrXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnKhRYq8fX9giTu+hERncEu7i/QjEV20wj5/Om0MK/I=;
 b=nto37MKW3v0SJltIjbe6JupPkF0Uk0U+MDdirJMaZVV3k7XQfeUXRtgqIZNWDu76jCVy1TyW6il/eSkKCoXNhTWWJY3aKkZneGN+zFOD4+tXX1YjgK6uf8ZnSgxtknDv0nb4ow55J4d+Fy9MFC7QjbDBDJFmDrmAD+4fC12bUMM=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2645.EURPRD10.PROD.OUTLOOK.COM (20.179.0.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 11:29:54 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2707.030; Mon, 10 Feb 2020
 11:29:54 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] watchdog: da9062: fix power management ops
Thread-Topic: [PATCH] watchdog: da9062: fix power management ops
Thread-Index: AQHV3YZswkj0g7/lkUWM73XRYzaUJqgP0l+AgAR9PiA=
Date:   Mon, 10 Feb 2020 11:29:54 +0000
Message-ID: <AM6PR10MB2263903314B15C69114D658D80190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200207071518.5559-1-m.felsch@pengutronix.de>
 <20200207145601.GA14662@roeck-us.net>
In-Reply-To: <20200207145601.GA14662@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1b39a27-54f2-4d47-077c-08d7ae1c8cfe
x-ms-traffictypediagnostic: AM6PR10MB2645:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2645E6BC67A48AB75A6E60D1A7190@AM6PR10MB2645.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:353;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(189003)(199004)(7696005)(478600001)(86362001)(4326008)(8936002)(71200400001)(6506007)(76116006)(53546011)(9686003)(66446008)(66556008)(55016002)(110136005)(54906003)(52536014)(66946007)(316002)(66476007)(966005)(64756008)(55236004)(186003)(2906002)(26005)(33656002)(5660300002)(8676002)(81156014)(81166006)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2645;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CLjEuMtjDI2fUtYISKILJ+5utarp8jYyryd5SLuHwJYdajp7h6Wo8GdAev1iM0/vX7blPQUmfgUGefokw0nay1amsjaJ7OMfskNGQKu8OcAONUn2qIXo+/afwoKaw3qOmcfNnfXTCggiP4aqe0Y9Ag8XY3lKccI6hWihVdmnBe8aaS4yqgcts9lI6RH9YIp8xmMDJo+V4LsaIOqKkjon3D3g+Vc3cD04eLC2QiVg7s5Kg26+dUwX/za6G2dyCbmDaDDsyjpysMLeWwgR5ztwpRebNyjQhJQPx+0/0Kgn4YptupdbRdjJN4B+2IkxhfKlE0kWy8z0uL/d7jC/BSN5TI5sHtmYJ5qJL5Ze2l5AvLgU8alp+8L9j950rxjWNeL73NxurbFRjkgpmG+8QxEhR1c0bq7sMbjRv+IzK5Gp6kK94BHFYXANAoNYbzWYjD3xZi5d8iOmpqALOra7xxn8SjnI6Dxuf3Fqkq6julwzREKERbpobBJjb7WSHX2QrAUqlHCcFWbStop6CDsi0xURSO2wdsCy3m385swQ5JnE397C3V03ko1z+xlycIkbl2aQ
x-ms-exchange-antispam-messagedata: KaDuy0A1NP5jy9TlMfA8/vQvyVLxfV7EE/+C9Ds1BDPw7xNAfpjzWowWX9cubnwE4R+vfbauHMqDLttWmhgmM2VLisSnLJCPPXVXlFXaeo/scQve2fLfkx+iSw8bGTREELCq6mfxv+6opbYolWearg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b39a27-54f2-4d47-077c-08d7ae1c8cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 11:29:54.2311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZJBfH0O+1oka1xstEILeBTN+1Ji3Eg7AZZhfShQ04qtJCcKqmuZ8OrDiovBKqyZbAQK84KcYv+tOgzI3zFPJ6/dtQEAZuW1/bsqfzdGk6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2645
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 07 February 2020 14:56, Guenter Roeck wrote:

> On Fri, Feb 07, 2020 at 08:15:18AM +0100, Marco Felsch wrote:
> > This fixes commit f6c98b08381c ("watchdog: da9062: add power management
> > ops"). During discussion [1] we agreed that this should be configurable
> > because it is a device quirk if we can't use the hw watchdog auto
> > suspend function.
> >
> > [1] https://lore.kernel.org/linux-watchdog/20191128171931.22563-1-
> m.felsch@pengutronix.de/
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>=20
> > ---
> > Hi,
> >
> > unfortunately I forgot to add an v2 tag [2] and Guenter took the
> > wrong patch version. It is completely my fault anyway this should be
> > part of the next rc tag for 5.6. The device property should be applied
> > already so this patch adds only the usage and therefore don't include
> > the dt-folks in the to: and cc:.
> >
> > Regards,
> >   Marco
> >
> > [2] https://lkml.org/lkml/2020/1/8/210
> >
> >  drivers/watchdog/da9062_wdt.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wd=
t.c
> > index 47eefe072b40..77b6b5336067 100644
> > --- a/drivers/watchdog/da9062_wdt.c
> > +++ b/drivers/watchdog/da9062_wdt.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/jiffies.h>
> >  #include <linux/mfd/da9062/registers.h>
> >  #include <linux/mfd/da9062/core.h>
> > +#include <linux/property.h>
> >  #include <linux/regmap.h>
> >  #include <linux/of.h>
> >
> > @@ -31,6 +32,7 @@ static const unsigned int wdt_timeout[] =3D { 0, 2, 4=
, 8, 16, 32,
> 65, 131 };
> >  struct da9062_watchdog {
> >  	struct da9062 *hw;
> >  	struct watchdog_device wdtdev;
> > +	bool use_sw_pm;
> >  };
> >
> >  static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
> > @@ -200,6 +202,8 @@ static int da9062_wdt_probe(struct platform_device
> *pdev)
> >  	if (!wdt)
> >  		return -ENOMEM;
> >
> > +	wdt->use_sw_pm =3D device_property_present(dev, "dlg,use-sw-pm");
> > +
> >  	wdt->hw =3D chip;
> >
> >  	wdt->wdtdev.info =3D &da9062_watchdog_info;
> > @@ -226,6 +230,10 @@ static int da9062_wdt_probe(struct platform_device
> *pdev)
> >  static int __maybe_unused da9062_wdt_suspend(struct device *dev)
> >  {
> >  	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
> > +	struct da9062_watchdog *wdt =3D watchdog_get_drvdata(wdd);
> > +
> > +	if (!wdt->use_sw_pm)
> > +		return 0;
> >
> >  	if (watchdog_active(wdd))
> >  		return da9062_wdt_stop(wdd);
> > @@ -236,6 +244,10 @@ static int __maybe_unused
> da9062_wdt_suspend(struct device *dev)
> >  static int __maybe_unused da9062_wdt_resume(struct device *dev)
> >  {
> >  	struct watchdog_device *wdd =3D dev_get_drvdata(dev);
> > +	struct da9062_watchdog *wdt =3D watchdog_get_drvdata(wdd);
> > +
> > +	if (!wdt->use_sw_pm)
> > +		return 0;
> >
> >  	if (watchdog_active(wdd))
> >  		return da9062_wdt_start(wdd);
> > --
> > 2.20.1
> >
