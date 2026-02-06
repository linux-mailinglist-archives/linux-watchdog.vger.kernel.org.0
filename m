Return-Path: <linux-watchdog+bounces-4911-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H35OS0bhmlNJwQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4911-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 06 Feb 2026 17:47:41 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB93100834
	for <lists+linux-watchdog@lfdr.de>; Fri, 06 Feb 2026 17:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5DDA3003E8E
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Feb 2026 16:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C473112C2;
	Fri,  6 Feb 2026 16:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LSFTaGhG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E930ACEE;
	Fri,  6 Feb 2026 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770396144; cv=fail; b=aTEDLIgjVPWK6XfkAH4xQAx9hP+2xTvIgljTa51S8ZOU9si7LUCwfEHNOriHI34dkFetTNYdhZzoWU2fJZYFvPCurAWNybst5jnBFPaAG+xebElOczSEvY4GgDm46bRh1mbK+39uxIfU88v7vbf9r7UAZvD1ZpFCW0gPphv75Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770396144; c=relaxed/simple;
	bh=Y2PbCh5He3SWguiuMVfYK0Is0q3dgvy8rpsvmJEumfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fe7/dUr0G6YhO8MkMtjiEReOFzDB/+EsismahSU5HGRj6hnCnqn824SvQxf4sm2SQb+0Mpgc5aYhwuID+KuZXBZAZXjYTnzLt80Wej9ru91WAi9TVBKJUiSBOjuhm96b/e2TDShag7DSfVtQ3Ox4s/YctyoGePuZd+ICzQnLVy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LSFTaGhG; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4yEOPhB8+cwLk5iL3GpEYGfF8SRgkvo7tCtrGq0YT4V8dPSJ8dY6UmGc9wQBRmUWD7Eli1yVvAxutUfrnl/e+Vvpm3H8YwM9aNBYO3rzwkjs36Tjg965QKVtyX+vbvpt4FHteawat4VBTo4kCodG7fFlop54qvz8erf49jOG7rEds/jRjKbvJVA/VSe9HtLyrRMl6rKXLtpW5m1KPoSY0N4buefkojc4b86Tc0W4tFWPIHzhiZM2p4O15byZWAcFBwXEi4E5ya+A7/icxQ7RukmFlByV+2kUQlbBGa96xYv8LNp6jsnIsY5CUy4KWInSYkusWqbxi2cxMpMR1823A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Mlox/sFQ/wpSFEMCh671FMBqCXIgRSd8Fm/Mfenl9k=;
 b=SgAGP5canwMgvtspf8q6ZSoAkmeo/uqauY+/B6CUuODVhfUpfo0TmuWM4ChPPCbLZ2tlm8VGGlUexJJ+76ZLhPSSw9ipsqdE8e2rZAEteNdrr7KdjJGNNPVfrEITB8eZW3zuZxrWrmXWANQDFAOXi/IUrd+sXh0QMt2+kYvihf5v9iOzUptn0uLZ+paohIiMwgAGy1lduzj0eo5XTLZRu3YtES2McCI+sD6SMADoHye5T5WCiyKqrsD4K9l+xa+ZnplP5lQJqoO4c+R+PA4L0p7hJKlMP6KWO+yBtDniot4/d4vQZt4OPFzEP9//7CDgWmoIvCbjvVRVsPvErkx4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Mlox/sFQ/wpSFEMCh671FMBqCXIgRSd8Fm/Mfenl9k=;
 b=LSFTaGhG1ddbxwZNczs8SdYTGRqdCGBMwk9Gw+Acr4dg/K2LOymPgtyFik7BDIj7CLPdHqsfLCl36OS+X6YV7K9KR//CxPI4gGC64EjdqAiRy0x28mV1Pz33XT+N3WIYvv29WZVPKfWLOr7nWAFStTyG9CIRISpOm3nBO0ciQzHpIBVWRpjVMhCK1KnhDhMe7rcZcBcwkCp6Kfwv4UJGXKoYzdFN2Wzyf+gEJN6marn/O6HwmKe1LXCoddK2Z9yrqm3eVoz1D6P0k3AsHkYN6qkGr5YeQN+B/qpWxYNUqeiC9RcB6d6z7AYArVJKuMYqvjP6cVjadv2v8xlDjvZlEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9844.eurprd04.prod.outlook.com (2603:10a6:10:4c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 16:42:20 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 16:42:20 +0000
Date: Fri, 6 Feb 2026 11:42:12 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2] watchdog: imx7ulp_wdt: Keep WDOG running until A55
 enters WFI on i.MX94
Message-ID: <aYYZ5ByxOsJ9SjY9@lizhi-Precision-Tower-5810>
References: <20260206-imx94-wdog-v2-1-4dd725faec1f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-imx94-wdog-v2-1-4dd725faec1f@nxp.com>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9844:EE_
X-MS-Office365-Filtering-Correlation-Id: e4924728-a773-4b44-97da-08de659eb240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2LEz00PVYT2AxjMMk9vmP7f81YmpCKmMPEUeB86gEPzlDVl3Pda8AL+35lM8?=
 =?us-ascii?Q?W2PaaButwwK3mWgWSiSCpTm4umVwIfcZvMOIAo0dLP07UcfTCWsRhdbX3sKA?=
 =?us-ascii?Q?jFPqD6KwYqrRVQR/Ta6fv+Nd7BWubX4D7sjI7wTpOhcCLIh0rKOM5KAroy7p?=
 =?us-ascii?Q?pFB4XENnqTq+y+Z80GEfM2H4ZKsL9Mq9qsbCPw/w4uuLnlAmBvK4m0H+r/r8?=
 =?us-ascii?Q?QYqEB5Niru02PZFLPCj012vU9TjT9gqIFNs5RELUIRbiKVcMdIBuMTbGUbVp?=
 =?us-ascii?Q?TmKG+yYndqqFRQCR54zzwgxrBPp2ZkQC5BQUOVf8M8st/BPuqxPD2BmPDu2U?=
 =?us-ascii?Q?NCyVkHs1ZD1bFFwPOmPEL1fPMKqXQbgB5KJONpu42IiC0DWyLJMBfT8nXuC2?=
 =?us-ascii?Q?Y8PO6xg+EmJI46wbMXzLyrk6wKSJWaWlGfb29qs0rzQZQ1gOYK3KhwQ49IRH?=
 =?us-ascii?Q?rADIONZX9dQ8bhoQHrmQvu9G9fctcvWApveS9FHm9BRTf5wBxvNVAmNafLn5?=
 =?us-ascii?Q?dpvsqk7fg1r86e9Tz0bN/FYnULTR53bfOOJxFgVNfkgJmlkw/mkRoCrZyxi3?=
 =?us-ascii?Q?wuyvUN8P8xEU91oLlpzm/kE24ZjcHRBbeh3k5RsVOru2iQ+4AO2SWQ8DFxyo?=
 =?us-ascii?Q?QzdNxmzn+ftWM2YqqLRFAxS+4V9SkPX2950gt03ZlJwSO3OUUFURTTqjc2nT?=
 =?us-ascii?Q?W0RLByg+ytOqFonPfyQfl5y3pCbZBdyTVRL9P9IxNR2jBFgyqp0OIJNjb3Pg?=
 =?us-ascii?Q?+48EG+byCOr20hV7pXJiaF+B4BBzcDDQx9ojyqmMhAIhTiHY4gDcvuPGdgBO?=
 =?us-ascii?Q?2S9GeDHZqawvS7FZqbPM0HPpRu+WX6rXLOJkwnMraXuvmJIhdfHG9+HusKtp?=
 =?us-ascii?Q?zEjqnn9DTSeT2Ykj/8CX4F6UTvj8LqKFq7O1FEXmUnuG8Noq/QlXVbyR6Bpg?=
 =?us-ascii?Q?W+r7ZvBYxb+39X7Nv8UQen7joWhJfCWQhYvY72RmI9NU2RrA/C1L534jD3Fl?=
 =?us-ascii?Q?J/hCrUMzbsG1aspWkaS16PYIKJ+Y0j+WVVuWZXYbu+sFoL76BsXK2O+MgLUO?=
 =?us-ascii?Q?Uw9poLZUGA1VUEfoix859v28lLsRwpVn8wkfh4ok2sKpEyAsLxfO5JtFqGAp?=
 =?us-ascii?Q?FYmiMfILHF3f4Cxqyi32xE2CTRlWU1UI7+DaJvmyYIjwMhypweOSEEFkJK1s?=
 =?us-ascii?Q?Xa4X5G5ckdQHM+86gB2o7UA4QUI0A0I185m1q0ztZVzMp8ez/dp4AFYOnOIJ?=
 =?us-ascii?Q?bALzEbP1h8kGmUIiZxM/rVnJ1HPxx320UbxEENm2hxqqWYJKkuWihDLV/onu?=
 =?us-ascii?Q?cfp8pCmPw3itDeI4rTDQJrP36ov+1uRbOOoCmcOqWDDV4JmrY70PAV0SSwX9?=
 =?us-ascii?Q?/Z4jC4p7B7GHK6D8poBVVIGVlwYNaoN7mjeNI9F2Y5ma57suTHPRUWSGaPVM?=
 =?us-ascii?Q?PZikLkvlQ6Aauj6B499HHGBqyV72F15snMQSXQ/5ahJ5uSPg2jXon7vCqL26?=
 =?us-ascii?Q?ncXyGQkRvm/BXCxh0v6CzWhlMEFEmiM0oV8OPlGabXIiU0NIk6VihSLqG6bt?=
 =?us-ascii?Q?jJYptbd+3yPjL3MBScVld7fTkEeQX+J62XRoj1TNhvq8cR5xb1bGUjvCnbmN?=
 =?us-ascii?Q?pKzvgJdqOTsyBmfe9hoEZmo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pmhAiPTKTEaZar3dNAdqfR1CYFeKIEm5obBEHFa8hJekLSmPkiianxubWyMX?=
 =?us-ascii?Q?32Wm1BX8jLiBld+wrB9Vtsw1F+0yH8PaeFGaie7jdg6SHRIbvVzm9Q34VdBq?=
 =?us-ascii?Q?hTnXROaOSnc8GHzmp5unpggJAIlPL+/V2xrD+24bcnQF7GOwm0SjRn42E2K0?=
 =?us-ascii?Q?EdZywbeSFMV5T6p7Rvc1xsPWC5FT41klLmMerTT9lsWagi/mPhBqNaf4QYlx?=
 =?us-ascii?Q?L/UhTwyYco4v2jo5tyvKRWvvf7K2Pa6us+F389M4z8Y89LZr3RD/3vI5lJcf?=
 =?us-ascii?Q?UR8v4Abbnt1XUVkCj6afKGNl0MewXe4oy1rMtDWpueSNyYZ9nyUsSexxc5iH?=
 =?us-ascii?Q?V6p8GxQbOAC1aPjp/pBsYY2XVs8Mvz45Bg6Q/K+qBiJxSruCVZl/CZd3FV87?=
 =?us-ascii?Q?PoFjnb4Jg/ibrIeleoJPZG0tSMl5a85LeYKnVGnsOnjUylsIizWrLCvONbPC?=
 =?us-ascii?Q?WXFMBJ7CL6MDgAp3vKIWMaozQPoLfttu5vmSNlTPryNZLY1fUcCZNDROtpYt?=
 =?us-ascii?Q?KAy78PqufRmb4d2pWBtQ9NbH9iUb2cpoFKfe7zrE4lxm+zXNwV4Z6RBbnYLN?=
 =?us-ascii?Q?M0QSfpOaz92NWkEIdFcg3sBPKHisNPvDw9ZgJJdLQQmEHItPorCwVm8NSgRq?=
 =?us-ascii?Q?RggXzfl5XuJCnkSDJAqyW3QCQ72oh0bP7pVTSzufDeYpPOlw3S3PZYyhORWn?=
 =?us-ascii?Q?7tmaeMgpAu8AfJTJf2use5e9JxOwInI/yl7aM84c5oai9jKelHt+BmfUQwDs?=
 =?us-ascii?Q?RaSSHSe+B6slHKT0TFVEPtaNY7fNMlNYIzhmkejbm6Uu64n8TcFPlGl/L2bY?=
 =?us-ascii?Q?wWm65ymkxSQUX7Hl4yTtKySZAVeWdxl9ilScq7KAP7U5NB5CFSUtNEkCxXyV?=
 =?us-ascii?Q?mRS4fBzifucDs9fVvpS0pYwpBzYdOTrqE3Xp8Z4vTp6gR9bmisz3DGb23+WU?=
 =?us-ascii?Q?zvTuLCcJJj7j58qu5hJW8iQ57991uwePxu40MfvkvepK/S8NEvDh6qVhiSad?=
 =?us-ascii?Q?GRlsUXAH3lexS3dVrEUDvYeOncq5PhEC5ZlopNcRypcQopOWiPs4AmKny3/R?=
 =?us-ascii?Q?hPD96pcKJmka3BXiIUJPu9gXhWYzRcBFhJqzAaWaf4hgbvsz7i0JfP4s0cw0?=
 =?us-ascii?Q?1xX1FC9qL46KLY99tRgdnyQpnpdjN7HXu9CtEiCdyFIbh5wZ7r26zFEyePWd?=
 =?us-ascii?Q?cSJp21SchIodDZg8RzBfg5fEz6wOP6gfIZlDFt6UPdnKxBtBVJddVdyf6uYS?=
 =?us-ascii?Q?WOq9YNJ8H5o5daD4s37LaEnmzLMERHK3UHtJURb52SMYvs4zHKZjB+XMpeOz?=
 =?us-ascii?Q?cfrWSduYYICDEDVJ1lchDuuZMU2ZxKqMZUSTTY4z5vqeRjgmstH/nei54uCI?=
 =?us-ascii?Q?3xQ+fA4si5neOLVOt2sdIh4VykTWJEr5N+kccXIs/Ri0E98GnmMj0wTg9l7+?=
 =?us-ascii?Q?9KaT62r3ZtPPrz/UKFzRly2EBoUOjr52n2/aNVF4xa4drvHJh1MFNME2fdza?=
 =?us-ascii?Q?2vBeiUUChrJg+gThlnIxDVTB07CJsyKwTRDPD0zhZYOn48GaEHURyzen3CT6?=
 =?us-ascii?Q?mtrhnLfiYxza7+/uEUZq3Nx35l9HgX8S8kUSz10K8iaZxGgSsFqFoUTgS2XI?=
 =?us-ascii?Q?yQQ0u6Zm7lWaNpUg93wcYrsOcICzkwf9dO/8E49zJ8ZVF8kN7G+O4RCQII2x?=
 =?us-ascii?Q?f6LhVl96rl2BD4J9whRej5zqUsZWbYAHPoCoKQF7zjZNcW/u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4924728-a773-4b44-97da-08de659eb240
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:42:20.5424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuNoYmaaIluzJtB7Npw+Qb9bKvL5pozcmTtz1q2L+8onSxndpdgrcfanhmzwdt+7P/8xfq2+ewplmHZ+TTv4fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4911-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 6EB93100834
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 08:23:32AM +0800, Peng Fan (OSS) wrote:
> From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
>
> On i.MX94, watchdog sources clock from bus clock that will be always on
> during the lifecycle of Linux. There is a Low Power Clock Gating(LPCG)
> between the bus clock and watchdog, but the LPCG is not exported for
> software to control, it is hardware automatically controlled. When
> Cortex-A55 executes WFI during suspend flow, the LPCG will automatically
> gate off the clock to stop watchdog and resume clock when Cortex-A55 is
> woke up.
>
> So watchdog could always be alive to protect Linux, except Cortex-A
> platform WFI is executed in Linux suspend flow.
>
> Introduce a new hardware feature flag to indicate CPU low-power-mode
> auto clock gating support, and use it to avoid stopping the watchdog
> during suspend when LPCG can safely keep it running.
>
> Add i.MX94-specific watchdog hardware data and DT compatible entry to
> enable this behavior.
>
> Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> [peng.fan@nxp.com: rewrite commit log for clarity]
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes in v2:
> - Update commit log for clarity
> - Link to v1: https://lore.kernel.org/r/20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com
> ---
>  drivers/watchdog/imx7ulp_wdt.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 03479110453ce78a6a89ce8d351ba9ece2f5e2c5..0ae4c0c00138e89854f14edca0fd5fa84591c2d2 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -56,6 +56,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  struct imx_wdt_hw_feature {
>  	bool prescaler_enable;
>  	bool post_rcs_wait;
> +	bool cpu_lpm_auto_cg;
>  	u32 wdog_clock_rate;
>  };
>
> @@ -360,7 +361,8 @@ static int __maybe_unused imx7ulp_wdt_suspend_noirq(struct device *dev)
>  {
>  	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
>
> -	if (watchdog_active(&imx7ulp_wdt->wdd))
> +
> +	if (watchdog_active(&imx7ulp_wdt->wdd) && !imx7ulp_wdt->hw->cpu_lpm_auto_cg)
>  		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
>
>  	clk_disable_unprepare(imx7ulp_wdt->clk);
> @@ -408,10 +410,17 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
>  	.wdog_clock_rate = 125,
>  };
>
> +static const struct imx_wdt_hw_feature imx94_wdt_hw = {
> +	.prescaler_enable = true,
> +	.wdog_clock_rate = 125,
> +	.cpu_lpm_auto_cg = true,
> +};
> +
>  static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
>  	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
>  	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
>  	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
> +	{ .compatible = "fsl,imx94-wdt", .data = &imx94_wdt_hw, },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);
>
> ---
> base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> change-id: 20260203-imx94-wdog-1e0aa14d661b
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

