Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133A414B257
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jan 2020 11:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgA1KNk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jan 2020 05:13:40 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.6]:39239 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725881AbgA1KNj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jan 2020 05:13:39 -0500
Received: from [46.226.52.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-6.bemta.az-a.eu-west-1.aws.symcld.net id 5A/0E-06138-F49003E5; Tue, 28 Jan 2020 10:13:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEJsWRWlGSWpSXmKPExsWSoc9rouvPaRB
  nsOELp8WqqTtZLC7vmsNmcWPdPnaLJwvPMFl82HWV2YHVo/+vgcfO7w3sHp83yQUwR7Fm5iXl
  VySwZrQuecVWcIK/4s7KX6wNjN95uhi5OBgFljJL7D70ggnCOcYicWvfF2YIZzOjxO/en2wgD
  ovACWaJ47d2MoI4QgKTmCROtp1ihnDuMkrMb25l72Lk5GATsJCYfOIBWIuIwDtGiZav+8EmMw
  tsZ5Q4vnsiM0iVsIC7xMfFb9lAbBEBD4kH13+xQNhGEqd/fQCbxCKgKrFlynRWEJtXIFai628
  DWFxIwEbi955nYL2cArYSR5ffZwKxGQVkJb40rgabzywgLnHryXywuISAgMSSPeeZIWxRiZeP
  /7FC1KdKnGy6wQgR15E4e/0JlK0ksezGLFYIW1bi0vxuqLivxIdl/9khbC2J9aevQtkWEku6W
  4Hu5wCyVST+HaqECOdI/DoyE2qMmsT2a+ehzpGReLx7CTgYJQRmsUjs+jOTbQKjwSwkZ0PYOh
  ILdn9ig7C1JZYtfM08CxwUghInZz5hWcDIsorRIqkoMz2jJDcxM0fX0MBA19DQSNfQ0gTINtR
  LrNJN1Est1S1PLS7RBXLLi/WKK3OTc1L08lJLNjECk1NKwaHUHYxH177XO8QoycGkJMrb+U4/
  TogvKT+lMiOxOCO+qDQntfgQowwHh5IE7252gzghwaLU9NSKtMwcYKKESUtw8CiJ8MqApHmLC
  xJzizPTIVKnGHU5Jrycu4hZiCUvPy9VSpw3BqRIAKQoozQPbgQsaV9ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMz7CGQKT2ZeCdymV0BHMAEd8UZMD+SIkkSElFQDU6P/1Suhrl7qRzfJLp7
  r+estF1et2Fb7+ynW39YduvUtZIvZwa9Lv23eonvA8Pjh44udl/S8+PskT9dOPiuq5/i5hoVe
  k72+vyjSk3Gavr0oRHr3ZFuHpsLp9/ftmbRhV1lQ0cegw9n+vRYfX8k/nP3xaYnygSvrujekr
  rh7N+PmYkHRz7r6aUEvPWb+Mlw6m/Euy+Fw2S23AjTX6Sm+vPn99Oy0xNrLu5uus/QsFU7TaA
  8suz7l0faNhqE6606UvszYFXE3SLTKqd3+6wf309JPlu/8c+vS6Ufs/E7WT5S2rbPaeUPI6ef
  lEk1B5c1LfJWfHpytIu38ed5LcbannCUnZ1trd8YdsC/kiik+wuCnxFKckWioxVxUnAgACLPo
  QlUEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-6.tower-262.messagelabs.com!1580206414!751277!1
X-Originating-IP: [104.47.13.52]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27997 invoked from network); 28 Jan 2020 10:13:35 -0000
Received: from mail-he1eur04lp2052.outbound.protection.outlook.com (HELO EUR04-HE1-obe.outbound.protection.outlook.com) (104.47.13.52)
  by server-6.tower-262.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Jan 2020 10:13:35 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtZgfjaqNpBJeRZSXxRAN9btTRm7mH8B7fAYg542Ef6VAD9qQoHVPCrI+4Y4e09VtuB3kDkAKbKIc11iHPivZ9Vxc/NKNJEMEgIDsR8MpimclVejdmyPLG+7k35mxWnOWrPAe2KN8ipqFTEADDujgfPTkzifbuPjW+zIPg/IeZXYmkDCV2pBT2CG6viASeYn6X5qHKrvPQkjpGT571uaAzMW83+Pqa/aH9yMHz9MnCwWTAop+eXtosBneI4PAqoxWlzLyXB6npKbQJyUFeLvVPekUrcGYChRpzP22eYqWlCCpfI4m8g+pRtJ/eczEO897+UYsiEKRnRaVLs6yLQPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xAu82TKH4blLOHxci5k6teCgEF0JdNiDyMPxo4S3+8=;
 b=CKIcUlcxiKWrhUl3DB5+HmVuZ+NTu8OAluQWlblIXUq0d6pz3q8rTPEr6BB9THZpmlwVHzUDA4SmghRw+yjLsF/rcoCeX8nfr4t9QvEYJPM8HqZbuwKTNd4Hfx4HcZiGtQxfaWUU7wpjCu0lFZd33/h/EbYSp701dgeFlv8g1g1jXkmlfds24CeZ/uRGADFPL94mu/WE7CtPGDmPhB8LtSccoqw392GQW5F9XSdX6n+YGT6FkahD6ht7J64CfWnBydMBUJqtRexXNkCrZZVUy9uEcFZdRbWagT/ik0pRmP/dOnwsglx8H3AJRywEM1RDXkk5v6um9hoVQ9NZcZcYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xAu82TKH4blLOHxci5k6teCgEF0JdNiDyMPxo4S3+8=;
 b=TFJXKIdUO2ly3WGGdcuj85geePLp8/ZqCKyn3tMt/gFCkGmGoKC3BWLs8wj0o6PgqibDoE+cxpKd1mjkV9n+gkQiSsLXV4d3uMhjp6eAq+u9iouNxP7bpUaDm/oeNQlpMXICn9vUG5Syp09nw7j3MFEWMwrvLGRwZyO37oCGbYc=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2902.EURPRD10.PROD.OUTLOOK.COM (10.255.121.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Tue, 28 Jan 2020 10:13:33 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3%5]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 10:13:33 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] watchdog: da9062: do not ping the hw during stop()
Thread-Topic: [PATCH] watchdog: da9062: do not ping the hw during stop()
Thread-Index: AQHVz3J0N/2psq1VGU68MqLs/CX6Pqf/54WA
Date:   Tue, 28 Jan 2020 10:13:33 +0000
Message-ID: <AM6PR10MB2263D6F62A45568D5671377D800A0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200120091729.16256-1-m.felsch@pengutronix.de>
In-Reply-To: <20200120091729.16256-1-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99734c7f-c049-4054-16b7-08d7a3dabb10
x-ms-traffictypediagnostic: AM6PR10MB2902:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2902ACB5150ABB15A8F7BE0FA70A0@AM6PR10MB2902.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(376002)(39850400004)(346002)(396003)(199004)(189003)(110136005)(54906003)(2906002)(5660300002)(186003)(8676002)(316002)(52536014)(6506007)(33656002)(53546011)(26005)(7696005)(86362001)(66476007)(71200400001)(81156014)(81166006)(8936002)(55016002)(478600001)(66446008)(66556008)(9686003)(4326008)(64756008)(76116006)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2902;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PkDUbhiPh7rusFcpha5Zger+qL3IeiZJflTuvZ0dsiOdC0hz8GDG0/bSl5anDm7dUTa+CzntWSQKFA3BDJ1RwSVjCDyU7FkSJ0tWmiQ3sFiTVqclhkeuSSUkJGKU93cgTyGyxPxmz7KED6MwNKe57NlgtvPW46JrwR0dWOllHgj+jZeUNw5UqdwN8681uiaXMCHj77Iz0xTXg6XQBdEfqdbJu/60DI0MSf8nygzD96hrpl1mYIInkqzC1WaTG83d1CMN68hIdxAZn+OciS/JfWbz3AJoOkpeZ7GIiWFXGfH/7SfHpNYwCnPp2iNLlnDITJ9kKagVVRAjVehBI9BbF4OOPizjbzYTm0KRXNNBOuK1wLFDZNMx9BLCQeq74S8D8h6ADjey+2ebc2EPf9sc5Y49UZ+Px661izeVoqd77mj4dlaFw1voD6KaoYUhitUI
x-ms-exchange-antispam-messagedata: UHwxE1p8upZFwlyMtu/FWLt+4M28OAf44HKsDjJa3sWXaFjfo1TFra2os9Aunwgqz0ZxEZHFc3xLdS5uDl/nSxaO07wfLJ57KTWqZOacIV3pNYpE4RQikJ6V1uGRSBmj+6P1tcA5lHNEkMugRG969w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99734c7f-c049-4054-16b7-08d7a3dabb10
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 10:13:33.1773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7h668s7OThrqGOTPzV8BBKP+H+SWDWKgLG7Wf5S/ayNEHE6B5lIps+cEaPBDlvSAC3Apfhv4oTZtFb34Ynt+RxCvh/RsbtAe6Ca3laVcRgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2902
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 20 January 2020 09:17, Marco Felsch wrote:

> The da9062 hw has a minimum ping cool down phase of at least 200ms. The
> driver takes that into account by setting the min_hw_heartbeat_ms to
> 300ms and the core guarantees that the hw limit is observed for the
> ping() calls. But the core can't guarantees the required minimum ping
> cool down phase if a stop() command is send immediately after the ping()
> command. So it is not allowed to ping the watchdog within the stop()
> command as the driver do. Remove the ping can be done without doubts
> because the watchdog gets disabled anyway and a (re)start reset the
> watchdog counter too.
>=20

Good spot. Thanks for this. Am wondering if this might also be an issue for
da9062_wdt_set_timeout() which calls down to
da9062_wdt_update_timeout_register() which in turn pings the watchdog first
before disabling it and then setting the new timeout value. I think it make=
s
sense to remove the ping from da9062_wdt_update_timeout_register() as well =
to
avoid any possible issues where a ping() is called and then immediately aft=
er
there's a call to adjust the timeout. If you can double check my hypothesis
that would be good though.

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/watchdog/da9062_wdt.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.=
c
> index 77b6b5336067..0ad15d55071c 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -97,13 +97,6 @@ static int da9062_wdt_stop(struct watchdog_device *wdd=
)
>  	struct da9062_watchdog *wdt =3D watchdog_get_drvdata(wdd);
>  	int ret;
>=20
> -	ret =3D da9062_reset_watchdog_timer(wdt);
> -	if (ret) {
> -		dev_err(wdt->hw->dev, "Failed to ping the watchdog (err =3D
> %d)\n",
> -			ret);
> -		return ret;
> -	}
> -
>  	ret =3D regmap_update_bits(wdt->hw->regmap,
>  				 DA9062AA_CONTROL_D,
>  				 DA9062AA_TWDSCALE_MASK,
> --
> 2.20.1

