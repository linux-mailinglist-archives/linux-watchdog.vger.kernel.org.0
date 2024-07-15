Return-Path: <linux-watchdog+bounces-1389-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF41931A5E
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 20:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 503EC1C2115A
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 18:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2EA134AB;
	Mon, 15 Jul 2024 18:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BuyXarnU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013034.outbound.protection.outlook.com [52.101.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC6139CF6;
	Mon, 15 Jul 2024 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721068505; cv=fail; b=nmrxCToOEsXEqTBaP98iERhBl751qzeHaPQwUohHKok8UuVkmMtCEsUzChNULLl7dM10bWJ342KyE6fznWBxT0gdjz4yKwsg+8oe4auLp9IT/L9L1WM1cJ2LFDg2fhgaQKu8oMPvC54ve9ZnEHIgSdZom0WhlH14leUYyKcMD8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721068505; c=relaxed/simple;
	bh=nYOETJPAgSFc19KZGttZ876Z4EEt7HpFIDhjvEo5Lck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vic2DP+hpmZyt0fU5+8PD/w8jgna/d1KrICAlgXmQL4hU+c28jQr4It2RET+l5uTwkDsSEJjEjK5wM3QuEHSZdYq3YMm2oSYVDI9UpcPZyYVZ/yq3XZXxdAu9a9hyAlw+kk059j27uNveQonTcFpbakNvCM6HrzT9n+SH2imD/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=BuyXarnU; arc=fail smtp.client-ip=52.101.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX2btCUh7rYplzPFX/icBQoYbpOrA/X3blxXTLW4zMQvK/1irqv/8J0JuhDVnFhvDrcyZC+l6yxf496UjOQbZPwnHgojtVE4ZbHvYkBynV3Z9QboZaBfFdHSv09Mo3et3Z6Ft3/QmEjP/VhTjbHPNrg7YJ16jL4RxqWFTvrx2IVv0qiY/SJC6VXZ5u71KL1D+2c8rmijAwuDTeHOlwXspD2wqfVOn+dtazpDpnJBV3t/vCAIgseVmHMw+66/2VGmUCIitY0A4kEg28jA7nf3Q5e/k3h3l8Jmal0yhBT63J8kaJ0yV7tl4ZrLbF/aRh2eADOHoJaV7+Mwo72TdoEaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIPRV72tob20jyAQOd+qf6uNwJzQ+eNPvwVLxqt2Nj8=;
 b=gxJ2Cw3x1J5WAJH9FWkd54mdar8zG5lKU15nxGsHiOBQERyuQ14B6rIQvKBPoRU7r85Y8QPwQUL8Tb0umfhQ44envvO9REFbMWO+Z0QD8ESzj+sQ6BB36titJDk6VPksNMO18Fw1q8m+ha4MDGoq74PqAuO+o2u+H7I3eVcJZ+jfXFXqFubSO+KzbelWK1zLza/nv2lKELKGsz+d+XQWn1TLAmiol8B/auXwS/kStkftZtX9kBGUZ6JowiKwGVL+Up4wnU4ArFOcZD7+Fg0R7awecg/rzBp/5vO6bFZ+k0VPbnRQJ9Q89/+g04DG5uyYWyjxG/VIWUP29OUWGcOMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIPRV72tob20jyAQOd+qf6uNwJzQ+eNPvwVLxqt2Nj8=;
 b=BuyXarnU0Nj3IAuPU1hPA9hMJAhqG4UDm4D+O23joTqcMkVPym/zVOjLsJsrqEghuZ1zKhLiNZQ2Of+WZanmADVzlXZQkasoBywscVKt23Q6mOOO3R37pBy9otVCHK/DuulhW2/rac6vo0V7vzvLj5BWAGA2oel6MFvAncinOec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10401.eurprd04.prod.outlook.com (2603:10a6:10:55e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 18:34:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 18:34:59 +0000
Date: Mon, 15 Jul 2024 14:34:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org,
	ye.li@nxp.com
Subject: Re: [PATCH v3 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
Message-ID: <ZpVryrvsypzFrbma@lizhi-Precision-Tower-5810>
References: <20240715170717.2490688-1-Frank.Li@nxp.com>
 <3ae98ea1-23a4-4e0f-9a1c-62eed84b42ef@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ae98ea1-23a4-4e0f-9a1c-62eed84b42ef@roeck-us.net>
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10401:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cbad773-c71b-420a-8b51-08dca4fcd52c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k0cyj3H7hpY88QgmxlQJ7H2yC2WuKU5sseh34ZxRDbqRS6mmQPRnRbwYdslE?=
 =?us-ascii?Q?b6AWCHZVFZySHM6VAPe9UeY3E9ghCcEJHDn+x51UQg2BZkLcg7K4G6l1Y1ui?=
 =?us-ascii?Q?BTrhlpw4O0xavllUw7Hx56U9dsEQAb+rYqPKsflvHVIpq/odWrkwz9YIqXSE?=
 =?us-ascii?Q?Ffc1Dasfmh69V1X1jPnPGVXbTq9MxmUTn+LbuoL9ZaD6adrQD3XGTjP1mzEO?=
 =?us-ascii?Q?S+lxwrdjjTm8liel0/q/x3rB8/hlWWTzBJ6X83+Wne5qqkQOwyhLGloX1uTD?=
 =?us-ascii?Q?jqXWtwzpphcdJNb2JVkSTG/6kpL35Cg9sFT6loCqKmR3mSX4Cfi2xUYptdUZ?=
 =?us-ascii?Q?82YAwDcULGRzlAIi4+tthf/trzqQKl4QUkQf1bvTDSR9B/h0SFXeSfAPPEaF?=
 =?us-ascii?Q?aNs5OSja8RwAlqCTRAmiDRXH9JfO6PWujt7BU0nXLaSdA/PBCnFLE30fZdsQ?=
 =?us-ascii?Q?PAODxZLbczZurqvVJXWXe5WVElNT8jX8wekM77Ie82QNfqbqvfPExy6k9fUZ?=
 =?us-ascii?Q?D8xiejP7ZHNgn+myt99txdLAMqA/Rznzzuy2cQZyaL2DsI6vuET7AI3xnWL4?=
 =?us-ascii?Q?NbJ3x8XU0rmiLtPaLMIs6web9T4O4a8JR20ssswHr0Qz4rYMMTi1vBdPdMD3?=
 =?us-ascii?Q?fDOt5DD2n5yJ7wtElxu1nUgrcN3mYOMou7W8YUoLg7Qm9kmACj2gNXK7cgah?=
 =?us-ascii?Q?JqLkM+wxc1g7/3cXeJG81xEwP1ADwU2ZmuyVRN/qX7m7kEmXVzCUi07JYr5i?=
 =?us-ascii?Q?IWZpLyUFrgLfEVEgUedpCC61aFSeaaf+QhZ0RBApELmCK8GDNSjEpa8faRki?=
 =?us-ascii?Q?t8h1TacqrcBZCPMzv0kCLwicB2MYWV8Zi5RTtPLO/cEFBIWSlg1ykZhsRqGw?=
 =?us-ascii?Q?jL79GPga41/1iaTmOQYm0NUtkVsabiT/bMOzhPjBptGLlYHn9K6GFgHNCnW0?=
 =?us-ascii?Q?ctDvxNGwA64t1rNAqAj3JIM7ekoGzYWh5fuHG2AXTYqnZalRMHRbSXF7Yi45?=
 =?us-ascii?Q?AW7qBVMTFgz5ivOZY03M8T5sKyuZqBWMSpgh5xZ+p1dSDEySTOtJN5LlPN69?=
 =?us-ascii?Q?ZRZ7ajmXJvr/K8i/aqDZb4pJAZ4bo6W9VJOtdi2L9aFTJUhp24PXPniss19u?=
 =?us-ascii?Q?c1SBdC/orkWyOGQMbFstPaoBTcpB2gQl6oE8SqGr4sef7cYSqTMY3MVRj88E?=
 =?us-ascii?Q?yl3Ikl9e5iaal0Chj+Xy6prOdapi+LV2M9XbndkIr+PiEi3b18j4UqDhj9eC?=
 =?us-ascii?Q?DqwgOupRbPTZfWHHHe3v8JQjlW6KJiszuL9R9LP7mtVlsTL4R0prDqVENI18?=
 =?us-ascii?Q?7etvfbhWDXI1YR7NLtpkQ+UnW7mPq/LfBOopGvJgqPrjffLsqkxD328ijeba?=
 =?us-ascii?Q?0ZaMob/GZRLXM8XzWiYCfCvOuBs5d4CAvQp6qwrJa8XU8eHSKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rnpXS7NewAJwqqBNXUiylW5AVNxlwmVzK0QZ2lJN6NIfxyR78k0dubMgpeNR?=
 =?us-ascii?Q?uWrxhjBqbGjW06KCoMaBe5FRU+Xwfd/6Kv4zaqXVgnwLxVgpcjxYLt1DZYS9?=
 =?us-ascii?Q?BL2bdHhe7rHWjCTItCr5so3mWRpNRAOgMvjRlwxOCguYhNlaDczfWZlN42eh?=
 =?us-ascii?Q?+xXrEYIG6R/90mOoza1ZIGSg8HBWBhxGM75cX78CT+MYJBVEQMS3CPNj/M98?=
 =?us-ascii?Q?4vNWrPGBvB4ucAoOCxIAVIMFxftJNLKNC0p5OzhR9I+GFBZ9nXFEnzWghZoA?=
 =?us-ascii?Q?z1+1RD3B4kmv0G7rwtNOS+MuFYE0/5lcDiCK51je+QUGq1mR5GXAeJxlqxGe?=
 =?us-ascii?Q?8RUPLY+xJDiKxPCY65PFGyZRW4oBSVkHxqb9db0HWD6Rg45AAn5hZmraZ2GR?=
 =?us-ascii?Q?gYDEhmY3TdE6H5FCpgAx1iNtrSTjJ3KOvsnV6RZkcniIPTIlw1hg72LX1hVS?=
 =?us-ascii?Q?2yKEnVRKal6Fb7z/3bs0AQkA1JkCqKOT0ZAhfBusdstE7fquaHz8pNNY+aB0?=
 =?us-ascii?Q?zdv/Ng/XleYOx7WyXNh0Wt7Rj+wCHnNoXl2RNC1xrcSyoObP9w6Y6OkDUgOv?=
 =?us-ascii?Q?wH+rXL/rftOpjPGxcERLHFmkQVAPd1CMyiYJQ5974aNnjEG8iNPF6f9p5lJC?=
 =?us-ascii?Q?fBNRBtKngpd1oElbmY+lIHuJP2t2IMXrE9Nb+ZVZkyNMDn/jcpaeslYMzAkJ?=
 =?us-ascii?Q?ttjoIuQS7PMSnoosF/tZBgjwJkPOMgUOXQhWWEZ5CLjiBh2g1SUTSgE8hh9I?=
 =?us-ascii?Q?Un1f3P703vUevxRTl3z+gIhvzIcEwrl7xPtwKEyvoHJeP4fOPprP17FbEQiW?=
 =?us-ascii?Q?Q0m5fuOITVBBmYIAo5Oc/VIGWeMCsRBON7fxxfJeTAUC2uIFyielvPFrpCTm?=
 =?us-ascii?Q?OkkeOnWhrkVfTAFiffxXpa0CCDCXHchDD6U5o2UKlSnzOuU7ocZwtjkOvLzg?=
 =?us-ascii?Q?jNZKOm0RLCRRzwnp1gknUG1W4eM2Ps83lFjYdaObHdHcFU2yQRWCKHkQLyyH?=
 =?us-ascii?Q?tj3uQTwSyt44vcOgOxNB3HD0gcWd5ZdbcOwRIYxZJtNOMIEbST2FdW3KMmZm?=
 =?us-ascii?Q?hVOSkfJSKic3zGkK7lHNyZRBTtsciyTF+7ketdHd44r1fPr7fOTbpTWxRelL?=
 =?us-ascii?Q?u8ahxBdYALuwUTK2SgWq+10/j0r/yPHUcIhGkQnacgg+enXEGvZa0uOsZJiH?=
 =?us-ascii?Q?+VmbHY3rGpT7Dc2oJr5smPOX0X07OEQXPpfnvIe1QEVUGoaIlnYRJUEx/qiq?=
 =?us-ascii?Q?ZHNkB1hjm9xPUnAbnUomnUMBQKFQbH6ZzEclp1o7Jix43BnrYvZZqyYtsLKC?=
 =?us-ascii?Q?sMSfjAOoR8S+Ts75WcBNR4g+9WP1F21sSVcJ50FfJOgsnT+XjU/aRXWthGYV?=
 =?us-ascii?Q?whCfYHLfI1AXgxN/Jm4Y+dUZWNbX9DbhMur7pnEY+Zb8r3EKGp01JAiEU01w?=
 =?us-ascii?Q?hYXs3zssT9z5iDSBPcMNL32HbpK7FlUFZKyRzQBcO8U5IGoJveOOugK/CSbO?=
 =?us-ascii?Q?8CdGcWeHj0yWCjwjJEkXQpiLEfseLcKjBBnGf3aYiUmamslI0ELaFuXe3fOl?=
 =?us-ascii?Q?X0Nr4Nj7dCEn7Z/X6s03OudzQsYH3tBMByYaBGRI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbad773-c71b-420a-8b51-08dca4fcd52c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 18:34:59.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YV8lYLtwwXnqoUGO+6cthsVPDdRCbxGfFU/RvUKrTNUCAeiFGOAQhusxlbdnR5gYqrKXByW7ru+D7r3MDeO6Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10401

On Mon, Jul 15, 2024 at 11:01:04AM -0700, Guenter Roeck wrote:
> On 7/15/24 10:07, Frank Li wrote:
> > Move post_rcs_wait into struct imx_wdt_hw_feature to simplify code logic
> > for different compatible strings
> > 
> > i.MX93 and i.MX8ULP watchdog do not need to wait 2.5 clocks after RCS is
> > done. Set post_rcs_wait to false explicitly to maintain code consistency.
> > 
> 
> Why ? That is not necessary and typically frowned upon for static variables.

Some maintainer in other subsystem like explicity set to false to read code
easily even though not necessary for static variable espcially there are
already one which set to false.

I am fine for each ways. You are free to pick up v2 instead of v3 if you
don't like v3's change.

Frank

> 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Please drop. I did not approve this change.
> 
> Guenter
> 
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > Reviewed-by: Ye Li <ye.li@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change from v2 to v3
> > - Set post_rcs_wait to false explicitly to maintain code consistency
> > - Add Guenter review tag.
> > Change from v1 to v2
> > - Combine to one patch
> > ---
> >   drivers/watchdog/imx7ulp_wdt.c | 23 +++++++++++------------
> >   1 file changed, 11 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> > index 94914a22daff7..a4aa02f388b15 100644
> > --- a/drivers/watchdog/imx7ulp_wdt.c
> > +++ b/drivers/watchdog/imx7ulp_wdt.c
> > @@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> >   struct imx_wdt_hw_feature {
> >   	bool prescaler_enable;
> > +	bool post_rcs_wait;
> >   	u32 wdog_clock_rate;
> >   };
> > @@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
> >   	struct watchdog_device wdd;
> >   	void __iomem *base;
> >   	struct clk *clk;
> > -	bool post_rcs_wait;
> >   	bool ext_reset;
> >   	const struct imx_wdt_hw_feature *hw;
> >   };
> > @@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
> >   		ret = -ETIMEDOUT;
> >   	/* Wait 2.5 clocks after RCS done */
> > -	if (wdt->post_rcs_wait)
> > +	if (wdt->hw->post_rcs_wait)
> >   		usleep_range(wait_min, wait_min + 2000);
> >   	return ret;
> > @@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
> >   	/* The WDOG may need to do external reset through dedicated pin */
> >   	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
> > -	imx7ulp_wdt->post_rcs_wait = true;
> > -	if (of_device_is_compatible(dev->of_node,
> > -				    "fsl,imx8ulp-wdt")) {
> > -		dev_info(dev, "imx8ulp wdt probe\n");
> > -		imx7ulp_wdt->post_rcs_wait = false;
> > -	} else {
> > -		dev_info(dev, "imx7ulp wdt probe\n");
> > -	}
> > -
> >   	wdog = &imx7ulp_wdt->wdd;
> >   	wdog->info = &imx7ulp_wdt_info;
> >   	wdog->ops = &imx7ulp_wdt_ops;
> > @@ -402,16 +393,24 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
> >   static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
> >   	.prescaler_enable = false,
> > +	.post_rcs_wait = true,
> > +	.wdog_clock_rate = 1000,
> > +};
> > +
> > +static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
> > +	.prescaler_enable = false,
> > +	.post_rcs_wait = false,
> >   	.wdog_clock_rate = 1000,
> >   };
> >   static const struct imx_wdt_hw_feature imx93_wdt_hw = {
> >   	.prescaler_enable = true,
> > +	.post_rcs_wait = false,
> >   	.wdog_clock_rate = 125,
> >   };
> >   static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> > -	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
> > +	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
> >   	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
> >   	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
> >   	{ /* sentinel */ }
> 

