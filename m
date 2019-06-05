Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89F2235610
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2019 06:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfFEE6q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 00:58:46 -0400
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:55552
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725268AbfFEE6q (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 00:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMUneNGp9fgUFJGJOq3DjIHei63sp6zKfls7on17jVo=;
 b=ckUPOMSyM/Pc9sRU4AGhxNaEU0rWCltglDmNQ+P2m7kzNOW0hk+G1u+WqU4gFBSbBgwBdbmTB2hcNPnVHIRHQs9iIZMLT9SuMGdkD6tu+R6VW6fzcetkoUxIgnS+JlCQ/+SoGljwUtxLuSJOHC1u6yF4/6tmUVBbml9xu6vDFFs=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2596.jpnprd01.prod.outlook.com (52.134.246.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 04:58:41 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 04:58:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] watchdog: renesas_wdt: Add a few cycles delay
Thread-Topic: [PATCH v2] watchdog: renesas_wdt: Add a few cycles delay
Thread-Index: AQHVGfjUje5mindyn06480tMEh8uTqaJ5b+AgAKceCA=
Date:   Wed, 5 Jun 2019 04:58:41 +0000
Message-ID: <OSAPR01MB3089F2A14EBFB985F3E37609D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559558161-31244-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190603130415.wfqwyya4etbmmser@ninjato>
In-Reply-To: <20190603130415.wfqwyya4etbmmser@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42a700f5-4134-45bf-8b36-08d6e9727aff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2596;
x-ms-traffictypediagnostic: OSAPR01MB2596:
x-microsoft-antispam-prvs: <OSAPR01MB2596799D79BF4B6EFFC19A07D8160@OSAPR01MB2596.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(189003)(476003)(9686003)(6116002)(71200400001)(316002)(99286004)(54906003)(6916009)(25786009)(486006)(55016002)(66946007)(76116006)(33656002)(73956011)(74316002)(52536014)(64756008)(66446008)(6246003)(66556008)(71190400001)(66476007)(66066001)(7736002)(53936002)(68736007)(102836004)(3846002)(6436002)(478600001)(26005)(4326008)(446003)(186003)(11346002)(2906002)(5660300002)(6506007)(14454004)(7696005)(229853002)(8936002)(8676002)(256004)(86362001)(76176011)(305945005)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2596;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GMWImWTI2T/nkKS4GgHmt1SXQT8veJUXkaJ81bv/j4a0vmzzaJYp6nB8L5cxDs8FjtswoOSWI7iHAahBSVaHnIrYCa8VsKgw6N3X8P3emLvvCwur3ysE+A3V4KGOoOEgVTrRPJzFCeWItOXnUc84gnVzoVR6tpEJZlQE0s4d5FyZt3RYi6omGtLblF+ZgBZcG2JE4kVATurRR68Ukkp6vcAf2PoXGjRLZpyYjXW+PhOkbC91ckv3FtZaqg77sklqhrlXvYQfrCzoy+NNF8je+wNC3vJwA9xfmByvSSWzao8kY8nAy5chksqXeJtiQzAdLwj4XYQentuV2WnlIxH3EQELFeO2kjq4WB9mgue8MP9yJ6gYKyOowTQEH/bdX8MXM+hGrzjorMt4P5hgQNFLXhQAQvQaFZHQnWY4b+HGSLY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a700f5-4134-45bf-8b36-08d6e9727aff
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 04:58:41.5896
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

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Monday, June 3, 2019 10:04 PM
> On Mon, Jun 03, 2019 at 07:36:01PM +0900, Yoshihiro Shimoda wrote:
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
> Despite minor nits:
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for your review!

> > +static void rwdt_wait(struct rwdt_priv *priv, unsigned int cycles)
>=20
> I'd think 'rwdt_wait_cycles' would be a more precise name for this
> function.
>=20
> > +	unsigned long delays;
>=20
> Why not just 'delay'?

Ah, in v1, periods value existed. So, for consistence, I named "delay".
But, I think we should just "delay" in this case. I'll fix it.

> > +	/* Delay 3 cycles before disabling module clock */
>=20
> I like the comments explaining why it is needed.

I think so!

Best regards,
Yoshihiro Shimoda

