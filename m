Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 595E513AF59
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2020 17:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgANQ2q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jan 2020 11:28:46 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.67]:48592 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbgANQ2p (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jan 2020 11:28:45 -0500
Received: from [46.226.52.204] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 9F/47-19890-A3CED1E5; Tue, 14 Jan 2020 16:28:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFJsWRWlGSWpSXmKPExsWSoc9hrGv1Rjb
  OYPdXRov5R86xWqyaupPF4v7Xo4wWl3fNYbO4sW4fu8WThWeYLD7susps0br3CLsDh8emVZ1s
  Hneu7WHz6P9r4LHzewO7x+dNcgGsUayZeUn5FQmsGS///2QpWCRUMeveRuYGxsV8XYxcHIwCS
  5klzqy9zALhHGORuLihiwnC2cwo8bv3JxuIwyJwglniYfNzMEdIoJ9J4uvlg8wQzl1Gicdfrg
  NlODnYBCwkJp94AGaLCMRLHJ97FqyIWeAes8TS1c1MIAlhAReJSw+OM0EUuUpcX3gCqsFJYs2
  6vcwgNouAKlDNYiCbg4NXIFZiyqNAiGWfGCU27+hjB6nhFLCVmPJ7ISuIzSggK/GlcTVYL7OA
  uMStJ/PB5ksICEgs2XOeGcIWlXj5+B9UfarEyaYbjBBxHYmz159A2UoS8+YegbJlJS7N74ayf
  SW27PjFAmFrSey7fw9qpoXEku5WFpA7JQRUJP4dqoQI50gcaNkMVaIm8fnpFShbRqL/7AxWkF
  8kBNawSGxefodtAqP+LCRnQ9g6Egt2f2KDsLUlli18zQxi8woISpyc+YRlASPLKkaLpKLM9Iy
  S3MTMHF1DAwNdQ0MjXUNLc10jQzO9xCrdJL3UUt3y1OISXUO9xPJiveLK3OScFL281JJNjMBk
  llJw9MYOxt9f3uodYpTkYFIS5RXZIxsnxJeUn1KZkVicEV9UmpNafIhRhoNDSYK3/BVQTrAoN
  T21Ii0zB5hYYdISHDxKIryir4HSvMUFibnFmekQqVOMuhwTXs5dxCzEkpeflyolzlsJMkMApC
  ijNA9uBCzJX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzNsDMoUnM68EbtMroCOYgI6Yfwr
  siJJEhJRUA1ONiU1pt7n8tyeOG+ssmoTmi9rp/ZA8zWEq4Ph15VXmsETTS6VXLD6Zy89dO2Ou
  6p/ew19r36tWvdM0rrNs4RXJ7X6XziomePygYx9DAee9iSaXHnlM/yxRMY1ff7vpl/0WJ/d1O
  puzL2nyT7nUJ/vMi0d9Wmqrke39Y8UV2f/WMOi4nvPIbYsQ3ZwptVzLIKjgYOCRfGGG5EUSXq
  n5WzXszm9UmyT/M2zPXc8JojpPjrU1r91l87ufK9VZ/8vy7nvc5n1Rj3VuvhGslBRb3tX18rH
  6Tta3N2Ykputq/FC5yBF2/GZunzND93rV1as2e1hrFK7kj3la+G+K3dzpyx6qWfyZu2xCzNTO
  sqwVSizFGYmGWsxFxYkAvpYdrm0EAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-19.tower-292.messagelabs.com!1579019321!428579!1
X-Originating-IP: [104.47.8.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17206 invoked from network); 14 Jan 2020 16:28:41 -0000
Received: from mail-am5eur03lp2051.outbound.protection.outlook.com (HELO EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.51)
  by server-19.tower-292.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jan 2020 16:28:41 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gndyR8QQzCU7RLVdPi30QMHtx0JrWsW1RmBbVZjeSMSqf4Ft+H4tnDAZC8StyP5nS7eN4sBFhfazGeTE+LCeu07NNgMthTBx6STJOHOn696xi5z8RmNbCVb1AY7NyR7yq+vHGWbLIfc5hc5pAfDDA94mmuEYDd+e2RYvwogbmA8XG1G1yuDH9byfsFC8cJbvabcx/45QZ5Hq3LxfRF8HsmJ+Re3lJT1OlBkNR2hKQfgS3RIbbqZZ5yRaTELTySYnYnnQ9g5rLEbTk2saNPuVcrMFxmDR1zpZGKIEF9f6Ykcj/eyistEthR4qI36jDs65YuMPCcGrhTLQL/rCt/R8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LF3/WLv78X9y7gacjL5J4psv8DNA7gQmlO82+6YXhGk=;
 b=L0GMxE3t9alfS96F5lOkKWgUpuBQgKJp7BzjKqfJgE72OxJDqRsnwYaN3CW18A1jDZNw6F1UW3kB2Veo6E4N3SmxHeiGCpkj2m9vsiSTkhnIVwJmfUTuRIH8IOrUIFNxx1vPi0KhFHIXonrL50BZVybF61GlNZZFK75AN7SmqkVQ780cMaP9VMx4RPwT5g7POQNaQUT5lG0jbz6U4Xki5k1glL/ZlA4kG0F+SrFy8BircLy6s/eXSx8VAhQFxp5oiVR2y5u3wsB13M8ZVzz7cp8Y+Xgtc1M3UMEJ+HABzTirUgdyYVvt+cg9Mk2gq1nva1Ayu50eQFli8H7gwxj/0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LF3/WLv78X9y7gacjL5J4psv8DNA7gQmlO82+6YXhGk=;
 b=R8IHlH5qGfBz3temhV0ALz87hYnhcxA5uFYtkE2celxXe9KyLCKyfyTheWHK7D/rtoXON3EhXDSZHKizEQkPV3N+Kum7Hc/915WJeRWx2EKrNQILsU1OcRS9jIGbpcTaSvBZrduBSkheuyaHgjKNxtLVWM5ases4omgqfTuY12A=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2726.EURPRD10.PROD.OUTLOOK.COM (20.179.2.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 16:28:40 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3%5]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 16:28:40 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 1/3] mfd: da9062: fix watchdog compatible string
Thread-Topic: [PATCH 1/3] mfd: da9062: fix watchdog compatible string
Thread-Index: AQHVxgoH+VEwCd0goUCdzD0vjKNBfafqYIMggAABdYCAAACmIA==
Date:   Tue, 14 Jan 2020 16:28:40 +0000
Message-ID: <AM6PR10MB22632546AC9A4466B642BEFD80340@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-2-m.felsch@pengutronix.de>
 <AM6PR10MB2263E53D89F7EC66C5E3779D80340@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <20200114162359.weoirknje6yhcmds@pengutronix.de>
In-Reply-To: <20200114162359.weoirknje6yhcmds@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41845e66-6efb-473a-5dc1-08d7990ed0d8
x-ms-traffictypediagnostic: AM6PR10MB2726:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2726222D05CF0690C4049704A7340@AM6PR10MB2726.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(189003)(199004)(64756008)(966005)(478600001)(2906002)(4326008)(66556008)(66476007)(66446008)(66946007)(316002)(110136005)(54906003)(76116006)(55236004)(52536014)(26005)(8936002)(6506007)(53546011)(5660300002)(81156014)(8676002)(86362001)(81166006)(186003)(55016002)(9686003)(71200400001)(7696005)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2726;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UY0ETwwWB1NC4jQJjjIyRfZgLyPA0HocCW7OweiydhtyjTfulqfcb6Gii7m9AGLpur6kaPBFzdeuwN6ZFDolbywaB6FSkyOzJuA6mh/OPe2s+J3oduf2O9k1JQn1itn+IWTiyK+IMLfRsuVKEAcLynyiLdjH5KQkBEJku/+OJxAwXOO0Q7OtSR3n11sWbOOiK8JMecT4PXCnbm3HO679+TvehW+sW057MarOt3imA+6cwnALlRXfT4ZIEAEcSZ+/ahOFiNFa5de91/AO15shTLd7T1qsmcb/dNbqBQucQkxpWg/eMXFbafmCw/KHVGAHARfs6oI0QC+W8kZ4cac+Csor21+FlEbskNUj7JOSIeeQ5GIwG1cnaX8modneSBT9fDScmAZQTIHl6/qqDKybKO8Z++25cx7AxXkjRBB0oCZbIi/s39FFIhWfQ0xkdh9tOho9tFwibhOVvJNznRMDOsWLPuzjPgpEISB0AAkh0qDB3otgvVndRQwE/KSDPAs8A1P61u37IuY5ED5Jn0BeRQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41845e66-6efb-473a-5dc1-08d7990ed0d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 16:28:40.7757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xrlcAF6X62ThIJJxqBw3QYFfX5s1g24k7hBeL1xqlEqPTAq6iNRJY+NV2Gm49gsomItKfz42l63GrwV/ET5k3CKQcNHmyuqV1InPQcYzhdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2726
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 14 January 2020 16:24, Marco Felsch wrote:

> On 20-01-14 16:19, Adam Thomson wrote:
> > On 08 January 2020 09:57, Marco Felsch wrote:
> >
> > > The watchdog driver compatible is "dlg,da9062-watchdog" and not
> > > "dlg,da9062-wdt". Therefore the mfd-core can't populate the of_node a=
nd
> > > fwnode. As result the watchdog driver can't parse the devicetree.
> > >
> >
> > I do agree there's a mismatch between the documentation and the MFD cod=
e.
> > So in your DT are you specifying 'dlg,da9062-watchdog' and not 'dlg,da9=
062-wdt'
> > hence the issue? Are there any existing users who are using 'dlg,da9062=
-wdt' in
> > their DT instead?
>=20
> Yes the upstream available DT I'm currently using is:
> arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi.
>=20
> I grep the code and found no _upstream_ user of 'dlg,da9062-wdt' also
> using this compatible would be a missmatch with the binding
> documentation. So those DT's assuming a wrong binding. Therefore I fixed
> it here and not within the watchdog driver.

Ok, no problem. Just wanted to be clear. In which case:

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>=20
> Regards,
>   Marco
>=20
> > > Fixes: 9b40b030c4ad ("mfd: da9062: Supply core driver")
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/mfd/da9062-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> > > index e69626867c26..9143de7b77b8 100644
> > > --- a/drivers/mfd/da9062-core.c
> > > +++ b/drivers/mfd/da9062-core.c
> > > @@ -248,7 +248,7 @@ static const struct mfd_cell da9062_devs[] =3D {
> > >  		.name		=3D "da9062-watchdog",
> > >  		.num_resources	=3D ARRAY_SIZE(da9062_wdt_resources),
> > >  		.resources	=3D da9062_wdt_resources,
> > > -		.of_compatible  =3D "dlg,da9062-wdt",
> > > +		.of_compatible  =3D "dlg,da9062-watchdog",
> > >  	},
> > >  	{
> > >  		.name		=3D "da9062-thermal",
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
