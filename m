Return-Path: <linux-watchdog+bounces-1828-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A647F974378
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Sep 2024 21:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 531A028C1A1
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Sep 2024 19:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D9F1A4E69;
	Tue, 10 Sep 2024 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bq5WxMU/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011006.outbound.protection.outlook.com [52.101.65.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BACF1A2567;
	Tue, 10 Sep 2024 19:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725996513; cv=fail; b=GltFJEh22k9tR11U1eoEjlH2xDadBjtpjZRmFpkc/TTmnCRv3AnZFTAPc46KHU1PnrfnWWm4GFxqM4EeyzVdgfxTbM1CZXjQdeEVc6YswaG2Gz4LgmmO8fj+NGRt9GKQNobTsj+mUhjtzksYfuGlPQWIuLuUPvM390VJp7pxJT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725996513; c=relaxed/simple;
	bh=8vrpMpWBGhigqtAgg2/7Vpgf/pZyXejXun5mMe5vzGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tP5kfWEYWZBG38L1wfwA0OVmrvPbvnauWNXKbavPW+ZaVV3NF5vtMrOaNY0xdXd4oq3I+XIEeo5j6sN93cUYbjbf+5rXcYRgti/3gSFUo2hN2prqkJ68HR93CsyrMzDqjYJvPnJckg/TGZH4O4WmtV0tbZkMe/ZzzENdGJrKwZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Bq5WxMU/; arc=fail smtp.client-ip=52.101.65.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EECVxh5Uxl2PJbPBPQZlBgEJR9V2gr/hlagh86Qg2LN3ooCduCecdTKhJrh5L6tIxCGcHuRXAruhaq4+wrcC5AVlJZgRiQqvxNPWkznZ2NzeRUyoxUiC4Mz0aTFr5i4a8cOYIHG2y1aPi+4HkRF4vLq169aBeiVcBW9EqnbAY/vASNmygPhU0onarHhLjnhQ4qLqWyiijaT03zDwPKRb5FXjH5IxsMBtt3OSLcx14gkrbeiCj07qFk6A9mRBbH8RJcl/xWfRufO9ppnsZgJdvb0x146FDVU8ZB5CHsQ2qE35FmW5KGEhXf00zzVBatojLkjQOLmaWXRcKseMgQdAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEhrMO9iaRYgUrPLPu45T0ywpP0vwz/I//mTkAMPp5I=;
 b=voKeB9Ok3u+2vyq8WmUd8XwIofmWKMkMw28YMZm3B8creisXf84wKjwwZJvvsmz+0RIfzfQylje/0qEPosJMMlBqBN4gC/lIgBrvQSCgR/xeH93WOdx6idSmTVxRwashrlN6ZwMks993EEgIv2p+jx1cPc+GMo/zIRM9TW70zk1/9bTTH9syWt/bhi6gf6tIl0zP9Iwhw4kyq7sX5QT0wQumYFl9/Nj9hQdCK1OF15bPjUTDKXr94NnFvxzqcxASq+6KwSK54MLxAXEly5/uO2WLsuMNsld3sgSq17s9Vk2KWk2MRV8VKCfpjrJ4ghP705MfwegOuxQutga8x9fwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEhrMO9iaRYgUrPLPu45T0ywpP0vwz/I//mTkAMPp5I=;
 b=Bq5WxMU/NWakqn0LFcrM2gEZeI9e5BmU351Miy3aACyux8E5HNwYA981pXLmWMSaraTXLftwTnvtiVnKixTVr1epK2TvDPMGLQwuELTiNyXbskyiSk9VoSyBbyv125F4dkp41kyUNpvIU2xekvY5KMduBpEjLF2DERWfoWC5i+fqPAH5XggQTXW8XFwyyblk1xwHUofiUkAasj2KXU1hOBPPiPy8EV0QZDXu0s7nAza0mrIZLhlgZrsdXMrEbyrJeJjX/hSf5waODN6gnzaxELO/zlJkwzVS7OBwyeqiHFr036rhJ8Y1T4NotXQAzXq5ER60ntUgStQOJn2JX840Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9491.eurprd04.prod.outlook.com (2603:10a6:102:2c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Tue, 10 Sep
 2024 19:28:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 19:28:27 +0000
Date: Tue, 10 Sep 2024 15:28:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux@roeck-us.net, s.hauer@pengutronix.de, shawnguo@kernel.org,
	wim@linux-watchdog.org, ye.li@nxp.com
Subject: Re: [PATCH v5 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
Message-ID: <ZuCd0xTZ29meorYy@lizhi-Precision-Tower-5810>
References: <20240730145610.2177627-1-Frank.Li@nxp.com>
 <ZtDvk02cvKCemYbN@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtDvk02cvKCemYbN@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b65f01-8a85-4410-8f69-08dcd1cebed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cdutn8ngsgMUHjREQyhnGqNFZMhiskYPHwe2MyXMcge6Sz3T338jQb+/Asfx?=
 =?us-ascii?Q?Ee+wLngxiMb4s2Z8HFExF2YMgRJmlc7a8xhzklkq16f1Txb54ZeU0yG+UMGp?=
 =?us-ascii?Q?3m33+YoEcQpBKLyFC0aa21Fz9Pgjs86QYPmTXWKVQs7IdIKSfPxdZctux0L3?=
 =?us-ascii?Q?c9TCqLaYoTETaEDLMhsUeC2HAVEfqeYo69pBRTnqlFQJ180vVqAXqG9oCgqf?=
 =?us-ascii?Q?etUWlKPBQvrUAHs7Sq0gjuxFv4dq09UEktiMbnS85O2AGwU+9MiLwsnW7N7n?=
 =?us-ascii?Q?Wok/dhlP6Sm+t/N/bFs1Y1CeSot9Ft26IKQ1ZDnn33z8sghRJ8HlScSyUL9u?=
 =?us-ascii?Q?i1pkAgJa3JxChPvJPzS7N08KXqF3aggTR+7a+AhnsR7DwRWeCaTdEtMedyfU?=
 =?us-ascii?Q?pLCCezzg7tfAiM80u3uy8NihT1YRSsw9uZSP/1QAhj/KiKXXIKr74AU6tlXv?=
 =?us-ascii?Q?kWrivAnY7Jro9KSrS8Vt6+8UnwvNA0XO0HFoMfhpGT20nGRyZPaWpTTeg6CH?=
 =?us-ascii?Q?0JM9MFqFYLQOvydJ4W3LjYGi7QRGyJLD04ENRwkpJOdLxa7Rnhn4FlDuHSry?=
 =?us-ascii?Q?srYoNsd29nt1e9vON1meXHdYIIBwgOlTwRfQiOgKlgoLkNu8D2k+5G7Gqw7G?=
 =?us-ascii?Q?67KKq1AwWHg0WewWVO+PceYe4u+eHgoT+NPVDAOsFW/XgatYQ7DaVYTcH0aC?=
 =?us-ascii?Q?+u4JJkVYb9oo+aTFoOq4KNRLJQf8piTtwP3FntAv+tcSpZ3WnzgbWe18XhjD?=
 =?us-ascii?Q?E3ZiHT1BVJvhFD4sxYVf4EThrurYhKQ30WGlulEnnk9ECgqntgxcKypoMKf4?=
 =?us-ascii?Q?kbcYCsKSu8lnCVbDBZtlcSDKF3b/ctksFmW5FhjzLWJ+xr0uFHm+VKj6oGJc?=
 =?us-ascii?Q?ttUXiY/DXzwCPaK4X9/6TBlnNMXel55ZCS2DuGtKR726PQum5e0hYebd3nCw?=
 =?us-ascii?Q?IMgNxNSaLVjeEmJWxxtQ16NPCEMvnrK3dQN9w05xd6pa69hBVxhBnWjCG30I?=
 =?us-ascii?Q?JAFKezGQ4yiDeges5kYWSo3mcAtLT/ABzgBElwMReAMlq30DkauDOtUOVbRK?=
 =?us-ascii?Q?wx/6Aa4mgMVW8nmqyq6DtoqUaU4aJB3xyyLPobCUePYjPOKRvnlIWZceBHXl?=
 =?us-ascii?Q?UcyE+c+Q/qn0cavozvbxb54HiET91O5hLju0T3OexZOAwfKGQ1YJqucPSs3r?=
 =?us-ascii?Q?z9z7VqdNUvQ9j4Ctc7eBW2oeQkfbSdMRA9i3MhDDlHPOd0Y3sWGfKiGkzLp6?=
 =?us-ascii?Q?J8kubrAjEaBSmiEYW+PqgZj8bseoAyXojN0mZxuiwzyLPeNqcQoZHH05xR+H?=
 =?us-ascii?Q?o34oMAcVp0N39UjW5KkXCWOR5sQONhGN2hjNxusHBIILWA944PKFSriZ9ZrP?=
 =?us-ascii?Q?y9gEdujZNRGwsKWY5oCRzVW4gG/4dtZYBm/KgDZWb0fGvZ1V7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BgcGQGImqbGsxA+wnnhV6sNWkLvZ7/wuw7qfn9aRznDXE55LssvLDhitU85m?=
 =?us-ascii?Q?gRmn2+mymf0pZzeqN+5KYAj1WrN+nwFH8DRF70R2rcdcfZl4XyYduwQbAZNP?=
 =?us-ascii?Q?px+x8GtjvmUF5C2GTlzffhRBFl16meaiBMx2TRy8Klcw08P60ckbvG+4ryuP?=
 =?us-ascii?Q?wQ854HbB/0yntb2Zk6A5s1f2EPsYsg1XzcfhXgXG2jIfphW7wnmXmMlrypyo?=
 =?us-ascii?Q?3T01YYSCHk3BKvZ1V79BQQYV5c10th7Y5qUYUD7rlnUmaaFGaSBdQvf9yOZu?=
 =?us-ascii?Q?uh16Iiwoqbz0QYKVV/aXR41VN3vdA5KTlcSwZqt3nixE1tLusuNrHw6XP8Wr?=
 =?us-ascii?Q?MHetq+79V0RyjAbhBNhVjHD90db1DZNlaFfGUs03GL1JsyNR84CAMiJ4VxCp?=
 =?us-ascii?Q?mu9WEHH2540TTW4TEZoKzlWEHx5ICtoIs2uBs9wxBl7c3OMdAAoBU0tdeWhw?=
 =?us-ascii?Q?PWrVYDv2fU5J4G6tENDd/JjVf97GkRpmujHxMWyv1h0//JqGbYgZUIUIlpFP?=
 =?us-ascii?Q?6h4QSyGmthuYQ/usdbOcOumdCu11G2rY7DaF/wU0ra9xZ7ltxZAn6JvIMve0?=
 =?us-ascii?Q?cKg3CboNcY4xj1BMVqKgoMtNhHp229SjXXPDv675t4hMUckiEyheQooyuHTZ?=
 =?us-ascii?Q?fFNjAHgXvviHYNOYXySuqzVfMlr85dfTHxFr6pbQM3mn7Heeqra4aXFyyXD6?=
 =?us-ascii?Q?B+7pvg/SPfoJc0NPKy9CecKPqX0pdV6W1swtPouB4D8ZsLU3dsLkq1+heFy0?=
 =?us-ascii?Q?rKzRrHN5uYr7ImgQDdQSvum6pNZikGngr8uxO/NkEB8XVM3WZnpcnQjzuQnA?=
 =?us-ascii?Q?bND49M9LIR8G9kWGP//cXtmMOCN0DT+QsRIfFCNkOsvWLDFqjqfg4V1CSRqj?=
 =?us-ascii?Q?ATQdGwsedSyGEqPGk9DkIRowzCI/kGyI9qJPawefuViPTYW7vWHrnECvfG2c?=
 =?us-ascii?Q?kDGlg9ysuTqWjI3pnz7h8CnXvW6JtqlC9rkmprwekUhZ6rgcOIF7sU3ZIo/E?=
 =?us-ascii?Q?jGSgTU5Z1JAwgtI4Bgqy9qNGeO32g2smUYPkRjDPJVm0aBYuI5HD9XB6TvqV?=
 =?us-ascii?Q?9QTmrnn7HVBXCWCdWUdxe1l+0TQVuHK+kMud/63PYoTg4WQQR/9nfYfP4gGh?=
 =?us-ascii?Q?I+WtxdeFKzSn+8PblLPuQP41WW9n8Z6hcGDG1nWrAR/VtOHpy8/Rr6QBRymM?=
 =?us-ascii?Q?KE/2eLykEOjTKQNOee+8jZHs79+wcUFQFLpYe6HrabjlfHeqsimkRaZjouJU?=
 =?us-ascii?Q?r/GQE6psPadzJCZuQfE4SIfn28jESkyRgLN3kBTs9uFiMw7srfhHbH9q1i9y?=
 =?us-ascii?Q?IRikuTRILYFas4X6H3+E6OHOHqFlSCjnCNBrzGzwmVTpKHukOzhjQF8zGe+z?=
 =?us-ascii?Q?WZodT+PYKqcIK7MbuYCSL/JxOWpY8necihlnv1H/QS4t1xRAPAA/nwQhBgMX?=
 =?us-ascii?Q?chNpacA5naEYeveX1x5oJVixHxhyuNo0zQleMd7Jw1Os028bUejVk61msj6M?=
 =?us-ascii?Q?vAxFceCMy0SKsvG/o3Dj9HE7qY2qcs2B3bdNYpgDmK4uqqYXTKviyTwylm5G?=
 =?us-ascii?Q?qkTcU10q9IrnnbfFPAk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b65f01-8a85-4410-8f69-08dcd1cebed3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:28:27.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89me+3xRFLHBby7QUZlXQ/KRCpjJJoYk5PLpzzA7mWtQsTm9N74zrxXdIZpx06IrKlPUkrpNxMiGoNGvUrTOYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9491

On Thu, Aug 29, 2024 at 06:00:51PM -0400, Frank Li wrote:
> On Tue, Jul 30, 2024 at 10:56:10AM -0400, Frank Li wrote:
> > Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
> > difference compatible string.
> >
> > i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
> > post_rcs_wait.
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > Reviewed-by: Ye Li <ye.li@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---

Wim Van Sebroeck:

	Could you please take care this patch?

Frank

>
> Ping?
>
> Frank
>
> > Change from v4 to v5
> > - move compatible string 8ulp under 7ulp
> > Chagne from v3 to v4:
> > - Go back to v2 according to Guenter's feedback
> > Change from v2 to v3:
> > - Set post_rcs_wait to false explicitly to maintain code consistency
> > - Add Guenter review tag.
> > Change from v1 to v2:
> > - Combine to one patch
> > ---
> >  drivers/watchdog/imx7ulp_wdt.c | 21 +++++++++------------
> >  1 file changed, 9 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> > index 94914a22daff7..0f13a30533574 100644
> > --- a/drivers/watchdog/imx7ulp_wdt.c
> > +++ b/drivers/watchdog/imx7ulp_wdt.c
> > @@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> >
> >  struct imx_wdt_hw_feature {
> >  	bool prescaler_enable;
> > +	bool post_rcs_wait;
> >  	u32 wdog_clock_rate;
> >  };
> >
> > @@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
> >  	struct watchdog_device wdd;
> >  	void __iomem *base;
> >  	struct clk *clk;
> > -	bool post_rcs_wait;
> >  	bool ext_reset;
> >  	const struct imx_wdt_hw_feature *hw;
> >  };
> > @@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
> >  		ret = -ETIMEDOUT;
> >
> >  	/* Wait 2.5 clocks after RCS done */
> > -	if (wdt->post_rcs_wait)
> > +	if (wdt->hw->post_rcs_wait)
> >  		usleep_range(wait_min, wait_min + 2000);
> >
> >  	return ret;
> > @@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
> >  	/* The WDOG may need to do external reset through dedicated pin */
> >  	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
> >
> > -	imx7ulp_wdt->post_rcs_wait = true;
> > -	if (of_device_is_compatible(dev->of_node,
> > -				    "fsl,imx8ulp-wdt")) {
> > -		dev_info(dev, "imx8ulp wdt probe\n");
> > -		imx7ulp_wdt->post_rcs_wait = false;
> > -	} else {
> > -		dev_info(dev, "imx7ulp wdt probe\n");
> > -	}
> > -
> >  	wdog = &imx7ulp_wdt->wdd;
> >  	wdog->info = &imx7ulp_wdt_info;
> >  	wdog->ops = &imx7ulp_wdt_ops;
> > @@ -403,6 +394,12 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
> >  static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
> >  	.prescaler_enable = false,
> >  	.wdog_clock_rate = 1000,
> > +	.post_rcs_wait = true,
> > +};
> > +
> > +static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
> > +	.prescaler_enable = false,
> > +	.wdog_clock_rate = 1000,
> >  };
> >
> >  static const struct imx_wdt_hw_feature imx93_wdt_hw = {
> > @@ -411,8 +408,8 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
> >  };
> >
> >  static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> > -	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
> >  	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
> > +	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
> >  	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
> >  	{ /* sentinel */ }
> >  };
> > --
> > 2.34.1
> >

