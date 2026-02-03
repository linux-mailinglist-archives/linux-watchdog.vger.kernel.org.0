Return-Path: <linux-watchdog+bounces-4891-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH5SLdQ4gmmVQgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4891-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 19:05:08 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F23DD4B1
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 19:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12778302D1D6
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 17:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935813659F4;
	Tue,  3 Feb 2026 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XPzd5P6y"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013040.outbound.protection.outlook.com [52.101.72.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF073659EB;
	Tue,  3 Feb 2026 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141555; cv=fail; b=ogfsfthS+QDof1lujV8UfB6K/rulM71S9Z+vF6CbLJrHnq8r1u5DlNy+f1E3ku10v6V+x2bleZqoF7wq9YnBGx/DsmA4J8nyWyDtXuR3EHXrUUCNCgC10Lc0arDQXN1kljeVrBiyvWkS33jlZA4NSMYsGfoN7EM6OS/jbtS+tEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141555; c=relaxed/simple;
	bh=Of+dWPOx0nHAU488YD/IzcNyyJAoh0fw4MkkzSXorD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TMH0IFgpWJ1Zz9ejYMhVuk9gxpRHG+P6VmM8JtFItZK9baYNhW0wge9EoSz/gz2BBYnsPXyjysQWiq/4Y/EUvyk0UlP2dWNPu+iaM1lPCGoatIwMPah4PyNwg4IPNl6NeaHN9/oWGeX2H50e9WqyGFh7bWFspo20J1miMIOHl4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XPzd5P6y; arc=fail smtp.client-ip=52.101.72.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhxzQ7d4r7IgBypTY4K8+SEqf/9t+DpJlVIae+HrN+wwfkK/LYO8RyPbjapUZguK6oIw3nLBYH6Z+INuA0ttRvlNoB3NvdwQOwJ2i2tAcuxgLGPQbQf8zyhkglul0yzcC4ee7kcoElv0PPyfWJ7VCw5Dx3VlZuXo8zjk+xBkRc0yDk2iMXuf5eNrVdBV+ds2+2+tFT5xv+vcDO6RkyjqDl55+rLgvTotol5lqCGc0611wl67HB6utlGlbk7b2RW4I/qozpU19UWbH/NiQ8+aGXeGM4+kEaXmOoJNLlVYc8R8l4f61a08w3xou2Cs5E5j704GOuqIfXyQ1/51BwcuZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Row8luLbxfl9XgeTXkwRjHxkhT5D8LoBOsVu6kl7xAY=;
 b=nz+ia7j/Azcxg8StwMTQvYWBR5qXSu0Ri+D4HceHGtZbEVTVdfyZsZy0woSLiVrhsnnaSMTRDZZB637WoEleUfaDqmqVBUP81ZoKlwmckBCf3M5kyQB9E8OZq121YkUU6b3pyrSKPmAKxHx/AG3SvzdPoSLtivnv/noA2iDUhcH6BVow3ESbYMawyv1MrSLKDv6SzA1IUzB7RBlJyCekaCZdTiiBUUCaP47e80sZ8QHkL3SLJCFloG0rLDxhrIgb2StQjhCEIQXpEPYmOnZQL69K/tcd1hdKNUec9rx01+RL5xaf8YIIsvUO54Wk6BHkFKEXrv8apbjXyq3i3wNUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Row8luLbxfl9XgeTXkwRjHxkhT5D8LoBOsVu6kl7xAY=;
 b=XPzd5P6y4Fe2lfOHMdQKTs3v8cB1OVMUvcnYnusVuiuuis3r7el7V4uKui9J3/Y0PtZbFZUfxh7Mm3ILbnRRXHKjAj/r/ew2VHjRD5QtMcgd9Cqk10spe2TOI8U4Zzw80r4p9M3zz2jDRzc2tZnasjC2fcuixMJGhONXfBmpxYfBE9xFPHcXe3fYPr4ok0ggujsEzYVE41kT+icNjaipaWsqckhcoYjGquiSiC4r4ABuCQaT3wWuxRPWOltYNhaV/pnOIQdCaGqDrwPXzUwepe/4A3arwvS+L6m0p5z49NHDmahZ1TW2r16HO0touLYlsHmZZhSs5YiZ+3t8/TfAFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10869.eurprd04.prod.outlook.com (2603:10a6:150:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:59:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:59:08 +0000
Date: Tue, 3 Feb 2026 12:59:01 -0500
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
Subject: Re: [PATCH] watchdog: imx7ulp_wdt: Keep WDOG running until A55
 enters WFI on i.MX94
Message-ID: <aYI3ZYYSfI1Gt1RT@lizhi-Precision-Tower-5810>
References: <20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com>
X-ClientProxiedBy: SA1P222CA0090.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10869:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fcbfb1-8be3-4ad2-fe20-08de634ded67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sv/4mRLiU7jrc5i+eRrppc+DZ3LeGRFb9FUdf3jXVrxLzYROXzRNtL7ajHDg?=
 =?us-ascii?Q?P7Ap/YekRY4Jrh5i2jScfHiuo0ujFrcljE2XK2VCUSiuAFVomaUNySrX+Yai?=
 =?us-ascii?Q?CtfLVXrZdqLxpgYglHoLBmRc48SHSOs7YqzW1mLAy0+irnnhPPArdul61gR7?=
 =?us-ascii?Q?y/NKYDQ4cL7ZjLz+2p4rncEWTnSMlxpbDPTOmk46Dbs9ob/kzmy570FtZzYd?=
 =?us-ascii?Q?/DEsalCub6yfBsYvINBUbREyFD9acpBUQEar6SCn5+ekvfKJpKpsZimnDAiE?=
 =?us-ascii?Q?7vSiy5KGmwhXPmp8lK0k40B42rK13HMAgpV+RGvxOaIcMQX1bj1O6TltXWCD?=
 =?us-ascii?Q?EYzqLHPMnal41jthHqW6qQi1qrSfuYYdA9NfzSOZL9N2Tdbud3yRwekYIzK4?=
 =?us-ascii?Q?ol6gWp2dxjsW6EodjsZUFAFVuL+ijjYovg07+/zlNSAwC6M7YF7WZ0BzyUB0?=
 =?us-ascii?Q?EAsXOynQ5b0DTbRjYaSnPnGsnLhnOlxSCIsUEptGmR/gHDZ6w/++IrcMiQ3W?=
 =?us-ascii?Q?APqeu993XBudMCgqEtfSEOmZYTJuT0C636f5YWq5LiAW6XFu6qi4cI6XyQjb?=
 =?us-ascii?Q?9FVG8g3DTDXrFBU2G+qfOcrPwRiSAUO1y+Sjg7JSJwGSdf5p3OQlIIHYkwPL?=
 =?us-ascii?Q?RcPkbx9cj994IP+qykAx/nH/X6z5OM57j3VieuADYleJ89xFtnZZ6ukFFfqC?=
 =?us-ascii?Q?+gY8vI/iyLxO+K3HmezAcRMIWtRBUI2By6IZtub0wesHPzGWqJ2jQRQZo6d2?=
 =?us-ascii?Q?LSf3dIPokxFXhMbenqPwk/igKvtCFEil2+ALOLrdYAPSduFAWcGMuQg3PZzs?=
 =?us-ascii?Q?bOdKVn3OkT8+q1xp3pCs8NZZKY7YpBDy4t8Jp46GjDFpMEvHPUtHoGwoMayZ?=
 =?us-ascii?Q?vGxe2jBWT+JZ+LGuiCjeqr/M/jbP7441y5g2kgR6JfP+uFYv/RSIZ6vglaEX?=
 =?us-ascii?Q?zq4uNUhi5v6absMUrMoRRT/QK62I7CiEnlLPvwD0RAahxjnEpSKCixEtJbMn?=
 =?us-ascii?Q?Zc/0NfTgwAj94zxpzB0eDGFPY2Hpl3Lv//wu1BO073WSqy90DKVeKWHXiJ7F?=
 =?us-ascii?Q?2wdMDP9mJJ+3lE3Bo9Kj0V73+bv2lTT3Vzrje6DjFic1+IBt450I0Hjro3XL?=
 =?us-ascii?Q?djtNAYpZ/RTcKO1ifDyCRT0TT8WCKeMfCtkhw5g55wWuLQ91FTiJ3H7JYTeC?=
 =?us-ascii?Q?kUKQuKJTlDyrIyhXz3yMwSSGc+ELxD+e9kqkC7oFIZC4ZOvLT3zf1FQUd/8F?=
 =?us-ascii?Q?+KEK2ziq4AXrKnZsfDi8JxGPPVVSw2GmfR88Gymtda/3F/DaL2zMumWVRj+K?=
 =?us-ascii?Q?d4f+fPpdP/9Qbzo48k0PJRqOPov86iZJkXNIsIvpdXAQ7eOsDwQPMw0wFoiS?=
 =?us-ascii?Q?kGF9couKPcA41YbpUEqoQtVjSg7ggkeJbe9z7PKpIE2fl2EB8W8RK1rQiiv/?=
 =?us-ascii?Q?KRWXLNa5/ZwIDEh87ve1RZHg6FzwwPJSgXB0BdU3n6Gt6p4hjN7REgjlWt9N?=
 =?us-ascii?Q?ph4rzLZWVkA0MbzqMMu1vpqJxwNeKOidE+b5jL9SWKvQREM2nEftaR3l36+c?=
 =?us-ascii?Q?qEODTuW+9m82jggqEaGpwv1efqV1uPy9rK91UVkJ+qDugZFohwbemORKTZto?=
 =?us-ascii?Q?2BEWbpgumm0+rypwX3gkoyM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BJ+d66uDOaOlTq/H6zvWhxSaE4L/htKso8r+WvFAoakgwIYwNmD5f8SbXLmm?=
 =?us-ascii?Q?dCxx+eX7i//ifPlzgoWX0eOfr0o/E4uHC48GHQ1AW4NduKtiqT5A/Phu1l6v?=
 =?us-ascii?Q?F/ljHPbDmPNhGO5+uAYCRzl/+b1hpXPceHCxz0XpY2wnthmvVgIV+8nPutWL?=
 =?us-ascii?Q?1a4sUewbw7aGDSOywHqXE617+3dN8Gc0SspvDbm8jg7J9kE30oShLGZtvSAP?=
 =?us-ascii?Q?edGU8VL1trYKJUe1jKJ8W3Dujmh9Xj6jT/iAzqn5ajjKNB9IJYrmZn8fpPsp?=
 =?us-ascii?Q?nX0XBdZUJEcZmunzyyN3DYRbu9DzI5B2jr6vus6EP3G7anmMN5hDFoQW2JZi?=
 =?us-ascii?Q?ctNmWszXbwbDgTMEzYOOBEJ1Q2dVuC3MtCw6I6epkT+MWEu/bBfLJ8TrcNZs?=
 =?us-ascii?Q?DaU0NYnvxqbFGwNiXzVb2jwSC3LQMIt/fHArrt/QyxjUGk6qu4l/QVNUuONP?=
 =?us-ascii?Q?+D7qQZp51bQgTD0O0WH4EPwaNFR9324b6cXvc5fLNaXUFcZxx7GYMXrP36jf?=
 =?us-ascii?Q?/od6rEj0Tei2UCZ+tglNzsPU/9G28YIsBh8H9pkt7Ae/1lVFbqQTB80R5Lg/?=
 =?us-ascii?Q?xcFpAPq4cfFmAiyBAoQqdn7OLSbk3eeCRTBZg3xCdf7fSNN2T3cVnsOwnwkp?=
 =?us-ascii?Q?0PhoB1rN/+ym1hkHXFer2lb+jxyZBo+KHzZGg3bIYZfVZRf6cU8qX9SzlGq7?=
 =?us-ascii?Q?GsGjz20/XgZZ4UamVsfwsV5/V3R9xE89P6ARE3D9tTHQJCHl3OTeFOM4DxgN?=
 =?us-ascii?Q?GjKlEIcO93kweNojMQ0GF4P+Xbiagy/pwcsbI0lSvutzWozFdVbnG7QbKxMP?=
 =?us-ascii?Q?YGAE42IPMstbQgKTNzfHsBm27v6fCgA4u/RUUrN8tLo+O72xsMgxh9tr0ZqV?=
 =?us-ascii?Q?RBjpkDHmcrb0+6IeGHlwqH7XSSmvYPz9RrD0eN6+Py3B5EKiGR43TX35ls66?=
 =?us-ascii?Q?oOeX7iOLLi38jJ2iNFQmDAgAYYr4uXddNEJq4DV9cn3gWytj+rPWVOvW2IhQ?=
 =?us-ascii?Q?AF9WeaXS0tQbSz29lOLgAJaorijLR828x9mekHr0BbGNMOqoKy3uQ9ZfmcGM?=
 =?us-ascii?Q?rtc5/1WT8jr8Vy0X6KYGNSUhJ74H9RxgDHI9qPwp3UnIzgOgySLAYm4zXVuI?=
 =?us-ascii?Q?ZcFKMMr52K7gjGeKj/Ph6bgDXQ8cp602cl69szIV6bl1+ci8jGyaztBYq8oN?=
 =?us-ascii?Q?8DLs6x622ie9A52iqTtSK+slKtGTYIR9Z/7q5XZW8vzb50fucyd39zzcQins?=
 =?us-ascii?Q?ajyCq+kws8q2ORcIKeabSKBi5mbhWsKonIBnL41rDKWNu68IDqlXgkouVZxO?=
 =?us-ascii?Q?osMqTzs04AggFBzCX8SWpzPJqrEWfXkQgpjBlMy73WelGdkCfBcQTNLkPMXA?=
 =?us-ascii?Q?4C4ijxoUZL//b//1PWp8c46y6IpT6jkafaLxGEKItNVG2MiV5Aaae+viN6IV?=
 =?us-ascii?Q?WDNRHt731KhRtw7qytRpnoT4VSddicDnydak/RS0s7DYcMyAKDzzoRklQKKy?=
 =?us-ascii?Q?Bga34zEYSybdA7ZNpvSzKhqKtspvifHbFaYgAnWQh2CtPZobsZMYNce81hgR?=
 =?us-ascii?Q?w9BEOoBiEaX+Oqh/lGjnRK43R4FA3BC7H1eTYRBQb9EDlFtZv8DzGQebnqPb?=
 =?us-ascii?Q?9CiFcknd65Bd7TdAC70yqajVNhty3NtvqK5L0961cOJprGJv6bMrIxEpeC7m?=
 =?us-ascii?Q?RvezOrzLYmqpTza/qITg07cujuqWHiWwBW5qCpgnQHpxbuZTpnJlwj+qyqOR?=
 =?us-ascii?Q?17wh7nbFyg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fcbfb1-8be3-4ad2-fe20-08de634ded67
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:59:08.1705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3dDuJJ9Tm8tuIwQiYU2bqEsq8MbFlxoAWpZG9QrvYIon5lzmU69oZQjd6mxmoV75WpIDinkuDUutEzW9MZmMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10869
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4891-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D7F23DD4B1
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:05:47PM +0800, Peng Fan (OSS) wrote:
> From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
>
> On i.MX94, watchdog sources clock from bus clock that will be always on
> during the lifecycle of Linux. There is a Low Power Clock Gating(LPCG)
> between the bus clock and watchdog, but the LPCG is not exported for
> software to control, it is hardware automatically controlled. When
> Cortex-A55 executes WFI during suspend flow, the LPCG will automatically
> gate off the clock stop watchdog.
>
> So watchdog could always be alive to protect Linux, until WFI is executed.

suppose only after suspend's WFI? suppose CPUIDLE's WFI doesn't affect it?

Frank
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

