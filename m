Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1DC828EF7
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 May 2019 04:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731708AbfEXCBr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 22:01:47 -0400
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:8352
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731617AbfEXCBr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 22:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFEypbH7VAfzitD9tP6j7T3ee6e6j0C0GTxOUfwSxXc=;
 b=NOOETi6fKuebatfZCaaDWirpLokbS5bmjB5mtippk63wDtVMBv4I5KFuLwMiovDT8I0k8MMAQsbYN+hlyNDVJSYaZEaVu8J1zm5/NK8LQkZGbs9Df9mQLfJoAbmg06z5/6PtfeBNNB71Ekl3l/qXImlSVcxBHGwaJfDR+zea5CU=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB1826.jpnprd01.prod.outlook.com (52.134.233.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 24 May 2019 02:01:41 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1922.017; Fri, 24 May 2019
 02:01:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?iso-2022-jp?B?IhskQiUwJSclcyEmJSIlcyEmJVslISVzGyhCIg==?= 
        <na-hoan@jinso.co.jp>, Wolfram Sang <wsa@the-dreams.de>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        hideo inayoshi <h-inayoshi@jinso.co.jp>,
        "cv-dong@jinso.co.jp" <cv-dong@jinso.co.jp>
Subject: RE: [PATCH] watchdog: renesas_wdt: Fix interrupt enable for timer
Thread-Topic: [PATCH] watchdog: renesas_wdt: Fix interrupt enable for timer
Thread-Index: AQHVEUoUId3jLXaZb0WHj/Ry6OAuaKZ4jBuAgADtOoCAAAlyoA==
Date:   Fri, 24 May 2019 02:01:40 +0000
Message-ID: <OSAPR01MB308993D3F0959966DE599E58D8020@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <20190523110451.GA3979@kunai>
 <155866043594663500007f86@nat.cybozu.com>
In-Reply-To: <155866043594663500007f86@nat.cybozu.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a5a0a6f-89b5-4872-57a1-08d6dfebc38c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB1826;
x-ms-traffictypediagnostic: OSAPR01MB1826:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <OSAPR01MB1826E5367660CC60F882C32BD8020@OSAPR01MB1826.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(346002)(136003)(376002)(199004)(189003)(40764003)(76116006)(11346002)(446003)(8676002)(81166006)(81156014)(66946007)(73956011)(6116002)(14454004)(7416002)(305945005)(26005)(8936002)(68736007)(316002)(102836004)(86362001)(76176011)(7696005)(54906003)(3846002)(66446008)(64756008)(66476007)(66556008)(6246003)(413944005)(110136005)(6506007)(5660300002)(9686003)(476003)(71190400001)(4326008)(71200400001)(6436002)(55016002)(486006)(229853002)(33656002)(7736002)(99286004)(256004)(53936002)(14444005)(25786009)(74316002)(478600001)(186003)(52536014)(66066001)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB1826;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QrJn6ay3h6S9iHGepiNbw5FQzKo2//ZgBe6NAwozmTPL7CKy7VpPB7O/W5PYvTVUGegAL9FWcjL7QbLtA8G5BhVX8sclB4ARjsucQvs+qA+c0T//N+iOo6daRtiRRpSSVw9AuyunKZHAzIRlCwIL4jaOBI2Fi7AvOgm7XqZ5TlKR5tx19DTp/cz3Yo9hmxLJ+bosprt303wwgiXyx96Jjm/D6mHy8fjflEQb3ixa3zwNfp6hOSlgt77R0Wu81n27rqRUR7PiUpmll1KthhfiVzU7AhXvf2Ece5x6fTaP3E6Q20ubGbz5p9bXtIiJ8J9oPWQ27cdwdxpK51JXKhHEYSgZXo4PhG4STTGLskLCaq5W0ruI5IM/E4OQ3SzOH8Kl/ffrzMWNse++H2W848d3jxmb7E+2LA96K4iwY17Upxw=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a5a0a6f-89b5-4872-57a1-08d6dfebc38c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 02:01:40.8668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1826
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Dear Hoan-san,

> From: "=1B$B%0%'%s!&%"%s!&%[%!%s=1B(B", Sent: Friday, May 24, 2019 10:14 =
AM
>=20
> Dear Wolfram-san
> Dear Geert- san
>=20
> Thank you very much
> Wolfram Sang wrote:
> > Hi,
> >
> > On Thu, May 23, 2019 at 06:29:37PM +0900, Nguyen An Hoan wrote:
> > > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > >
> > > Fix setting for bit WOVFE of RWTCSRA. Keep it enable follow hardware =
document.
> >
> > Hmm, I can't find it in the docs. Which version of the documentation do
> > you use?

Do you have any comment about this question?

> > > -	rwdt_write(priv, priv->cks, RWTCSRA);
> > > +	val |=3D priv->cks;
> > > +	rwdt_write(priv, val, RWTCSRA);
> >
> > Have you tested this successfully? According to the docs, CKS bits are
> > all 1 by default. So, your |=3D operation should be a NOP and we can't
> > select a CKS value anymore if I am not mistaken.
> >
> I tested and can confirm WOVFE was be disable by command
> rwdt_write(priv, priv->cks, RWTCSRA);
> I don't understand why this bit is turned off but the watchdog can still =
reset, but
> according to the document it will be 1.

Your answer doesn't have CKS bits things. As Wolfram-san mentioned, the def=
ault CKS bits
value is b'111 and then the code "val |=3D priv->cks" can be not set to the=
 priv->cks value.
In other words, if the priv->cks is set to 0, the driver should set the CKS=
 bits to 0,
but your code will be set to b'111.

> > >  	rwdt_write(priv, 0, RWTCSRB);
> > >
> > >  	while (readb_relaxed(priv->base + RWTCSRA) & RWTCSRA_WRFLG)
> > >  		cpu_relax();
> > > -
> > > -	rwdt_write(priv, priv->cks | RWTCSRA_TME, RWTCSRA);
> > > +	/* Enable interrupt and timer */
> > > +	rwdt_write(priv, val | RWTCSRA_WOVFE | RWTCSRA_TME, RWTCSRA);
> >
> > What is the use of enabling an interrupt without having an interrupt
> > handler? (And I never understood why there is an interrupt for an
> > overflowing watchdog. We won't have time to serve it, or am I
> > overlooking something obvious?)
>=20
> I have added the interrupt node to dtsi and created the interrupt handler=
 to successfully handle the Secure watchdog Gen2,
> but this is not documented.  With Gen 3, I am also thinking whether it is=
 necessary or not.  Thank you!!!
> With Gen3, after reset by WDT, then restart will have an interrupt when p=
robe timer(), but we can do this no reset, after
> this,  timer operate normally.
> Problaly this patch should RFC

I'm afraid I could not understand these comments well, but if you have the =
interrupt handler for this renesas_wdt driver,
you should contain it on this patch :)  To be honest, I have no idea how to=
 use the interrupt though.

Best regards,
Yoshihiro Shimoda

> Thank you for your helps!!!
>=20
>=20
> >
> > Kind regards,
> >
> >    Wolfram
> >
