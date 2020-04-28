Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D261BBE89
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Apr 2020 15:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgD1NGg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Apr 2020 09:06:36 -0400
Received: from mail-eopbgr00079.outbound.protection.outlook.com ([40.107.0.79]:19715
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726746AbgD1NGb (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Apr 2020 09:06:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtLTvQ0h2z3eaBS/YBaVjFLV347eNaWwmPhY8oE4bc5wJx6bvJZEVioctE8ewoJ4i+gQY1mDuR97dT3Em/lHv93UL9DaoLAZLxRPMHG+JC/VeeKUuTiMpsXeoi0GeBrGfFtcDCCwhOv7FjqaUwfI10ACtgsE5z7ZDtta2ilWgAmSv0qlV9Fp23dQ4XCGTsHrt+HW1uxr8BDctl3h1VdlYhqqHzie4aebtr94VwTrRpcnzW1vh5tY0sEtzm/JB/CWyv4EYLgoq9+QIChrFpGSa0PvHZ09s08ExDmXEI7oCp18woaNHJ/tSM8ms+b6Qs1SQq0X1jM5//7i16eI2EkzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYdlbXcKulN73UglLGDKYsSKK2l1b1xj1zclDHze45E=;
 b=Z/e3MyDLFsp5JqH4tIrkKHkjFRbNciIN6flTSC6+aHFQvhglaWlFS4W08RabTU0RHLywc4XeXGqy8+/r7iuBQRp81VxpYmRZce9Wo1oMD5N7wHW2CeD8AssIPvLxmgRo9FodewOEtqdihfj77JgCXOEmpHGqInm+nuKBxA23jkEWsK7y4w9jAYlR0a6Iw2x2qWnyLmns69Mvzu38hRJdGVDqDuntNrQuqxTuy+D48TlG9QnMOeLekwphUbPi0FYCxadxo/iJoqTPTuVI3o853fDK/RTznjQIvyLlY8ck3E80+EwfM7YsZhbv+PBpX07a2u8cNxPmtVLw2dUxbv3glg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYdlbXcKulN73UglLGDKYsSKK2l1b1xj1zclDHze45E=;
 b=kjBS9wtyyekLr9UqldhgbxHyi3wiuJm9RSHIYinhl6uY21MDWghy+vkH7McjqhnvScdj59JKDfPrTkFolMG+qws20KvBv4bM+7ALmyy3um782uiL2Uo8lfKjimW1UGRvOXdETgqJdZniMjE6Y0lZhVdRKAgZ7TxLlj7pGWArNUc=
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com (2603:10a6:20b:2a::21)
 by AM6PR05MB4310.eurprd05.prod.outlook.com (2603:10a6:209:4a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Tue, 28 Apr
 2020 13:06:27 +0000
Received: from AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::7ce1:9f42:460e:b1f3]) by AM6PR05MB6168.eurprd05.prod.outlook.com
 ([fe80::7ce1:9f42:460e:b1f3%5]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 13:06:27 +0000
From:   Michael Shych <michaelsh@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v1 4/4] Documentation/watchdog: Add description of new
 watchdog type 3
Thread-Topic: [PATCH v1 4/4] Documentation/watchdog: Add description of new
 watchdog type 3
Thread-Index: AQHWFA0lZKb6Zd9/Dk+7aAIJMVB/Uqh+xfqAgA/Mz5A=
Date:   Tue, 28 Apr 2020 13:06:27 +0000
Message-ID: <AM6PR05MB616869CBCC863F03538D07FCD9AC0@AM6PR05MB6168.eurprd05.prod.outlook.com>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
 <20200416163514.7334-5-michaelsh@mellanox.com>
 <20200418114646.GB103392@roeck-us.net>
In-Reply-To: <20200418114646.GB103392@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [93.173.116.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6be36df6-f26e-4124-fd4c-08d7eb74f65c
x-ms-traffictypediagnostic: AM6PR05MB4310:|AM6PR05MB4310:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB431041820B6FFEC7FF26A55ED9AC0@AM6PR05MB4310.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6168.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(316002)(478600001)(66446008)(33656002)(64756008)(86362001)(966005)(66476007)(66556008)(9686003)(71200400001)(52536014)(54906003)(107886003)(55016002)(26005)(7696005)(8676002)(76116006)(4326008)(6506007)(6916009)(66946007)(2906002)(186003)(8936002)(5660300002)(81156014)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zz5DjPM6VQC1uwq+MtYt8mS4GRfCmZtlxZc4OW+4/KRhsAbf+Zx8MXdJUf/v6WWUTymzjeYG0Ht39+FVScTuZUUYgPtnuxPqbvR8ww2EFoDQ5fl4CAwcEEzkmut4kDj8V7+7Pp4xQDdyPTEYkuheQRYYrUDk/cqgOomQBnkKaBsHnQQQz/CVBkDdlSBs8M/uOGaQFv0u9X3dvc9vum+9aIUMZpDWDqEmWLDnU2ZrMmBG6esD9aL4IJAeHpTE6C9dUK7yEXjiz/ezgYA2+I0nN9z9NnDHOTSs0mFndarOPuBhh1MiSuoauz3yEwbLITMZVkiKwA1miu5V5fFBoeah9RVIi/6NU9s+bMpsGbjK8EmxrIyZvHN9K20OTQHYaIDVxYjewZQRJUxZ9mtUdC1yNaqDFuJsWcRZYKh1Vhwz4YHA5UReMWjKX46uo6xd+cwc/A+Bx47j1/tu12BKDJwLeWjzAm9ULpDXtqQoZ0hH9rippqRS08hPDYOM4bXWs8h2Z3fh1N2HnE5cNjdr+H1QjQ==
x-ms-exchange-antispam-messagedata: l0nd+qMxbtpGozffKMBRwTYumgREPl63dMxEAbZsz75kj3an9lINmg9ftPxgZFA4/EAiXf5tX3xE88DpIluttIdWDhyzMKNg5rLAIlOllEiQ27VgRWAighURgIZFLoCN3rAFIL/osjZqy+eVomWDwOKrIiwuAtBx+yvI7D4UG6lkA+vojIJRyWfuThv3PtVsqmCRz545F+3RbOA9slt9y7+NnJK9Zgm8rNtWFqE6lkq9pyUdN3EgOkB4P6BYpVTGkzHFUTg1rz8aYOTNIUkWG4hHEvnGBA+0cDr6Pj05zNaL3NRVg0LBOzBSPlnWeJkj9tUHYUZ66ldS9SS1q9SK0oouILQhuiYKEmfRJA03xVz+UF4tjnw31CssvKLrejNdbKXDXPsF08CUEWIMZ9WI8di6se8ZimiozN+RmuSUkznGDn1b9hoJ2h8MJNJtsIjw9TqytYqaXYuOAXQ/QI0StBujYBUoa4udmx56eS5nael0fz9trtyQVGL9gp8sTJEtyFX+7oGxyGgEfW7Mp5KXjKKhbVljsTRYxhu17S1uLUfqEJd+IJjIZ1z/z9DI+Lxmkj1LWpSD5p9a04GYUZwflmjypEKU83VsJJPDoVfYXBuKHvM6z6328RfW1rJMIDt+FCLGlP8s0Z6Xx2ohsHKowW/S0/6Hh/79uGbs/AK/SmaXAzufjou+46Um7FUjdS7lOjQb5UHuAc8b1lFi7D3NWWSNT6VemBlb5J6UMm7xVOOMmPGUSzLVzGAwcG1olb0CQa3qCcvZ5mTMTCibZBI+zbQknycesg/6yBFh/JReUQE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be36df6-f26e-4124-fd4c-08d7eb74f65c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 13:06:27.7308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltu2s27LQOrj6JdUzBKWNxP7Mu+3VBzw8i/UBTOnAl10gXpyMJPZxappffKUcGfIfpPMNUKs6/A7VeRAXV0Lpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4310
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

By some reason, I obtained only this your mail as a reply to sent patchset =
V1
Later on, I discovered your comments at=20
https://www.spinics.net/lists/platform-driver-x86/msg21412.html
And saw that you also have comments regarding [PATCH v1 3/4].
I'm resending patchset v2 that address your comments.

Thanks,
    Michael.

> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Saturday, April 18, 2020 2:47 PM
> To: Michael Shych <michaelsh@mellanox.com>
> Cc: wim@linux-watchdog.org; andy@infradead.org; dvhart@infradead.org; lin=
ux-
> watchdog@vger.kernel.org; platform-driver-x86@vger.kernel.org; Vadim
> Pasternak <vadimp@mellanox.com>
> Subject: Re: [PATCH v1 4/4] Documentation/watchdog: Add description of ne=
w
> watchdog type 3
>=20
> On Thu, Apr 16, 2020 at 07:35:14PM +0300, michaelsh@mellanox.com wrote:
> > From: Michael Shych <michaelsh@mellanox.com>
> >
> > Add documentation with details of new type of Mellanox watchdog driver.
> >
> > Signed-off-by: Michael Shych <michaelsh@mellanox.com>
> >
>=20
> Stray empty line.
>=20
> Also, the subject should reflect the driver name.
>=20
> Guenter
>=20
> > Reviewed-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> >  Documentation/watchdog/mlx-wdt.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/watchdog/mlx-wdt.rst
> b/Documentation/watchdog/mlx-wdt.rst
> > index bf5bafac47f0..fa0a94e5c82e 100644
> > --- a/Documentation/watchdog/mlx-wdt.rst
> > +++ b/Documentation/watchdog/mlx-wdt.rst
> > @@ -24,10 +24,19 @@ Type 2:
> >    Maximum timeout is 255 sec.
> >    Get time-left is supported.
> >
> > +Type 3:
> > +  Same as Type 2 with extended maximum timeout period.
> > +  Maximum timeout is 65535 sec.
> > +
> >  Type 1 HW watchdog implementation exist in old systems and
> >  all new systems have type 2 HW watchdog.
> >  Two types of HW implementation have also different register map.
> >
> > +Type 3 HW watchdog implementation can exist on all Mellanox systems
> > +with new programmer logic device.
> > +It's differentiated by WD capability bit.
> > +Old systems still have only one main watchdog.
> > +
> >  Mellanox system can have 2 watchdogs: main and auxiliary.
> >  Main and auxiliary watchdog devices can be enabled together
> >  on the same system.
> > --
> > 2.11.0
> >
