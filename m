Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC38835617
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 07:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfFEFBd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 01:01:33 -0400
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:18292
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725268AbfFEFBd (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 01:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIDZC4QGBlFTzj1S9djnc3N1NM1P2qigcvZjLLyqOrA=;
 b=bKOMEJACrjqRDnCX0lAYw7NlVsaL0tJU4aK0EqnK3EFYyy31TNflBgC5g/Q8SCkOGkhizL5iDlnZRa3U3L31VcXhA6TNA5vqwmectEbGsxj8WlCN5gN6jgNUchefSrzeOJxFK9uds2pS72L8kkZh1sqTEJiF0Lxl4ErtpAjLlLg=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2596.jpnprd01.prod.outlook.com (52.134.246.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 05:01:29 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 05:01:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] watchdog: renesas_wdt: Add a few cycles delay
Thread-Topic: [PATCH v2] watchdog: renesas_wdt: Add a few cycles delay
Thread-Index: AQHVGfjUje5mindyn06480tMEh8uTqaKHWUAgAJlmgA=
Date:   Wed, 5 Jun 2019 05:01:28 +0000
Message-ID: <OSAPR01MB3089BB7B26D398AF87291C5FD8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559558161-31244-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190603162326.GB2960@bigcity.dyn.berto.se>
In-Reply-To: <20190603162326.GB2960@bigcity.dyn.berto.se>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d6132d1-bb96-4697-c491-08d6e972dec5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2596;
x-ms-traffictypediagnostic: OSAPR01MB2596:
x-microsoft-antispam-prvs: <OSAPR01MB259630D36342FBD757711B5FD8160@OSAPR01MB2596.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(189003)(476003)(9686003)(6116002)(71200400001)(316002)(99286004)(54906003)(6916009)(25786009)(486006)(55016002)(66946007)(76116006)(33656002)(73956011)(74316002)(52536014)(64756008)(4744005)(66446008)(6246003)(66556008)(71190400001)(66476007)(66066001)(7736002)(53936002)(68736007)(102836004)(3846002)(6436002)(478600001)(26005)(4326008)(446003)(186003)(11346002)(2906002)(5660300002)(6506007)(14454004)(53546011)(7696005)(229853002)(8936002)(8676002)(256004)(86362001)(76176011)(305945005)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2596;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2PMRgcsjTGYoLcoN9+w5r5KjDO/sfqch/aK+ytZ2/YYl4RMsVSDVc1pxzlE9qIeQ/4/pmKOYPUebdKLpvk6D9x7p+KwLlMDWqcyTTk1jl5t25/qUctBobY5DI/EYoXPwrFl1Z3AWOKNkQOAj6AZY3e/VWFHP8uHb3Jwb8pCZbZERNkO5CO+ntuB3Ch02wdwUIzfPZaqNreuWsZhChBE7IILEvLZno+rgEBqrRKtIr3nqksLWsdsue15AJmvmNfhv7UKQhSJrd3KTfpomenFvQNep7aKzkwB5S/P6MV6yGnFNZN7kcf6s4zXJeiYIR5P2Glw8aUPnXfg5k2WSBJi8NIhr6SFEy10oLICUlwbUie0jVk0afiT33aPsesxBPYRgUK5gc7EKahJ3t+hqAxRGGcIXzbNbUHKct+RQf+jNroE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6132d1-bb96-4697-c491-08d6e972dec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 05:01:29.0261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2596
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Niklas-san,

> From: Niklas S=F6derlund, Sent: Tuesday, June 4, 2019 1:23 AM
>=20
> Hi Shimoda-san,
>=20
> Thanks for your work.
>=20
> On 2019-06-03 19:36:01 +0900, Yoshihiro Shimoda wrote:
> > According to the hardware manual of R-Car Gen2 and Gen3,
> > software should wait a few RLCK cycles as following:
> >  - Delay 2 cycles before setting watchdog counter.
> >  - Delay 3 cycles before disabling module clock.
> >
> > So, this patch adds such delays.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Small nit bellow, with or without that addressed.
>=20
> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

Thank you for your review!

<snip>
> > +static void rwdt_wait(struct rwdt_priv *priv, unsigned int cycles)
> > +{
> > +	unsigned long delays;
>=20
> Could this be unsigned int? It would still fit for a cycles number
> around 2000 and this change use 2 and 3 cycles.

I think so. I'll fix it on v3.

Best regards,
Yoshihiro Shimoda

