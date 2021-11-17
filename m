Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31D3454288
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 09:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbhKQIYA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Nov 2021 03:24:00 -0500
Received: from mail-tycjpn01on2102.outbound.protection.outlook.com ([40.107.114.102]:47616
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229944AbhKQIX6 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Nov 2021 03:23:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGYpwEm1GfHz+8nTzsxPoww9Hs3rATiIOcMX2hgSZMZnu+W8C1EtzCdgZkud2z7Orp9SMCXrzik32UC0OiQmaTzfDYRnf/U727QCznYxVO7iy5irvx4OweUuV751w2WY3W0zEs88TgPq2wL4KLEGefTHwhnup7JSnu5ljGrZaug5TkBcq54K4Kc/QNuzvx/96og29k0RkO23/pPbUVJWGiUeYJaXnMy+6mMIcqE0yZrH5hR3Jet8wiz+4UnqjyeKj38Jbui+sHcCyWcziay58wlwReNltUMbROjzsPghVGxSWyk64Pv0P7ULDJMrVvUaKo2JFjPy7cdR9zvDoDpoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5OuXBy6PtUBdHoLSsJ07q+uB2Ov9jnZmJuGRXaJ1tk=;
 b=QIeV5vmOp32/erES2ZyF793Ccq6Rht5m4cfhNip10R5sZSlXkeqOuHvbYkMzQjF3IrmilHsc7toEZIcRrRrny6a7w+Oi2FUBvWKBgtxi9Bb/8IQ6lfbr6V9T/k9d2mM7u+Q942cFAs6kGjBbFh2oKW2CXRpOIpawWSMIjJdbnenQvMh4xYiqHfByubgT1NhDTMPAr5hE0sf5mKniaUBxBjTPaSYiU1Qh4nnje2VjSAGS+Fy2015N+R6m3c3rIPnl5C9YkeJsMBwrZj2Ly9SnNzbo+Nydu0LRvOdKOG16oa+RV5YKVno/Ke5VX2edxuFBDJYLKP7UYsKgBWB08Xz9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5OuXBy6PtUBdHoLSsJ07q+uB2Ov9jnZmJuGRXaJ1tk=;
 b=EDm1OhvJV2Ah67cBSm6pbqhawk5K4LzJWwhDAjCEmJcpT+gIYBUWLQfsoaAUfXwPnzGQKanPRYMNONREmwsOILU0KioqMfbmf9NbLZPcLi7BzMzalTJhV5oAU9nCc9BhFwVMfnhKijekc5aOp1lhOQS3UgwhMsEkXHfoz2G3TGI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB1874.jpnprd01.prod.outlook.com (2603:1096:603:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 08:20:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 08:20:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
Thread-Topic: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
 reset selection
Thread-Index: AQHX1vLnlfB1SUBaW0CHFGqbJXktJKwG4nSAgACCKpA=
Date:   Wed, 17 Nov 2021 08:20:55 +0000
Message-ID: <OS0PR01MB5922F6D7662F86089833F326869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
 <20211111115427.8228-2-biju.das.jz@bp.renesas.com>
 <OSZPR01MB70196F7398C5DA1E940E79CAAA9A9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB70196F7398C5DA1E940E79CAAA9A9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e00642a4-faf8-4b43-ce73-08d9a9a32dbf
x-ms-traffictypediagnostic: OSAPR01MB1874:
x-microsoft-antispam-prvs: <OSAPR01MB1874832D8AE493D3987F6845869A9@OSAPR01MB1874.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pDZm3oDNPINEXTHHOhby58/CdopX4zwJ2YA1EeqR6Su92T8kruXU5oLGt8AZ25hmNs4/KxXLi4DiCiHQgx/C458aedIUqyYTEjkwPHml2L03K6+A+AAar8YxVUHZGS/LuonbOux85lv+DNXzUTNmlxcrwraHaWjXpq2fdFpcB1upkw2D36Uz0KLKc9bU/TxczB4hRvjA6PaxCr0o/ZmSXYBP84vfvThzBseZYH7H6TDCNzidk46HDVVklT1U9+xX9pwF4EFzcQ2nOmAreoYmoYGYyMFb1TMXlqrBXqyvHyfZ53DJat/oZ27E8ZISzWDyyQK8QJ1Tm4kYFIgIjmfMMD6Ei7/An/fA942RYIrAKyd8/i3tyamerOo8f5SVbRS+EpYaQKNTFYc2XdnhKgcsFU7vbY06fdTGZe7jXw7DQUvpFE/5QzVwHRg/2Vl+f/+2eptHcbK1ah5nO3h8K2hco2vP5MsX6S7A4mCzv7IXzXrtYNrTxqlNtrP5iGVzUBVUAHx+mMF92DYQoIn0oTGnofZ2xyYPKVKml4K+EkozoeZ9BU124l0qM+M564FMzjSmLdxc+3B3JzoazjqsWE/Q6Atq7kNNmzmi36uIjqfOsVgUtSexzfLMSYShPCcBs8AWxF1FCGNRszv5PsvpBfTEvd/1Iw02I3qA1Gkgg0CKLVJU9BnYxx/Ie+RVYDrFRH/oTCN39unJsqul+oFwOykuqPp5+EzYelbSpYHq2sWWfRw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(186003)(2906002)(55016002)(5660300002)(76116006)(71200400001)(4326008)(508600001)(54906003)(53546011)(7696005)(107886003)(8676002)(66476007)(66946007)(110136005)(38070700005)(52536014)(316002)(66556008)(64756008)(66446008)(83380400001)(6506007)(8936002)(26005)(33656002)(122000001)(38100700002)(86362001)(171213001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v1DDLoj3KwyViNfLp0TlgAPylWWA9nMZ3HqPdmLE6oqEck2g7ysRFHoX9UMn?=
 =?us-ascii?Q?eq5fCPojGFx/gqGYOFxwJ7D800yYrLjA0s8C1Hhub3g92dwMMgJVrLpJxjp2?=
 =?us-ascii?Q?FSLcc1pOjLLZTfKOtBwIQ6BI0dBOETUwEBF1VxZytlQXvLUJoGQF93pCv146?=
 =?us-ascii?Q?5vDtUt/HpZVW9i1qZZu38qc4Ho7d6t5KzJD2CD2uvHRJSCjScqqYkqiQXDVw?=
 =?us-ascii?Q?OfASWlYlm18nKsRgVrA7aZp1AhArhcsB5YR8+ZVBwax3jw4Gev5R9r+g2kR3?=
 =?us-ascii?Q?j+bWo7to10kcuS7hUon1qCotmK7EEerIi6R9zBL9xGwLx69caynwPTIxQ3yq?=
 =?us-ascii?Q?QkP+zV04yk8iFSBITdh8+igbj4ml+disnWPpIVs5l0rCA8cqG+kicsPD/p65?=
 =?us-ascii?Q?2S2sS2waaw7TN4SehAWQPQ3B0nvAmveNMx0W2I/yCL3rDAn7q/LnWHwSjwor?=
 =?us-ascii?Q?lbiURkDK4Np7lzb64tKzUU8yh6sRSbfyJ/WoedcjaEWB8gB2f7ck+mcceg/L?=
 =?us-ascii?Q?5QuchqnEuQDz1nUTmBi6L9LKjT2fzEUUT+4dXNcr9g2Dlu19MnC4m13wjEeh?=
 =?us-ascii?Q?CHjHJIXb1eFpXaLusbgjLngG58oBp1oe7Ylr1j6XtYMnTx9ErarvWl7kA468?=
 =?us-ascii?Q?3IfSeIdzHf20gnxIA3+W7KZISCJ7C1ayIHVff9JeLKQM0E6s0KVfKgqxP4uj?=
 =?us-ascii?Q?IzVA/suU9E9NraWYOMXDvWWihearMDw0q/fPWfBFZutSmwU+UrzvLAyNmkyk?=
 =?us-ascii?Q?v/cMBC8a3C1P4gJVFtNCI5atvEAchAag7Q50NEVNIbQOH+cTMTvzmEaQMBg2?=
 =?us-ascii?Q?T7yTYiNl33nWx51VcijaUAx8Wp96A4TwpuxTbl9LIyijlt+CAR7/QJCiC3Z6?=
 =?us-ascii?Q?QO6mGGif7omq6AsIkYvoHY3KEIRT58fJbgbzLHElaml2fNqOADgiHAhW0Ede?=
 =?us-ascii?Q?HfetLnpS0S/v8cDzVb63XouHJUmscdTpu61q/2BxNLEERNGlDHYC7D00fnFf?=
 =?us-ascii?Q?XJFtVrriTu0RSIdgkAA4HBB33a6s8pa/nzpr0LG7NN2gcBHIGucuMmEk1dI0?=
 =?us-ascii?Q?1Iqxo60IDIJKdiyMgb9F3bCHE3PhPfV2XdxlYHdStBgc6nADhmaHuxqn2TxQ?=
 =?us-ascii?Q?nhlkdqOAMpl3F59sdIxQGJZ7oz8j3tt/28IJZ9pMoeRATCpmWuafUPCx5dGl?=
 =?us-ascii?Q?XqMmVkFsWLyI4Wjyx1811QERvbc/E7bw5X2AYzNOsbiEsMjfiqUa7YNvcsdj?=
 =?us-ascii?Q?7Op8ukVcIF3H8d2wtnA2euZNoTkBcs7EYMcTMFJy+AhCHdimVT1uet4frwIF?=
 =?us-ascii?Q?gn7sf5ZISbMHWH8MV4geNzDjHnGJc90h/pb6vrNcdhXlDh6oiW6cT/indxMe?=
 =?us-ascii?Q?8ja6xkfNeGHpoZT/pAwq+YJrtHJvkxoFiFYHJFNHTL5RbRhMPIjDLJWkzAlx?=
 =?us-ascii?Q?7ANA1qR/INZ0/K9kJ7qTLzx+0fGr5ZU4C0BLi+SJnkWGBNCSEiYMhWybvAYu?=
 =?us-ascii?Q?wqYnfTifo1/WkvCeA4LkB0kcYB6ejaretuJJrTYE9Pmz34rRAawLbZxVh/DK?=
 =?us-ascii?Q?cBGibl0H8C9roWv1s8k414qxP1fCVT1OtvVm5XwyPlkEvPO379BadrcTXmHJ?=
 =?us-ascii?Q?YOri6k95AH++A+t6+6FnKuOYrVx/WzIE5/Adr+HoJhuHU0zDQ0RBBo9ry61T?=
 =?us-ascii?Q?AKtw8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00642a4-faf8-4b43-ce73-08d9a9a32dbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 08:20:55.8748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +n+Q89x59AP8Hc9PPKd1xlROafMpn2ROWw6o56CE/cGGiY7lZb97EuI52p4gtymIeuvLA7Oy2xe7yogB9VcpcJCc+/z14Wbn0UUyW89zVLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1874
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Prabhakar,

Thanks for the feedback

> Subject: RE: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
> reset selection
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: 11 November 2021 11:54
> > To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> > <sboyd@kernel.org>
> > Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; linux- renesas-soc@vger.kernel.org;
> > linux-watchdog@vger.kernel.org; linux-clk@vger.kernel.org; Chris
> > Paterson <Chris.Paterson2@renesas.com>; Biju Das
> > <biju.das@bp.renesas.com>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog
> > reset selection
> >
> > This patch adds support for watchdog reset selection.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > V1->V2:
> >  * No Change
> > RFC->V1:
> >  * No change
> > ---
> >  drivers/clk/renesas/r9a07g044-cpg.c | 22 ++++++++++++++++++++++
> >  drivers/clk/renesas/rzg2l-cpg.c     |  6 ++++++
> >  drivers/clk/renesas/rzg2l-cpg.h     | 14 ++++++++++++++
> >  3 files changed, 42 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r9a07g044-cpg.c
> > b/drivers/clk/renesas/r9a07g044-cpg.c
> > index 91643b4e1c9c..0bbdc8bd6235 100644
> > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/clk-provider.h>
> >  #include <linux/device.h>
> >  #include <linux/init.h>
> > +#include <linux/io.h>
> >  #include <linux/kernel.h>
> >
> >  #include <dt-bindings/clock/r9a07g044-cpg.h>
> > @@ -295,7 +296,28 @@ static const unsigned int r9a07g044_crit_mod_clks[=
]
> __initconst =3D {
> >  	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
> >  };
> >
> > +#define CPG_WDTRST_SEL			0xb14
> > +#define CPG_WDTRST_SEL_WDTRSTSEL(n)	BIT(n)
> > +
> > +#define CPG_WDTRST_SEL_WDTRST	(CPG_WDTRST_SEL_WDTRSTSEL(0) | \
> > +				 CPG_WDTRST_SEL_WDTRSTSEL(1) | \
> > +				 CPG_WDTRST_SEL_WDTRSTSEL(2))
> > +
> > +int r9a07g044_wdt_rst_setect(void __iomem *base) {
> Can be static.

OK. Will change to static on the next version.

Geert,
On the, next version I am planning to introduce the below code for
Reset selection based on device availability, instead of selecting
all the channels. Is it the right way to do ? please let me know.

node =3D of_find_node_by_name (NULL, NULL, "watchdog@12800800");
if (node && of_device_is_available(node) {
 	// set reset selection for that channel
 	of_node_put(node);
}

node =3D of_find_node_by_name (NULL, NULL, "watchdog@12800c00");
if (node && of_device_is_available(node) {
 	// set reset selection for that channel
 	of_node_put(node);
}

node =3D of_find_node_by_name (NULL, NULL, "watchdog@12800400");
if (node && of_device_is_available(node) {
 	// set reset selection for that channel
 	of_node_put(node);
}

Regards,
Biju

>=20
> Cheers,
> Prabhakar
>=20
> > +	writel((CPG_WDTRST_SEL_WDTRST << 16) | CPG_WDTRST_SEL_WDTRST,
> > +	       base + CPG_WDTRST_SEL);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct rzg2l_cpg_soc_operations r9a07g044_cpg_ops =3D {
> > +	.wdt_rst_setect =3D r9a07g044_wdt_rst_setect, };
> > +
> >  const struct rzg2l_cpg_info r9a07g044_cpg_info =3D {
> > +	.ops =3D &r9a07g044_cpg_ops,
> > +
> >  	/* Core Clocks */
> >  	.core_clks =3D r9a07g044_core_clks,
> >  	.num_core_clks =3D ARRAY_SIZE(r9a07g044_core_clks), diff --git
> > a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> > index a77cb47b75e7..f9dfee14a33e 100644
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -932,6 +932,12 @@ static int __init rzg2l_cpg_probe(struct
> platform_device *pdev)
> >  	if (error)
> >  		return error;
> >
> > +	if (info->ops && info->ops->wdt_rst_setect) {
> > +		error =3D info->ops->wdt_rst_setect(priv->base);
> > +		if (error)
> > +			return error;
> > +	}
> > +
> >  	return 0;
> >  }
> >
> > diff --git a/drivers/clk/renesas/rzg2l-cpg.h
> > b/drivers/clk/renesas/rzg2l-cpg.h index 484c7cee2629..e1b1497002ed
> > 100644
> > --- a/drivers/clk/renesas/rzg2l-cpg.h
> > +++ b/drivers/clk/renesas/rzg2l-cpg.h
> > @@ -156,9 +156,20 @@ struct rzg2l_reset {
> >  		.bit =3D (_bit) \
> >  	}
> >
> > +/**
> > + * struct rzg2l_cpg_soc_operations - SoC-specific CPG Operations
> > + *
> > + * @wdt_rst_setect: WDT reset selection  */ struct
> > +rzg2l_cpg_soc_operations {
> > +	int (*wdt_rst_setect)(void __iomem *base); /* Platform specific WDT
> > +reset selection */ };
> > +
> >  /**
> >   * struct rzg2l_cpg_info - SoC-specific CPG Description
> >   *
> > + * @ops: SoC-specific CPG Operations
> > + *
> >   * @core_clks: Array of Core Clock definitions
> >   * @num_core_clks: Number of entries in core_clks[]
> >   * @last_dt_core_clk: ID of the last Core Clock exported to DT @@
> > -176,6 +187,9 @@ struct rzg2l_reset {
> >   * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> >   */
> >  struct rzg2l_cpg_info {
> > +	/* CPG Operations */
> > +	const struct rzg2l_cpg_soc_operations *ops;
> > +
> >  	/* Core Clocks */
> >  	const struct cpg_core_clk *core_clks;
> >  	unsigned int num_core_clks;
> > --
> > 2.17.1

