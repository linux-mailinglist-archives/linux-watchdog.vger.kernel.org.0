Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8D3453D0E
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Nov 2021 01:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhKQASK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Nov 2021 19:18:10 -0500
Received: from mail-tycjpn01on2107.outbound.protection.outlook.com ([40.107.114.107]:3537
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229544AbhKQASJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Nov 2021 19:18:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd0QF7+AY0bpBA7UkB/vE/XJUA1HI1Gng6isVhrH8q/8HjB2xQEBMiC/8MTRrLqq8PFwEDw+QDLw3p5dtjAqEa1HX0I+3nQKx33G5Qg0Son14mW6/LN6nLXPc0ERRzRi1Cejxb3ZQEWlTq/Djo3jaa6aylvq9NWH6TpHruPaeezuCd/PS826sTWKbIqZt/X6qYcn8uhuHJ1jFyQlQkPL39fj+hCz4gpeBcFEclHOn/CNw7NceqQdUKSa0QeIVENPQ3P+0T1AmuZFBf6ajHaarc22BzUByfx9NVw81BI0dQGwxB68OLJ78NHs46a2M8wRqWFB2wfEKutWzJg2TXW46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFQxFzwi7qkOqcfYerraaBCgic8lne1WX2i9qTzh3GI=;
 b=BZ+8wjAoRu7ip08KxqbKGemgXGNGZAzfd60gJjumbJY985wqiUQBZrbUWz4tvm5s19sOPnzO6utzyTqi4mWtyZXrjq6ew8ID7o3ckKK6H/wLwXN/bc7es+Hpi63CfqTK0aYcFjAmtfe6XeVilLcvDrFMws4h0XjP2+PtIRFeQSqZHDDZip1uyiUVAaioyqqKDkSSy0XDQ4cj9RO/0OpuhDFpwtxtIGXkIpcghf9iJGwFep0k6ZMvjFo2lsgHjj5yvs57f+XKd5cf7m3r86KA3BZb0v/ueGpg0fazWO905Ztvdl4Q9gIcZNgaz5id4NKgf2yCEBHUJQuxBKIr7y2pZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFQxFzwi7qkOqcfYerraaBCgic8lne1WX2i9qTzh3GI=;
 b=RSNj47pz9MYcw7tzWDkitrq07HGl7W/7VN5s2gOGrZHMu6JzyjA4cwomaFt9dFKWz7XZskt/IjoK/tqi2FlnqTIMfOLX/neMGNpT3tTud4iFjBKxJL6fwVCVk71isH5Bq9IEK/kEL3OWaD1HrAAqUCxL+ieQrts6AdmZ9HDQpcM=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSAPR01MB5025.jpnprd01.prod.outlook.com (2603:1096:604:66::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 00:15:08 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae%9]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 00:15:07 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
Thread-Index: AQHX1vLneCvAh5WPyE2LV+Q79VXZfawG4XHg
Date:   Wed, 17 Nov 2021 00:15:07 +0000
Message-ID: <OSZPR01MB70196F7398C5DA1E940E79CAAA9A9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20211111115427.8228-1-biju.das.jz@bp.renesas.com>
 <20211111115427.8228-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211111115427.8228-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 072e6be6-84dc-4f36-06e3-08d9a95f4fd1
x-ms-traffictypediagnostic: OSAPR01MB5025:
x-microsoft-antispam-prvs: <OSAPR01MB5025ECC6EE05A8EC51055528AA9A9@OSAPR01MB5025.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mXBZRrZPbXZlMVxdwko4NpE5EqDR4qmxviqX1CN9Ykoe1l29Wo/z496O4NuEgWSjRrmyidXqWn4Jy5yi05cA30Vs+BTN1E+21Tm8+u3W0MIx+bMUP2SnVfnXpAhsSrUZPsl47c+k46hPUWLWjPuCkaHF5vj1k+emS+pUiHXEiHQ2plU+k+a0HZWuzU45unjzdS06tnVk9LhrV8KUei6wJ8/lfmyMHMOxlVvHT9sLUZN/xoQrRFtMfL0qQ0oBjUcg2qxTbRIUJeFHMbleE9mMCZspfiSQ9QVVWD9/kLQaG6G1yUYqe2yd/5b7LKQR+c7VtsQ0ir0Z6QrgAU/sMsR8eLZWY38HQPX2Loxaa3BOml/PKUo4Ufl4Tk8TwbWs3EG0XyeWJEtgE9r6Sq7oXcVmRIfJpzlSGHdZA7iyBV85SHv6Ukv3iXE9xng2alCOfksVGbSItLEf3L2F/lOdEPBXUYutyvq88AxrbuuaFPdRZmx8wBgpQP+fJglElGZu5ng+Xacc/oMszwMDdz/72EiW6ggHH0ROszEPsyjyXIASPasUV7+ZivNqvwyvUKv9kOuDpm70Jl5bTM/SyZ0v6To0g6DtesyBYHgD880imLdCvzK46a1BBX161SdhJ15iOG7JGVCOYYDcZpgeGPQez9HRvHR9hMz1ZFcz234Q/aL4HPQaPm2BZxSjlQL5dRp7iSzSkX4Px3PjcY9RjhI0JXMnHlMP4obBWdwQb0gnUBwyH3Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(186003)(26005)(7696005)(508600001)(71200400001)(54906003)(55016002)(2906002)(5660300002)(33656002)(66446008)(66556008)(66476007)(107886003)(64756008)(86362001)(9686003)(6506007)(4326008)(52536014)(53546011)(66946007)(76116006)(8936002)(8676002)(83380400001)(316002)(38100700002)(38070700005)(122000001)(171213001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EYAt/YIr6FzFCdZhfI8R/Ffm2BiE7cyUm0T7OtO4p2L6n2h7VF3aboDpUWJ6?=
 =?us-ascii?Q?J/jIPS6cNNgsOfhdzXEq1FndKK+nqGGfLBC7fW0peJQFEe5UhlW3muD3RBW9?=
 =?us-ascii?Q?rBRvv8k6NmeqGl+F37SlLJLabOsGh72HQZbCP47QJttlAiK4mmGHKr9jbUk1?=
 =?us-ascii?Q?qrwIvTyPuuaA1rupXxo05wVV4GKAQriheuZJsCJZdI6hChgnjriLtRi1eGFH?=
 =?us-ascii?Q?7vIUHtNyWSL7l91OamUPHo1PkBGwzHMFOJaXQxjjfTKfo+HXojWAafrM45Yt?=
 =?us-ascii?Q?jzNIkKB/DfrAkbNEPLw5+lv7hrRzh2wFd1ErB4nOm2cUrKmh+1XxyExukF4+?=
 =?us-ascii?Q?wPo6wtd6xleXGGA6yOm/aoMt6GuYt2z6h4+agTZM7ocBKIp97ArtMDS5p/yQ?=
 =?us-ascii?Q?gQFJQ0FNo/vOEhibq/TE6kmzdqobfuGd3u9vO974pfbzK3GcuzYhnqKsI6hs?=
 =?us-ascii?Q?4DWGo9s1wVv1rVPniXWL2AFVI8g2U9fNaAPdL3/oOEpGoGh2Ea/3lUp2uB8h?=
 =?us-ascii?Q?9HHJUDqFOyTa4mKAoz8h8UMP4L8UXjxL7TzrAFSLyHWla/yiWenF9zH0533S?=
 =?us-ascii?Q?ZMQxeLFlioC4fHzOV3pnAvdtQke+V+n9MlJs02kA0CgeUORKI44bZCVvrfhx?=
 =?us-ascii?Q?Ol32LcnZNXHGkSIHRMIoUfs8cRxTHq+j1IyU/89o5zKsQhXxE3+YCvXI4Y2A?=
 =?us-ascii?Q?gYMz70qsR+hu7owkCUJ+BqP+giLYx0M0nDqUV9Yn1XI8PFBfnp0wjoI0HHx5?=
 =?us-ascii?Q?d4LCFLB2+uDTCDknWVx/AtNzOwbwgpk2kMbHplEL1AeCKZmxecZRWJhfeya4?=
 =?us-ascii?Q?SAVXk2jqFcZRGovVRXwxVAHCkqUQiI0z95SrpkrUrjXF3mnI4AFSZIHHHr5f?=
 =?us-ascii?Q?N3oU/6Vt3U2EeMCzMgqhRwbgwUEJV9Ooo2dxXfSpfG+zwdRcx2qBLG+OeTQr?=
 =?us-ascii?Q?4X3lXEm3JXVRuqriTEqIS/vQu79f75Tazcw+kdjJWx1gWSo4+9elLPbhEHHk?=
 =?us-ascii?Q?+V9GLT6SGMX1H6E+dDu42o7806wJ8R25fQDy9fSEDu9nF4XAoqA8BjEhd3VK?=
 =?us-ascii?Q?gG4jDJppqvrR3LFSKtKKDrvwWAk9e6UWb33e8t7jqB0LUjB9ih61JcIJkFfq?=
 =?us-ascii?Q?ddoo+R/9ODW9ZYpmOWcYLKbD8i4DRPSV7qwJoHiSuj3vXLN3OsMljn9wpfo1?=
 =?us-ascii?Q?TtCP5xbl/rDX3fMgMBtQUs3ICtc5x13i3U1cLXhUIXxEExRGebrKyXMvA9+R?=
 =?us-ascii?Q?UmqO4dl0po1gQytrveYKKgNqP/rVOl0rSp1C82/g8NdAbcr8ABRzCP+t+eRx?=
 =?us-ascii?Q?bDq7H2ITA2EQZJ69AXueKmW+zr1gAwn5GRRswse284W+HOAC6jd+BlALQpJF?=
 =?us-ascii?Q?wR9rAGYFzKebtj3RdXKcFhIkCL/QIjBUvB+MJEbKtC1eU3/4hUS+4ConnAKt?=
 =?us-ascii?Q?VAopA0MJp3nZskIp0lxOr4seOsZc62Sf8alpNuO+NnrOe+mr0Pw2NYSxKPmy?=
 =?us-ascii?Q?cAJSB7F5fH0wjhErnr0h8mAc8QmxfamG1F4FLTQ01OSFExxltJdjV5AHYz2N?=
 =?us-ascii?Q?sVMJQPMsYZAzJSr/Zzr6DbFB2hicb3WhZOU7q3qwmjh5GNcPAIfjKD84tEdY?=
 =?us-ascii?Q?TP2GGEaXEdgs8CjcP6z3kkEzAB+cyEAj3HcuJC4FEIV2OXqbTFkkXr6h3UWq?=
 =?us-ascii?Q?kV/WLwU4dOY5OOQPT6GUFbe7CYZBKUzZCzqUyuM/3UK3VBG7iuoqyUt/SDkL?=
 =?us-ascii?Q?+7FRoteYrQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072e6be6-84dc-4f36-06e3-08d9a95f4fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 00:15:07.3023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KP0ZvHnCYYy+M3Kyz1TX1iG4xnG7gQ9ny+l8ScTe8qCEp/A62hB/0w2hZV8LCvzw+tlorRFWsNln1YQjRfsot5SCJDRcZ/3ZvYJ5R9gy6kbYofPrjQ4+xzS5/yssdnoU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5025
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Biju,

Thank you for the patch.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 11 November 2021 11:54
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kern=
el.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven <geert+rene=
sas@glider.be>; linux-
> renesas-soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-clk@vg=
er.kernel.org; Chris Paterson
> <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>; Prabha=
kar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: [PATCH v2 1/3] clk: renesas: rzg2l: Add support for watchdog res=
et selection
>=20
> This patch adds support for watchdog reset selection.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> V1->V2:
>  * No Change
> RFC->V1:
>  * No change
> ---
>  drivers/clk/renesas/r9a07g044-cpg.c | 22 ++++++++++++++++++++++
>  drivers/clk/renesas/rzg2l-cpg.c     |  6 ++++++
>  drivers/clk/renesas/rzg2l-cpg.h     | 14 ++++++++++++++
>  3 files changed, 42 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9=
a07g044-cpg.c
> index 91643b4e1c9c..0bbdc8bd6235 100644
> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
>  #include <linux/init.h>
> +#include <linux/io.h>
>  #include <linux/kernel.h>
>=20
>  #include <dt-bindings/clock/r9a07g044-cpg.h>
> @@ -295,7 +296,28 @@ static const unsigned int r9a07g044_crit_mod_clks[] =
__initconst =3D {
>  	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
>  };
>=20
> +#define CPG_WDTRST_SEL			0xb14
> +#define CPG_WDTRST_SEL_WDTRSTSEL(n)	BIT(n)
> +
> +#define CPG_WDTRST_SEL_WDTRST	(CPG_WDTRST_SEL_WDTRSTSEL(0) | \
> +				 CPG_WDTRST_SEL_WDTRSTSEL(1) | \
> +				 CPG_WDTRST_SEL_WDTRSTSEL(2))
> +
> +int r9a07g044_wdt_rst_setect(void __iomem *base)
> +{
Can be static.

Cheers,
Prabhakar

> +	writel((CPG_WDTRST_SEL_WDTRST << 16) | CPG_WDTRST_SEL_WDTRST,
> +	       base + CPG_WDTRST_SEL);
> +
> +	return 0;
> +}
> +
> +static const struct rzg2l_cpg_soc_operations r9a07g044_cpg_ops =3D {
> +	.wdt_rst_setect =3D r9a07g044_wdt_rst_setect,
> +};
> +
>  const struct rzg2l_cpg_info r9a07g044_cpg_info =3D {
> +	.ops =3D &r9a07g044_cpg_ops,
> +
>  	/* Core Clocks */
>  	.core_clks =3D r9a07g044_core_clks,
>  	.num_core_clks =3D ARRAY_SIZE(r9a07g044_core_clks),
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c
> index a77cb47b75e7..f9dfee14a33e 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -932,6 +932,12 @@ static int __init rzg2l_cpg_probe(struct platform_de=
vice *pdev)
>  	if (error)
>  		return error;
>=20
> +	if (info->ops && info->ops->wdt_rst_setect) {
> +		error =3D info->ops->wdt_rst_setect(priv->base);
> +		if (error)
> +			return error;
> +	}
> +
>  	return 0;
>  }
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-=
cpg.h
> index 484c7cee2629..e1b1497002ed 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -156,9 +156,20 @@ struct rzg2l_reset {
>  		.bit =3D (_bit) \
>  	}
>=20
> +/**
> + * struct rzg2l_cpg_soc_operations - SoC-specific CPG Operations
> + *
> + * @wdt_rst_setect: WDT reset selection
> + */
> +struct rzg2l_cpg_soc_operations {
> +	int (*wdt_rst_setect)(void __iomem *base); /* Platform specific WDT res=
et selection */
> +};
> +
>  /**
>   * struct rzg2l_cpg_info - SoC-specific CPG Description
>   *
> + * @ops: SoC-specific CPG Operations
> + *
>   * @core_clks: Array of Core Clock definitions
>   * @num_core_clks: Number of entries in core_clks[]
>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
> @@ -176,6 +187,9 @@ struct rzg2l_reset {
>   * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
>   */
>  struct rzg2l_cpg_info {
> +	/* CPG Operations */
> +	const struct rzg2l_cpg_soc_operations *ops;
> +
>  	/* Core Clocks */
>  	const struct cpg_core_clk *core_clks;
>  	unsigned int num_core_clks;
> --
> 2.17.1

