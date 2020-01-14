Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8A613AF10
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2020 17:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgANQTQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jan 2020 11:19:16 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.8]:49706 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbgANQTP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jan 2020 11:19:15 -0500
Received: from [46.226.52.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-8.bemta.az-a.eu-west-1.aws.symcld.net id 7D/12-02751-BF9ED1E5; Tue, 14 Jan 2020 16:19:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJJsWRWlGSWpSXmKPExsWSoc9jrfvrpWy
  cQc8vXYv5R86xWqyaupPF4v7Xo4wWl3fNYbO4sW4fu8WThWeYLD7susps0br3CLsDh8emVZ1s
  Hneu7WHz6P9r4LHzewO7x+dNcgGsUayZeUn5FQmsGS1vlzMWfOKs2H7jNFMD42qOLkYuDkaBp
  cwSLy5/Y4JwjrFI9M04xwLhbGaU+N37kw3EYRE4wSzxoXE7K4gjJDCRSWLzmj+MXYycQM5dRo
  ml331AbDYBC4nJJx6AdYgInGSS6D/3Emwws8BnRomXfXtZQKqEBVwkLj04zgRiiwi4SlxfeII
  NwjaSWPThIDOIzSKgKrF9wyowm1cgVuLnmk2sENvyJFatnA5mcwrYSty88wnMZhSQlfjSuBqs
  nllAXOLWk/lg8yUEBCSW7DnPDGGLSrx8/A+qPlXiZNMNRoi4jsTZ60+gbCWJeXOPQNmyEpfmd
  0PZvhLPLs8FsjmAbC2J29u1IcIWEku6W1kgwioS/w5VQoRzJK5uu8kGYatJbJq4DcqWkeg/Ow
  MciBIC75kl7p/ZwTyBUX8WkqshbB2JBbs/sUHY2hLLFr5mngUOCUGJkzOfsCxgZFnFaJFUlJm
  eUZKbmJmja2hgoGtoaKRraGmka2RkoZdYpZuol1qqW55aXKJrqJdYXqxXXJmbnJOil5dasokR
  mMpSCg482cH47eNbvUOMkhxMSqK8Intk44T4kvJTKjMSizPii0pzUosPMcpwcChJ8Fq8AMoJF
  qWmp1akZeYA0ypMWoKDR0mEtwQkzVtckJhbnJkOkTrFqMsx4eXcRcxCLHn5ealS4rwCwCQtJA
  BSlFGaBzcCluIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmtQaZwpOZVwK36RXQEUxAR8w
  /BXZESSJCSqqBqemh9b2CK5e/70g/PadGVrX9yowYPpZDhXXNR+fcfZB822LWr+c/BNYmbUjv
  rXKS4J8eNluhfXbj1EaVb/ctkrWuRv9juDJHysHvYa1edWn+geveQTsS86NjtmyLf91daXAz6
  YLwlYJzqxKuWz13M/Y4m2Z368K55Wk1MY3e0+rm2dbYznlhs7Ky6PONYz/XGR2cNLsmw3kaf0
  Iak5sZE1+yY7Dr4p2+R+bsvbzcYGM3I49Q9NT8PvWDX+v1Lx2uzjfYt6DJ/nUOe8fkJnf5B+V
  1K8RMs6pyZG/UmIT90Q6REp54z4ctpGxuyjTbf8IiJS5zpYK1i+cqGJh3X9W4pbvimqxegGLp
  b94bX/YrsRRnJBpqMRcVJwIAzL34+mwEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-10.tower-268.messagelabs.com!1579018746!371452!1
X-Originating-IP: [104.47.12.59]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10365 invoked from network); 14 Jan 2020 16:19:06 -0000
Received: from mail-db3eur04lp2059.outbound.protection.outlook.com (HELO EUR04-DB3-obe.outbound.protection.outlook.com) (104.47.12.59)
  by server-10.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jan 2020 16:19:06 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGeS2slT2Y1w1u8y9tEe/JP603djh2t15wDPeVwNv5DD8z+D9QZ9dUuHtTRmOausam2VXJjFf8jWkVi44B+4hrnskLx/a8nzQwP8xJ3Gvt/XVS+WPeVGclgiNXqci2fZZtnU/uFYODGj1xiaWIdwxQHmWkHfuapJe3ptt6x9v6F9yOmAZ7MGgTEvHo6u7FMwTDHmpbdjud3aGB+wBbFzNstdk9AML3Dj7QfS7ZFkG31heR1gOdE6+w2/5DbtVoQqK4gDAJOaqGDtItq+ZTxEx1XpXJ7T2D2LouEkFbqv4L+DxY1ccrZboeTqv6GsqRtyU0BXikeyAutmSc8ubrVl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svcHoSh7sOp0g5ayscJMDcOBjXVtcAI7SGWowf926eg=;
 b=hSq1IODQFZf9UeER5+4p3keFz/4G9TSF6q8IA3LnB16fO2a4/HkTCZQHR0K5Z/lOmslZ4Vw6IHXbdbJpwjbaSWiOeBDnIMdaX2sNqp5Rz7fKTro+IEj7XIhnui+jeu1z+z2bPfrhzhbvfX08Nfpq6C8IkQmxHWTPcYWx7I7mS7pqyVFahBTep+TYxxM6ZQ4Mhmm+SN6j/jTCDK40H9+JrHNbY7XKmHEwgTxnkl+hd6OK3fvbOYeC3uLkvOoMzMiYRET9BdE/mi0KQnNmKpKSo2OuIfzTw8JGRBziP+7w3WVn8GkM5hZBLXbkgMB4038/aijoJH5Kl/9P3PMcbHKn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svcHoSh7sOp0g5ayscJMDcOBjXVtcAI7SGWowf926eg=;
 b=f59Lp2VizeeF9VzwfO5MgdomtV1dsAP7tIg0qeRnHw67zMkV8nsDTyeLDk4NZqWsGH/EqgxkroTNhkbzExssvS9ny9r/GQH2fw+aAvoqAM7N70kfOLyUEDJ2ebuYB7NrLcPkbtSVv0kSdaBLuJi2v6L0rB+5UBkIgfr2v7m534o=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2518.EURPRD10.PROD.OUTLOOK.COM (20.177.115.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.14; Tue, 14 Jan 2020 16:19:04 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3%5]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 16:19:04 +0000
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
Subject: RE: [PATCH 1/3] mfd: da9062: fix watchdog compatible string
Thread-Topic: [PATCH 1/3] mfd: da9062: fix watchdog compatible string
Thread-Index: AQHVxgoH+VEwCd0goUCdzD0vjKNBfafqYIMg
Date:   Tue, 14 Jan 2020 16:19:04 +0000
Message-ID: <AM6PR10MB2263E53D89F7EC66C5E3779D80340@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-2-m.felsch@pengutronix.de>
In-Reply-To: <20200108095704.23233-2-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20f9947f-a04a-4f11-4e5f-08d7990d7975
x-ms-traffictypediagnostic: AM6PR10MB2518:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2518FAE2E4E7604D1EE00E58A7340@AM6PR10MB2518.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(189003)(199004)(26005)(55016002)(54906003)(71200400001)(8936002)(110136005)(8676002)(9686003)(81166006)(81156014)(55236004)(6506007)(53546011)(7696005)(498600001)(52536014)(86362001)(76116006)(66446008)(66476007)(66946007)(64756008)(33656002)(66556008)(186003)(2906002)(5660300002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2518;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DIxcMtydyy7HJbqhoBe6a9p1EtFmrVVIq8+22rDFg0qrn3dK3i+hyxrm7S5I8ig4y/esYdNjSl4UK0VdSaaRA0uzpGzjNmFrdWng1glIUYwXWyLU5D7xLymbDvbzmD0MgoGcdRsYnU/IrGkENxWL/B3huol1m53PfPm5B+Yvl471w5mhSpga3kIYoFnEwnb511EWivg/JvaMTIsZjq+0z1kp5wZD47oPaRlI8TwzZKpMaxeQCOyK7N8TrKrI5eyHsJCADmW6ocWlDbeki+Ojf92hYFMOLl/HT4n8vzPZlA72xV45pNWznyT6K9qAEQ/GaFhoCHIzvKk89OFPAEB9ED4y1o+pi+WcAA3SAAf3hICy0dKPeXxYH7RgxlTE+yiB2i2lxf6PflouQRjw8U9D36KrF1TEbkCsdiKK8aP1NYm2dxabrIljNOPDPi6dpy6v
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f9947f-a04a-4f11-4e5f-08d7990d7975
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 16:19:04.6010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jYl8qDO9c1BnaSk0CLzNCC8LugoIOvff5lL5Kd7oE7IQ2FiCAPyhEL8eb7citcWXIhfkig1OqK4OSwhqfJUhv9Va4fLjd0I1lLd0IKFSP1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2518
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08 January 2020 09:57, Marco Felsch wrote:

> The watchdog driver compatible is "dlg,da9062-watchdog" and not
> "dlg,da9062-wdt". Therefore the mfd-core can't populate the of_node and
> fwnode. As result the watchdog driver can't parse the devicetree.
>=20

I do agree there's a mismatch between the documentation and the MFD code.
So in your DT are you specifying 'dlg,da9062-watchdog' and not 'dlg,da9062-=
wdt'
hence the issue? Are there any existing users who are using 'dlg,da9062-wdt=
' in
their DT instead?

> Fixes: 9b40b030c4ad ("mfd: da9062: Supply core driver")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/mfd/da9062-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> index e69626867c26..9143de7b77b8 100644
> --- a/drivers/mfd/da9062-core.c
> +++ b/drivers/mfd/da9062-core.c
> @@ -248,7 +248,7 @@ static const struct mfd_cell da9062_devs[] =3D {
>  		.name		=3D "da9062-watchdog",
>  		.num_resources	=3D ARRAY_SIZE(da9062_wdt_resources),
>  		.resources	=3D da9062_wdt_resources,
> -		.of_compatible  =3D "dlg,da9062-wdt",
> +		.of_compatible  =3D "dlg,da9062-watchdog",
>  	},
>  	{
>  		.name		=3D "da9062-thermal",
> --
> 2.20.1

