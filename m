Return-Path: <linux-watchdog+bounces-1363-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBDE92F38D
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 03:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE6821F2362A
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 01:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0868C1F;
	Fri, 12 Jul 2024 01:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GkxlGkpt"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D3079DE;
	Fri, 12 Jul 2024 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720748410; cv=fail; b=DdewCm2h3TxHEikKiY9v2TY0aCB9bqmMIx8SUm8bhJTNMkLMI1tNh1mVhl9+VVTk1ynQVygXV+aWecxXUwXI4iiTBkTxfxL1VK9sXz2F5GseCetqH6XsWAcJHWIiwQF45bBgxKRt92deTm+E1IjysPQBpjbqEHbQ2gRoJqIGl9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720748410; c=relaxed/simple;
	bh=R0Sh3sQ6I/P7YzhsEza7eajEp53mfd0YJ0s3jRbJgQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I4x55h8PmuFqEf3etoS1rQTJAtlBehXHRMQEPSvkJdU+QLaoXEWfBpzGM7KGzpPHRHCQM7dC1GM5rehbKE/b+83KWsCM2zydpXCuMqF+Lb1mGMIff9R01aP4eA2f7KwBVpfTyhq1qH5NpCDYqUBpDu3zfGrxKqDmd94WYID0nwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=GkxlGkpt; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRzprKQ9mMK5WC1TQIUwIBirClDy+14lYvj/mlM1Lj0amEqyDdBTNRkb13jPoj5+sR6U5nWxtG90lQVOLwPoYxOxoewucLGnC5UlSicdJ6Jh/nX/rVWkOJBcBW/9i0RBsE3W+vD20p6sKCf01PtfXogCKDCQi0z5lrFlbFP5myTAzpNlxTx5rAtRGykJKb8pC9CVapJAEWh3iptKJa3LQMt5HArjTXgPExkYTnm/d2cNoIDWIiEMe2tKsZYOomBQ9jnLZ/vFYgKkX7aKCSu28Ol6kLbG+FwZ2IX8fgicmA+qChPeO2C2zXyzudXDxvwYLdBk6HlGOdeoQk4x74D6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS5xjkp58kX+MqYSi8+Oiej7rAh7TDJ1rybAIkh1VmM=;
 b=UdXyMl/7FOP71ad8I3oxOWdcrICkyYQ5v8gyGx0IYmwWEGtB4Cj/20nzmbwAqNzHZOiJUP41GyEfgkZ8p7a9He3AW7CIZfDBpMgE6BFVQcY8BTpqhlpC8oWb/1VSi29XNt9nXVbpT3x3pSR79frTyDQgV64GRPtJs4NFykonrHhQp/JX8g3I8tpbJUlx3s5h3DInvYcjE9nstqZJ20aWxMSZKmF7ylom6UuvrebBgN/4KAJ4meiwgkbBYiAnXjPa2Imzi6XpJhYCBvnddmdez1L3wwYYZXf29rN8Mq958p85T71knAWeVdoyJDQ94kZJAL4ykzCUEupcnPekpVcHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS5xjkp58kX+MqYSi8+Oiej7rAh7TDJ1rybAIkh1VmM=;
 b=GkxlGkptxzj8R50lEd8gDkgoErhVrckcXLQsBw54GtpF6pYF7yRE4GOchfOSjVcW9ouZj8dktwBr5yRuvtTWEqpnl6WqbZjvpAiyG2GWR6uHy55mioCTOxF3WUHyW5WylVl4OWiBj80YpYejZQudRXNicnSnFgK0F2vNw943iu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PR3PR04MB7337.eurprd04.prod.outlook.com (2603:10a6:102:81::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 01:40:05 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 01:40:05 +0000
Date: Thu, 11 Jul 2024 21:39:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ye Li <ye.li@nxp.com>,
	Alice Guo <alice.guo@nxp.com>
Subject: Re: [PATCH 2/2] watchdog: imx7ulp_wdt: needn't wait 2.5 clocks after
 RCS is done for iMX93
Message-ID: <ZpCJZZNDeTgi7Lzy@lizhi-Precision-Tower-5810>
References: <20240711-wdt-v1-0-8955a9e05ba0@nxp.com>
 <20240711-wdt-v1-2-8955a9e05ba0@nxp.com>
 <696425a1-8e71-464f-9fe7-b965452b9d84@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <696425a1-8e71-464f-9fe7-b965452b9d84@roeck-us.net>
X-ClientProxiedBy: BYAPR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::19) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PR3PR04MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a95327d-03a3-4ece-9864-08dca2138ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F6/Uo3oDXZIeqylgorycmMjwFNCSf2lo41xsDifdnUVHvqCkpA9a5CIaVcuo?=
 =?us-ascii?Q?Hn0hEYxxNZ8ufT70mKH/d5KoWw63b1ngIZyRQNDCp0UnWE/RJoQnFGMS9DEE?=
 =?us-ascii?Q?YkYkXclqLMn8kmWTHDr32JZBK3q85e1la5U7+ovWOqEV8zgt+rvmWQU/5hyq?=
 =?us-ascii?Q?erZgoGivUaQ/VCZU1kxK0aaGj714V/i12KhUycAOPJ9T+87itNbrwmiD5D2u?=
 =?us-ascii?Q?jmt+y3UT1yFqeSol+PLPutcikFBl0KLlFxVsleiQjl8R+WkFRFJSd7F6P+wT?=
 =?us-ascii?Q?8+pW4pzhwX5qBdfFXZr+QZoqPXB/z1wyMhJLDn07VKkDCObTTJtqBm7gFqz5?=
 =?us-ascii?Q?pNGju4CjYU6BNj7SukrpbpHsoc7I1sHyIP2H015UOuns6sg6RoBqmI41IVbs?=
 =?us-ascii?Q?z/oT55fMzggylq6ChGXGbPQdFq9virIyAXm7WM9Qf3z3jtJlYdsDlOJUXkXr?=
 =?us-ascii?Q?bdUBjJZXYVY8n1frbTnXewjN29nxpDDa8PjHWW2eCfzpwIUPLLHf3YtsqxXK?=
 =?us-ascii?Q?vG1fqHccxnHZ4yEzGcMATy1zQGi4jdws7O5vyGeb6LlKRok4wQhqzDR4setm?=
 =?us-ascii?Q?V/F+ptCPdMbGpfOBjhzkK3mDnegITn6YmJ9wlQwwptAVSHdPJKD1U/wfRrTs?=
 =?us-ascii?Q?etzSKt9yIFxXM/Wa0MQHmlOb+DouYqulc8maJvsw/Me1Cs5Q/dIwFMd/VIKb?=
 =?us-ascii?Q?sA6+CeStQlTmk6UxEdbavQNF1e9XfrMU0/kuDQyyynQ8eVYWWZ2HzLLK0nTd?=
 =?us-ascii?Q?lsnq5FeOmntM6BepryPlw8mC7W+OMRYiqUbls3E6UfmBWRv4uZMts4tEJ1GW?=
 =?us-ascii?Q?9dwPVnPSFkitp3CaBAbTJdwqZveJ6CWV83xIs0AVQ5y9ebO+f755c5yGogjW?=
 =?us-ascii?Q?LUCqNiMl3rO93S/oAFfXdBzmdJiFE2oqLfitgHd2ZEuYyEXbDDe69arE01Q0?=
 =?us-ascii?Q?Imq6LzRVx51cUxPQA91d8yBbv6iXtu2u0gR/QBXr5TklTlyplTplzeexshMy?=
 =?us-ascii?Q?qgw03LyepYzFLVvD1+DBulycut8s0EmAl1m33stJzJdBZDBymNHUt4YncGB2?=
 =?us-ascii?Q?hUT4fpMgtX68fGo0ZXH1wxCA3dx9HROh49HsOncKjeyhjCTu/p9bEpZ95kzw?=
 =?us-ascii?Q?d7HNBeZvaofCF/Kij+bDZHv+jaspFNqe1H50fKC5cIMdLLtlSYIV593Q+5zJ?=
 =?us-ascii?Q?lwa9enpWc4urZO4M1Wz1bVYoV75SlmcbpNMzAvZmllSy8Z71N8mqjlDvYmBF?=
 =?us-ascii?Q?tjshkFr5gnwwdG2q0i+PTH7rGkmv3cKQzAOVtnSIbT5UGvMUtg/DTGsGxqUy?=
 =?us-ascii?Q?RaB23+yyABvu1B5i5T1YKY/hNGwWdhy8sH2kf4WURvBhprkM1dJdjNjaqHd3?=
 =?us-ascii?Q?/QP0aNlaqRzrK88tWqs/MbGF3t3YwrmNkBsO7eriCgDhiNnT3w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XbCfzD1Z8WYDImqDpc10BLdSc/Bgy00LW9Qngr8HwhefWGvirgmw+vYBVbhL?=
 =?us-ascii?Q?/nE18UoiVAYA9G21V8rB7iXWa06PprME2tAvEI5qdCNSZJozUWAlSJG1FK3s?=
 =?us-ascii?Q?uUFx0moyyFF7i0bLcDoFBenV1sod6ptWuNvMBOnHDV+Y1JBr5tLXeh2ACblB?=
 =?us-ascii?Q?hWrTBNy3OByMWKrZhkeWnHElnppZh0x6weUUzzmr5Q4NaBgT2snp2Y1vSUK6?=
 =?us-ascii?Q?YaWBLAJiAWBcTeluOB20ztHWiIZvy5xwWoeaPWoJk31bzOrOy6+oRQMwNMOh?=
 =?us-ascii?Q?dM6jpgh3MNnkG5yvsfF+Or0vr6CiOb7CeioGflq1Te8VMW23gF8v/ekZuQjH?=
 =?us-ascii?Q?ZC/rGgXnrYVyd+bq1T4EJY2RQsgWjR8vkj5FkWqwB/udDmI/zI5JeEY6O8MW?=
 =?us-ascii?Q?Vwz0Q7dlQ4r8ADxu0HQMWTxYxJxsKcDmCZ7frWOaB0ZxbiJw0Q+sYE/WSks/?=
 =?us-ascii?Q?u5AcJ+ui1ip/s/AAEbJcl7s7hZCjCaykSB+yzc5l/k9hrLCLpi7FiUlNR7C7?=
 =?us-ascii?Q?CmFWUdN5vgEhvEwORi9yyuAYO2VkFrAbJVxfZEPgkyhTBbNrLbC/67qQkLTm?=
 =?us-ascii?Q?OVX9SPn8bmHkV2zcaAN0qsM+FXyAE2ZazCSAjtHb50wBBGAQB+rwVh3ozr/l?=
 =?us-ascii?Q?ntN6+EcnE2lyG2l96WZwluK48/YScxKV4mGxLqFwPo1M0w7A+XNMVxAmDaRL?=
 =?us-ascii?Q?SXYCIw3K7b+TEvM0ed1RGrha1o4KX7ad3T4I9Z1BmptH3Uxqtqyao976rUvv?=
 =?us-ascii?Q?/r/upMYp3IrRtzp/V5Ze/JE2q/B82HGrA3gwnqMkojkvYATtpxxfspWazAzy?=
 =?us-ascii?Q?Dqak5bX2mxLB4k/KqSdYxCQAjwVi3FYodCPJUYB+0EVpaq9YkdDQtwRc0awa?=
 =?us-ascii?Q?9dJK4WpQWhIk9NBdZTU6gC7xqHGXdmYiYNGyCVjtT8dpD7v02cA5nGRQyeNo?=
 =?us-ascii?Q?x/m8TbErFcEDK8eGmTyeS+VGeQr0MRkaSYckaqEUbEJfeaaL3P41vCWaZRpx?=
 =?us-ascii?Q?VYoiSKlyJgtKD/G/gIu+pKlQ6ZauYKHtzvQ4/PPaRg6lKnRUi8+Q8xxUvv/l?=
 =?us-ascii?Q?ToETKJhelecpKwCAXHbPorBhRZdqWv5F2cq4Mdi5M9o3YwjhekWJBBuz1n/f?=
 =?us-ascii?Q?dDQTv2uBW6D1HqxGJT/mPQFkRfRAXCPiw+g0IUgQyPkZtLXzFRvqmIgQEXJA?=
 =?us-ascii?Q?AI7vWW9f4ZgYpvhgyCfzb+ENZ9vIyc6uRjqUI+YnhaD3AKUKK4/dYPUvb2ZP?=
 =?us-ascii?Q?GTMCo+s0PLpuX9O2N3wwnFKt2QpRJ0X3Bq42JnBUJj+cDBhBOr+QRyT2vInv?=
 =?us-ascii?Q?DElswgHMc7yfd7r77cWtBzUK3GlJvwEXRwDfHoOJmbRbW3L7cHKPwtn3niqP?=
 =?us-ascii?Q?RLV68c0TH8wbKFm23KE2Pc06vIRcif66yVg8s36jUqIk7+6Bkoftv0tM1soA?=
 =?us-ascii?Q?rtPL7tDrw/77TMXLan5qe54SGmpaooSrcI2OC/plesyN+sr2rZUs4+GGLcnj?=
 =?us-ascii?Q?lAi0HC4s7/1rFck5bVYgVtWNq4/xU2jP+R+C06Lnj8f2j21HZnB1MHgxhnXB?=
 =?us-ascii?Q?l2ws6eQCqntAxxLejeA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a95327d-03a3-4ece-9864-08dca2138ceb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 01:40:05.1724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7emo6yVeSRf53Wj4RYX0SNlq0sb+7nGjAxozdKvep+6HNxodD/4/QkfSTHWYoHSaracrBjU4RqrmD46EFdPmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7337

On Thu, Jul 11, 2024 at 03:55:52PM -0700, Guenter Roeck wrote:
> On 7/11/24 15:41, Frank Li wrote:
> > From: Alice Guo <alice.guo@nxp.com>
> > 
> > i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So set
> > post_rcs_wait to false for "fsl,imx93-wdt".
> > 
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > Reviewed-by: Ye Li <ye.li@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   drivers/watchdog/imx7ulp_wdt.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> > index 904b9f1873856..3a75a6f98f8f0 100644
> > --- a/drivers/watchdog/imx7ulp_wdt.c
> > +++ b/drivers/watchdog/imx7ulp_wdt.c
> > @@ -405,7 +405,6 @@ static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
> >   static const struct imx_wdt_hw_feature imx93_wdt_hw = {
> >   	.prescaler_enable = true,
> >   	.wdog_clock_rate = 125,
> > -	.post_rcs_wait = true,
> >   };
> >   static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
> > 
> Introducing that flag in the previous patch just to remove it here doesn't
> make sense to me, sorry.

Some maintainer want create function equal patch first if just code
restructure/re-originzed. Then add additional change base on it.

Of course, I can squash to one if you like.

Frank
 
> 
> What the two changes do together is to disable post_rcs_wait for iMX93.
> That is a single logical change, and it can and should be done in a
> single patch. If you do that by moving the flag into imx_wdt_hw_feature
> or by adding another of_device_is_compatible() is your call.
> 
> Guenter
> 

